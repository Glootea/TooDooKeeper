import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/ui/complex/tappable_box.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';

class ImportanceSelector extends StatefulWidget {
  const ImportanceSelector({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final Importance value;
  final void Function(Importance? value) onChanged;

  @override
  State<ImportanceSelector> createState() => _ImportanceSelectorState();
}

class _ImportanceSelectorState extends State<ImportanceSelector> {
  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;

    return ComplexTappableBox(
      builder: (context, actionKey) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.importance,
            style: todoTheme.textTheme.body,
          ),
          DropdownButton<Importance>(
            key: actionKey,
            value: widget.value,
            onChanged: widget.onChanged,
            underline: const SizedBox(),
            items: [
              DropdownMenuItem(
                value: Importance.basic,
                child: Text(
                  AppLocalizations.of(context)!.none,
                  style: todoTheme.textTheme.body,
                ),
              ),
              DropdownMenuItem(
                value: Importance.low,
                child: Row(
                  children: [
                    SizedBox(
                      height: todoTheme.textTheme.body.fontSize,
                      child: Image.asset(
                        'assets/down-arrow.png',
                        color: todoTheme.definedColors.gray,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.low,
                      style: todoTheme.textTheme.body,
                    ),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: Importance.important,
                child: Row(
                  children: [
                    SizedBox(
                      height: Checkbox.width,
                      child: Image.asset('assets/double-exclamation-mark.png'),
                    ),
                    Text(
                      AppLocalizations.of(context)!.high,
                      style: todoTheme.textTheme.body.copyWith(color: todoTheme.definedColors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
