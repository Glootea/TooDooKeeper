import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yandex_summer_school/common/ui/complex/error_screen.dart';
import 'package:yandex_summer_school/common/ui/leaf/loading_screen.dart';
import 'package:yandex_summer_school/common/ui/leaf/textfield.dart';
import 'package:yandex_summer_school/screens/todo_edit/bloc/bloc.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/app_bar.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/deadline_selector.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/delete_button.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/importance_selector.dart';
import 'package:yandex_summer_school/screens/todo_edit/widgets/share_button.dart';

class ToDoEditScreen extends StatelessWidget {
  const ToDoEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoEditBloc, ToDoEditState>(
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        switch (state) {
          case MainState():
            return const _MainScreen();
          case LoadingState():
            return const LoadingScreen();
          case ErrorState():
            return ErrorScreen(state.error);
          case SaveState():
            return const Scaffold();
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
            ToDoEditMessage.copiedToDo => AppLocalizations.of(context)!.copiedToDo,
            ToDoEditMessage.shareError => AppLocalizations.of(context)!.shareError,
            ToDoEditMessage.unsupportedOnPlatform => AppLocalizations.of(context)!.unsupportedOnPlatform,
            ToDoEditMessage.prepareShareLink => AppLocalizations.of(context)!.prepareShareLink,
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
                onChanged: (value) => bloc.add(UpdateEvent(todo: state.todo.copyWith(importance: value))),
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
              DeleteButton(onPressed: () {}, canDelete: state.todo.id != null),
            ],
          ),
        ),
      ),
    );
  }
}
