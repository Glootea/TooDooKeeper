import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yandex_summer_school/common/entities/todo.dart';
import 'package:yandex_summer_school/common/ui/complex/tappable_box.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';

class ImportanceSelector extends StatefulWidget {
  const ImportanceSelector({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final Importance? value;
  final void Function(Importance? value) onChanged;

  @override
  State<ImportanceSelector> createState() => _ImportanceSelectorState();
}

class _ImportanceSelectorState extends State<ImportanceSelector> {
  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;

    return TappableBox(
      builder: (context, actionKey) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.importance,
            style: todoTheme.textTheme.body,
          ),
          DropdownButton<Importance?>(
            key: actionKey,
            value: widget.value,
            onChanged: widget.onChanged,
            underline: const SizedBox(),
            items: [
              DropdownMenuItem(
                child: Text(
                  AppLocalizations.of(context)!.none,
                  style: todoTheme.textTheme.body,
                ),
              ),
              DropdownMenuItem(
                value: Importance.low,
                child: Text(
                  AppLocalizations.of(context)!.low,
                  style: todoTheme.textTheme.body,
                ),
              ),
              DropdownMenuItem(
                value: Importance.high,
                child: Text(
                  AppLocalizations.of(context)!.high,
                  style: todoTheme.textTheme.body,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
