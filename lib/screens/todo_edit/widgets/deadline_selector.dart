import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/components/complex/tappable_box.dart';
import 'package:yandex_summer_school/components/leaf/switch.dart';
import 'package:yandex_summer_school/domain/todo.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

class DeadlineSelector extends StatefulWidget {
  const DeadlineSelector({required this.deadline, super.key});

  final DateTime? deadline;

  @override
  State<DeadlineSelector> createState() => _DeadlineSelectorState();
}

class _DeadlineSelectorState extends State<DeadlineSelector> {
  void onChanged(bool value) {
    if (value) {
      showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
        initialDate: DateTime.now(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;

    return TappableBox(
      onTap: () => onChanged(widget.deadline == null),
      builder: (context, actionKey) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Сделать до', style: todoTheme.textTheme.body),
              ToDoSwitch(value: widget.deadline != null, key: actionKey, onChanged: onChanged),
            ],
          ),
          if (widget.deadline != null)
            Text(
              widget.deadline.toString(), // TODO: convert to date string with month name
              style: todoTheme.textTheme.body.copyWith(color: todoTheme.definedColors.blue),
            ),
        ],
      ),
    );
  }
}
