import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/core/extensions/l10n_extension.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';

class CreateTodoItem extends StatelessWidget {
  const CreateTodoItem({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    return InkWell(
      onTap: onTap,
      child: ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 24 + Checkbox.width, bottom: 16, top: 16,),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              context.loc.create,
              style: todoTheme.textTheme.body
                  .copyWith(color: todoTheme.labelTheme.tertiary),
            ),
          ),
        ),
      ),
    );
  }
}
