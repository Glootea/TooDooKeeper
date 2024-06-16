import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

class ToDoIcon extends StatelessWidget {
  const ToDoIcon({required this.icon, this.color, this.size, super.key});

  final IconData icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final resultSize = size ?? 24;
    final resultColor = color ?? context.watch<ThemeBloc>().state.labelTheme.primary;

    return Icon(
      icon,
      size: MediaQuery.of(context).textScaler.scale(resultSize),
      color: resultColor,
    );
  }
}
