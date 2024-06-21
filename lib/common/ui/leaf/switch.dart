import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';

class ToDoSwitch extends StatelessWidget {
  const ToDoSwitch({required this.value, required this.onChanged, super.key});
  final bool value;
  final void Function(bool newValue) onChanged;

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;

    return Theme(
      data: ThemeData(useMaterial3: false),
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: todoTheme.definedColors.blue,
        inactiveTrackColor: todoTheme.supportColors.overlay,
        inactiveThumbColor: todoTheme.backColors.elevated,
      ),
    );
  }
}
