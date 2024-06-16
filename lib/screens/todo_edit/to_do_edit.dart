import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/components/leaf/todo_edit_textfield.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/deadline_selector.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/importance_selector.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';
import 'package:yandex_summer_school/todo_state.dart';

class ToDoEditScreen extends StatelessWidget {
  const ToDoEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.close_outlined)),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Сохранить',
              style: todoTheme.textTheme.body.copyWith(color: todoTheme.definedColors.blue),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const ToDoEditTextField(),
            const SizedBox(height: 16),
            ImportanceSelector(onChanged: (value) {}),
            const Divider(),
            DeadlineSelector(state: ToDoState(text: '', done: false, deadline: DateTime.now())),
            const Divider(),
            const SizedBox(height: 16),
            DeleteButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    required this.onPressed,
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;

    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(Icons.delete, color: todoTheme.definedColors.red),
            const SizedBox(width: 8),
            Text(
              'Удалить',
              style: todoTheme.textTheme.body.copyWith(color: todoTheme.definedColors.red),
            ),
          ],
        ),
      ),
    );
  }
}
