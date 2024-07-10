import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/core/extensions/l10n_extension.dart';
import 'package:yandex_summer_school/core/ui/complex/error_screen.dart';
import 'package:yandex_summer_school/core/ui/complex/loading_screen.dart';
import 'package:yandex_summer_school/core/ui/leaf/todo_textfield.dart';
import 'package:yandex_summer_school/screens/todo_edit/bloc/todo_edit_bloc.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/todo_edit_appbar.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/todo_edit_deadline_selector.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/todo_edit_delete_button.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/todo_edit_importance_selector.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/todo_edit_share_button.dart';

class ToDoEditScreen extends StatelessWidget {
  const ToDoEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoEditBloc, ToDoEditState>(
      listener: (context, state) {
        if (state is SavedState) {
          context.pushReplacement('/');
        }
      },
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        switch (state) {
          case MainState():
            return const _MainScreen();
          case LoadingState() || SavedState():
            return const LoadingScreen();
          case ErrorState():
            return const ErrorScreen();
        }
      },
    );
  }
}

class _MainScreen extends StatelessWidget {
  const _MainScreen();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ToDoEditBloc>();
    final state = bloc.state as MainState;

    return BlocListener<ToDoEditBloc, ToDoEditState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is MainState) {
          final message = switch (state.message) {
            ToDoEditMessage.copiedToDo => context.loc.copiedToDo,
            ToDoEditMessage.shareError => context.loc.shareError,
            ToDoEditMessage.unsupportedOnPlatform => context.loc.unsupportedOnPlatform,
            ToDoEditMessage.prepareShareLink => context.loc.prepareShareLink,
            null => null,
          };
          if (message != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(message)));
          }
        }
      },
      child: Scaffold(
        appBar: ToDoEditAppbar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              ToDoEditTextField(
                value: state.todo.description,
                onChanged: (value) => bloc.add(UpdateEvent(todo: state.todo.copyWith(description: value))),
              ),
              const SizedBox(height: 16),
              ImportanceSelector(
                value: state.todo.importance,
                onChanged: (value) =>
                    value != null ? bloc.add(UpdateEvent(todo: state.todo.copyWith(importance: value))) : null,
              ),
              const Divider(),
              DeadlineSelector(
                value: state.todo.deadline,
                onChanged: (value) => bloc.add(UpdateEvent(todo: state.todo.copyWith(deadline: value))),
              ),
              const Divider(),
              ShareButton(
                onCopy: () => bloc.add(const ShareCopyEvent()),
                onShare: () => bloc.add(const ShareExportEvent()),
              ),
              const SizedBox(height: 16),
              DeleteButton(
                onPressed: () {
                  if (state.todo.id != null) {
                    bloc.add(const DeleteEvent());
                  }
                },
                canDelete: state.todo.id != null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
