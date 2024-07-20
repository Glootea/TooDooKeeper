import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yandex_summer_school/core/data/data_sources/local_database/local_database.dart';
import 'package:yandex_summer_school/core/data/data_sources/obfuscation/gzip_obfuscation.dart';
import 'package:yandex_summer_school/core/data/providers/device_id_provider.dart';
import 'package:yandex_summer_school/core/data/providers/online/online_provider_abst.dart';
import 'package:yandex_summer_school/core/data/providers/online/yandex_online_provider.dart';
import 'package:yandex_summer_school/core/data/providers/share_provider.dart';
import 'package:yandex_summer_school/core/data/repositories/todo_repository.dart';
import 'package:yandex_summer_school/core/logger.dart';
import 'package:yandex_summer_school/core/ui/theme/theme.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';
import 'package:yandex_summer_school/screens/auth_screen.dart';
import 'package:yandex_summer_school/screens/todo_edit/bloc/todo_edit_bloc.dart';
import 'package:yandex_summer_school/screens/todo_edit/todo_edit_screen.dart';
import 'package:yandex_summer_school/screens/todo_list/bloc/todo_list_bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/todo_list_screen.dart';

void main() {
  runZonedGuarded(
    () {
      runApp(
        const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: InitScreen(),
        ),
      );
    },
    (o, s) => logger.f(o, stackTrace: s),
  );
}

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});
  Future<void> init() async {
    await Future.wait([_appSetup(), _setupFirebase()]);
    _setupCrashlytics();

    const secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
    final deviceIdProvider =
        await DeviceIdProvider.create(storage: secureStorage);
    final OnlineProvider onlineProvider =
        await YandexOnlineProvider.create(deviceIdProvider, secureStorage);
    final localDatabase = LocalDatabase();
    final firebaseAnalytics = FirebaseAnalytics.instance;

    final todoRepository = ToDoRepository(
      localDatabase: localDatabase,
      onlineProvider: onlineProvider,
      deviceIdProvider: deviceIdProvider,
      firebaseAnalytics: firebaseAnalytics,
    );
    final shareProvider = ShareProvider(obfuscation: GZipObfuscation());
    final router = _createRouter(
      todoRepository: todoRepository,
      deviceIdProvider: deviceIdProvider,
      shareProvider: shareProvider,
      userLoggedIn: onlineProvider.auth.isLoggedIn,
    );
    final themeBloc = ThemeBloc();

    // Attempt to fix: https://github.com/Glootea/TooDooKeeper/pull/2#discussion_r1650971004
    //
    // According to docs, multiple runApp equals to calling setState of StatefulWidget,
    // so nothing wrong/complicated is happening as small/light [InitScreen] is removed
    // from tree and new tree is inserted just like it would be in case of pure app start
    runApp(
      Provider.value(
        value: onlineProvider,
        child: BlocProvider.value(
          value: themeBloc,
          child: _createApp(themeBloc, router),
        ),
      ),
    );
  }

  Future<void> _appSetup() async {
    WidgetsFlutterBinding.ensureInitialized();
    usePathUrlStrategy();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  Future<List<void>> _setupFirebase() async {
    await Firebase.initializeApp();
    final remoteConfig = FirebaseRemoteConfig.instance;
    final remoteConfigConfiguration = remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    return Future.wait([remoteConfigConfiguration]);
  }

  void _setupCrashlytics() {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  GoRouter _createRouter({
    required ToDoRepository todoRepository,
    required DeviceIdProvider deviceIdProvider,
    required ShareProvider shareProvider,
    required bool userLoggedIn,
  }) {
    return GoRouter(
      initialLocation: userLoggedIn ? '/' : '/auth',
      redirect: (context, state) {
        if (state.path == '/edit' &&
            !state.uri.queryParameters.containsKey('data')) return '/new';
        return null;
      },
      routes: [
        GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
        GoRoute(
          path: '/',
          builder: (context, state) => BlocProvider(
            create: (context) => ToDoListBloc(todoRepository),
            child: const TodoListScreen(),
          ),
          routes: _editRoutes(
              todoRepository: todoRepository,
              deviceIdProvider: deviceIdProvider,
              shareProvider: shareProvider),
        ),
      ],
    );
  }

  List<RouteBase> _editRoutes({
    required ToDoRepository todoRepository,
    required DeviceIdProvider deviceIdProvider,
    required ShareProvider shareProvider,
  }) {
    return [
      GoRoute(
        path: 'edit/:id',
        builder: (context, state) {
          logger.d(state.pathParameters);
          final id = state.pathParameters['id'];
          if (id == null) {
            return const TodoListScreen();
          }
          return BlocProvider(
            create: (context) => ToDoEditBloc(
              todoRepository: todoRepository,
              deviceIdProvider: deviceIdProvider,
              shareProvider: shareProvider,
              passedId: id,
            ),
            child: const ToDoEditScreen(),
          );
        },
      ),
      GoRoute(
        path: 'edit',
        builder: (context, state) {
          logger.d(state.pathParameters);
          final data = state.uri.queryParameters['data']; // from deep link
          return BlocProvider(
            create: (context) => ToDoEditBloc(
              todoRepository: todoRepository,
              deviceIdProvider: deviceIdProvider,
              shareProvider: shareProvider,
              data: data,
            ),
            child: const ToDoEditScreen(),
          );
        },
      ),
      GoRoute(
        path: 'new',
        builder: (context, state) => BlocProvider(
          create: (context) => ToDoEditBloc(
            todoRepository: todoRepository,
            deviceIdProvider: deviceIdProvider,
            shareProvider: shareProvider,
          ),
          child: const ToDoEditScreen(),
        ),
      ),
    ];
  }

  Widget _createApp(ThemeBloc themeBloc, GoRouter router) {
    return StreamBuilder(
      stream: themeBloc.stream,
      builder: (context, snapshot) => MaterialApp.router(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: _createTheme(snapshot.data ?? themeBloc.state),
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  ThemeData _createTheme(ToDoTheme theme) {
    return ThemeData(
      brightness: PlatformDispatcher.instance.platformBrightness,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: theme.definedColors.blue,
      ),
      scaffoldBackgroundColor: theme.backColors.primary,
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: theme.textTheme.body,
        backgroundColor: theme.backColors.secondary,
      ),
      dividerColor: theme.supportColors.separator,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
