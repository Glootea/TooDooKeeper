import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/common/entities/todo.dart';
import 'package:yandex_summer_school/common/ui/complex/error_screen.dart';
import 'package:yandex_summer_school/common/ui/leaf/todo_edit_textfield.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';
import 'package:yandex_summer_school/main.dart';
import 'package:yandex_summer_school/screens/todo_edit/bloc/bloc.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/deadline_selector.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/importance_selector.dart';

class ToDoEditScreen extends StatelessWidget {
  const ToDoEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoEditBloc, ToDoEditState>(
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
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
    final bloc = context.read<ToDoEditBloc>();
    final state = bloc.state as MainState;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pushReplacement('/'), icon: const Icon(Icons.close_outlined)),
        actions: [
          TextButton(
            onPressed: () {
              context.pushReplacement('/');
              bloc.add(const SaveEvent());
            },
            child: Text(
              AppLocalizations.of(context)!.save,
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
              builder: (context, data) => ToDoEditTextField(
                value: data,
                onChanged: (value) => bloc.add(UpdateEvent(todo: state.todo.copyWith(description: value))),
              ),
            ),
            const SizedBox(height: 16),
            BlocSelector<ToDoEditBloc, ToDoEditState, Importance?>(
              selector: (state) => (state as MainState).todo.importance,
              builder: (context, data) => ImportanceSelector(
                value: data,
                onChanged: (value) => bloc.add(UpdateEvent(todo: state.todo.copyWith(importance: value))),
              ),
            ),
            const Divider(),
            BlocSelector<ToDoEditBloc, ToDoEditState, DateTime?>(
              selector: (state) => (state as MainState).todo.deadline,
              builder: (context, data) => DeadlineSelector(
                value: data,
                onChanged: (value) => bloc.add(UpdateEvent(todo: state.todo.copyWith(deadline: value))),
              ),
            ),
            const Divider(),
            const SizedBox(height: 16),
            DeleteButton(onPressed: () {}, canDelete: state.todo.id != null),
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
    final color = canDelete ? todoTheme.definedColors.red : todoTheme.supportColors.overlay;
    return InkWell(
      onTap: canDelete ? onPressed : null,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(Icons.delete, color: color),
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context)!.delete,
              style: todoTheme.textTheme.body.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
