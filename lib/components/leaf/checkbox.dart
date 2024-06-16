import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';
import 'package:yandex_summer_school/todo_state.dart';

class ToDoCheckbox extends StatelessWidget {
  const ToDoCheckbox({
    required this.value,
    required this.onChanged,
    this.importance,
    super.key,
  });

  final bool value;
  final void Function(bool? newValue) onChanged;
  final Importance? importance;

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    final resultColor = importance == Importance.high ? todoTheme.definedColors.red : todoTheme.backColors.secondary;

    return Checkbox(
      value: value,
      onChanged: onChanged,
      fillColor: WidgetStatePropertyAll(resultColor),
      side: BorderSide(color: todoTheme.labelTheme.tertiary, width: 2),
    );
  }
}
