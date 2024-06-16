import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:yandex_summer_school/common/ui/complex/tappable_box.dart';
import 'package:yandex_summer_school/common/ui/leaf/switch.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';

class DeadlineSelector extends StatefulWidget {
  const DeadlineSelector({required this.value, required this.onChanged, super.key});
  final DateTime? value;
  final void Function(DateTime?) onChanged;

  @override
  State<DeadlineSelector> createState() => _DeadlineSelectorState();
}

class _DeadlineSelectorState extends State<DeadlineSelector> {
  Future<void> _onChanged(bool requiresDate) async {
    final newDate = requiresDate
        ? await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            initialDate: DateTime.now(),
          )
        : null;
    widget.onChanged(newDate);
  }

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;

    return TappableBox(
      onTap: () => _onChanged(widget.value == null),
      builder: (context, actionKey) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.deadline, style: todoTheme.textTheme.body),
              ToDoSwitch(value: widget.value != null, key: actionKey, onChanged: _onChanged),
            ],
          ),
          if (widget.value != null)
            Text(
              DateFormat.yMMMd().format(widget.value!),
              style: todoTheme.textTheme.body.copyWith(color: todoTheme.definedColors.blue),
            ),
        ],
      ),
    );
  }
}
