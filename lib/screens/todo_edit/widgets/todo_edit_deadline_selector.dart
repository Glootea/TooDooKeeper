import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yandex_summer_school/core/ui/complex/tappable_box.dart';
import 'package:yandex_summer_school/core/ui/leaf/date_text.dart';
import 'package:yandex_summer_school/core/ui/leaf/switch.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';

class DeadlineSelector extends StatefulWidget {
  const DeadlineSelector({required this.value, required this.onChanged, super.key});
  final DateTime? value;
  final void Function(DateTime?) onChanged;

  @override
  State<DeadlineSelector> createState() => _DeadlineSelectorState();
}

class _DeadlineSelectorState extends State<DeadlineSelector> {
  Future<void> _onChanged(bool requiresDate) async {
    final todoTheme = context.read<ThemeBloc>().state;
    final today = DateTime.now();
    final newDate = requiresDate
        ? await showDatePicker(
            context: context,
            firstDate: today,
            lastDate: today.add(const Duration(days: 365)),
            initialDate: today,
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme.copyWith(primary: todoTheme.definedColors.blue),
                  // ignore: deprecated_member_use
                  useMaterial3: false,
                ),
                child: child!,
              );
            },
          )
        : null;
    widget.onChanged(newDate);
  }

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;

    return SimpleTappableBox(
      onTap: () => _onChanged(widget.value == null),
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.deadline, style: todoTheme.textTheme.body),
              ToDoSwitch(value: widget.value != null, onChanged: _onChanged),
            ],
          ),
          if (widget.value != null) ...[ToDoDateText(value: widget.value!), const SizedBox(height: 8)],
        ],
      ),
    );
  }
}
