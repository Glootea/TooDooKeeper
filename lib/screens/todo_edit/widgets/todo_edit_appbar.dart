import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/core/extensions/l10n_extension.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';
import 'package:yandex_summer_school/screens/todo_edit/bloc/todo_edit_bloc.dart';

class ToDoEditAppbar extends PreferredSize {
  ToDoEditAppbar({
    super.key,
  }) : super(
          preferredSize: AppBar().preferredSize,
          child: const SizedBox(),
        );

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    final bloc = context.read<ToDoEditBloc>();
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: () => context.go('/'), icon: const Icon(Icons.close_outlined)),
      actions: [
        TextButton(
          onPressed: () => bloc.add(const SaveEvent()),
          child: Text(
            context.loc.save,
            style: todoTheme.textTheme.button.copyWith(color: todoTheme.definedColors.blue),
          ),
        ),
      ],
    );
  }
}
