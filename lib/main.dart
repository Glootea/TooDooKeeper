import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:yandex_summer_school/common/data/data_sources/local_database/local_database.dart';
import 'package:yandex_summer_school/common/data/providers/todo.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';
import 'package:yandex_summer_school/screens/todo_edit/bloc/bloc.dart';
import 'package:yandex_summer_school/screens/todo_edit/screen.dart';
import 'package:yandex_summer_school/screens/todo_list/bloc/bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/screen.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      usePathUrlStrategy();
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
        ),
      );
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      final localDatabase = AppDatabase();
      final todoProvider = ToDoProvider(localDatabase: localDatabase);

      final router = GoRouter(
        initialLocation: '/',
        redirect: (context, state) {
          if (state.path == '/edit' && !state.uri.queryParameters.containsKey('data')) {
            return '/new';
          }
          return null;
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => BlocProvider(
              create: (context) => ToDoListBloc(ToDoProvider(localDatabase: localDatabase)),
              child: const TodoListScreen(),
            ),
            routes: [
              GoRoute(
                path: 'edit/:id',
                builder: (context, state) {
                  logger.d(state.pathParameters);
                  final idString = state.pathParameters['id'];
                  if (idString == null) {
                    return const TodoListScreen();
                  }
                  final id = int.parse(idString);
                  return BlocProvider(
                    create: (context) => ToDoEditBloc(todoProvider: todoProvider, passedId: id),
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
                    create: (context) => ToDoEditBloc(todoProvider: todoProvider, data: data),
                    child: const ToDoEditScreen(),
                  );
                },
              ),
              GoRoute(
                path: 'new',
                builder: (context, state) => BlocProvider(
                  create: (context) => ToDoEditBloc(todoProvider: todoProvider),
                  child: const ToDoEditScreen(),
                ),
              ),
            ],
          ),
        ],
      );

      final brightness = PlatformDispatcher.instance.platformBrightness;
      final themeBloc = ThemeBloc(brightness);
      final theme = themeBloc.state;
      final app = MultiBlocProvider(
        providers: [
          BlocProvider.value(value: themeBloc),
        ],
        child: MaterialApp.router(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            brightness: PlatformDispatcher.instance.platformBrightness,
            scaffoldBackgroundColor: theme.backColors.primary,
            snackBarTheme: SnackBarThemeData(
              contentTextStyle: theme.textTheme.body,
              backgroundColor: theme.backColors.secondary,
            ),
            dividerColor: theme.supportColors.separator,
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ),
      );

      runApp(app);
    },
    (o, s) => logger.f(o, stackTrace: s),
  );
}

final Logger logger = Logger();
