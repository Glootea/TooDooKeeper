import 'dart:async';
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
import 'package:yandex_summer_school/core/data/providers/device_id_provider.dart';
import 'package:yandex_summer_school/core/data/providers/online/online_provider_abst.dart';
import 'package:yandex_summer_school/core/data/providers/online/yandex_online_provider.dart';
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
    () => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: InitScreen())),
    (o, s) => logger.f(o, stackTrace: s),
  );
}

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});
  Future<void> init() async {
    await _appSetup();
    const secureStorage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
    final deviceIdProvider = await DeviceIdProvider.create(storage: secureStorage);
    final OnlineProvider onlineProvider = await YandexOnlineProvider.create(deviceIdProvider, secureStorage);
    final localDatabase = LocalDatabase();
    final todoRepository = ToDoRepository(
      localDatabase: localDatabase,
      onlineProvider: onlineProvider,
      deviceIdProvider: deviceIdProvider,
    );

    final router = _createRouter(todoRepository, deviceIdProvider, onlineProvider.auth.isLoggedIn);
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

  GoRouter _createRouter(ToDoRepository todoRepository, DeviceIdProvider deviceIdProvider, bool userLoggedIn) {
    return GoRouter(
      initialLocation: userLoggedIn ? '/' : '/auth',
      redirect: (context, state) {
        if (state.path == '/edit' && !state.uri.queryParameters.containsKey('data')) return '/new';
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
          routes: _editRoutes(todoRepository, deviceIdProvider),
        ),
      ],
    );
  }

  List<RouteBase> _editRoutes(ToDoRepository todoRepository, DeviceIdProvider deviceIdProvider) {
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
            create: (context) =>
                ToDoEditBloc(todoRepository: todoRepository, deviceIdProvider: deviceIdProvider, passedId: id),
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
            create: (context) =>
                ToDoEditBloc(todoRepository: todoRepository, deviceIdProvider: deviceIdProvider, data: data),
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
      pageTransitionsTheme:
          const PageTransitionsTheme(builders: {TargetPlatform.android: PredictiveBackPageTransitionsBuilder()}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
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
