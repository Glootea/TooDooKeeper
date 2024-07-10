import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/core/entities/importance.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';

class ToDoCheckbox extends StatelessWidget {
  const ToDoCheckbox({
    required this.value,
    required this.onChanged,
    required this.importance,
    super.key,
  });

  final bool value;
  final void Function(bool? newValue) onChanged;
  final Importance? importance;

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    final fillColor = value
        ? todoTheme.definedColors.green
        : importance == Importance.important
            ? todoTheme.definedColors.red.withOpacity(0.5)
            : todoTheme.backColors.secondary;
    final borderColor =
        importance == Importance.important ? todoTheme.definedColors.red : todoTheme.labelTheme.tertiary;

    return SizedBox(
      // [SizedBox] to prevent margin
      height: Checkbox.width,
      width: Checkbox.width,
      child: Checkbox(
        key: const ValueKey('ImportanceCheckbox'),
        value: value,
        onChanged: onChanged,
        fillColor: WidgetStatePropertyAll(fillColor),
        side: BorderSide(
          color: borderColor,
          width: 2,
        ),
      ),
    );
  }
}
