import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/components/complex/tappable_box.dart';
import 'package:yandex_summer_school/domain/todo.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

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
          Text('Важность', style: todoTheme.textTheme.body),
          DropdownButton<Importance?>(
            key: actionKey,
            value: widget.value,
            onChanged: widget.onChanged,
            underline: const SizedBox(),
            items: [
              DropdownMenuItem(
                child: Text('Нет', style: todoTheme.textTheme.body),
              ),
              DropdownMenuItem(
                value: Importance.low,
                child: Text(
                  'Низкая',
                  style: todoTheme.textTheme.body,
                ),
              ),
              DropdownMenuItem(
                value: Importance.high,
                child: Text(
                  'Высокая',
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
