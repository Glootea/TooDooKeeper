import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';

class CreateTodoItem extends StatelessWidget {
  const CreateTodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    return InkWell(
      onTap: () => context.pushReplacement('/new'),
      child: ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(left: 24 + Checkbox.width, bottom: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              AppLocalizations.of(context)!.create,
              style: todoTheme.textTheme.body.copyWith(color: todoTheme.labelTheme.tertiary),
            ),
          ),
        ),
      ),
    );
  }
}
