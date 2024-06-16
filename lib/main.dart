import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/screens/todo_list_screen.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    return BlocProvider(
      create: (context) => ThemeBloc(brightness),
      child: MaterialApp(
        theme: ThemeData(brightness: brightness),
        home: const TodoListScreen(),
      ),
    );
  }
}
