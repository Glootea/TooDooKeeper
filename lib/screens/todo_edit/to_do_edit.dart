import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/components/complex/error_screen.dart';
import 'package:yandex_summer_school/components/leaf/todo_edit_textfield.dart';
import 'package:yandex_summer_school/domain/todo.dart';
import 'package:yandex_summer_school/main.dart';
import 'package:yandex_summer_school/screens/todo_edit/bloc/bloc.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/deadline_selector.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/importance_selector.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

class ToDoEditScreen extends StatelessWidget {
  const ToDoEditScreen({this.id, this.data, super.key});
  final int? id;
  final String? data; // TODO: parse data from url

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoEditBloc, ToDoEditState>(
      listener: (context, state) {
        if (state is SaveState) {
          context.pop();
        }
      },
      builder: (context, state) {
        logger.d('Received state: $state');
        switch (state) {
          case MainState():
            return _buildMain(context);
          case LoadingState():
            return _buildLoading();
          case ErrorState():
            return ErrorScreen(state.error);
          case SaveState():
            return const Scaffold();
        }
      },
    );
  }

  Scaffold _buildMain(BuildContext context) {
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
            BlocSelector<ToDoEditBloc, ToDoEditState, String>(
              selector: (state) => (state as MainState).todo.description,
              builder: (context, data) => const ToDoEditTextField(),
            ),
            const SizedBox(height: 16),
            BlocSelector<ToDoEditBloc, ToDoEditState, Importance?>(
              selector: (state) => (state as MainState).todo.importance,
              builder: (context, data) => ImportanceSelector(onChanged: (value) {}),
            ),
            const Divider(),
            BlocSelector<ToDoEditBloc, ToDoEditState, DateTime?>(
              selector: (state) => (state as MainState).todo.deadline,
              builder: (context, data) => DeadlineSelector(deadline: data),
            ),
            const Divider(),
            const SizedBox(height: 16),
            DeleteButton(onPressed: () {}, canDelete: id != null),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() => const Scaffold(body: Center(child: CircularProgressIndicator()));
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    required this.onPressed,
    required this.canDelete,
    super.key,
  });

  final void Function() onPressed;
  final bool canDelete;

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;

    return InkWell(
      onTap: canDelete ? onPressed : null,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(Icons.delete, color: todoTheme.definedColors.red),
            const SizedBox(width: 8),
            Text(
              'Удалить',
              style: todoTheme.textTheme.body
                  .copyWith(color: canDelete ? todoTheme.definedColors.red : todoTheme.supportColors.overlay),
            ),
          ],
        ),
      ),
    );
  }
}
