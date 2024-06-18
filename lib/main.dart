import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:yandex_summer_school/screens/todo_edit/to_do_edit.dart';
import 'package:yandex_summer_school/screens/todo_list/todo_list.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
        ),
      );
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      runApp(const MyApp());
    },
    (o, s) => logger.f(o, stackTrace: s),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    return BlocProvider(
      create: (context) => ThemeBloc(brightness),
      child: MaterialApp.router(
        theme: ThemeData(brightness: brightness),
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

final Logger logger = Logger();
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const TodoListScreen(),
      routes: [
        GoRoute(
          path: 'edit/:id',
          builder: (context, state) {
            final idString = state.pathParameters['id'];
            final data = state.uri.queryParameters['data']; // from deep link
            if (idString == null) {
              return const TodoListScreen();
            }
            final id = int.parse(idString);
            return ToDoEditScreen(id: id, data: data);
          },
        ),
      ],
    ),
  ],
);
