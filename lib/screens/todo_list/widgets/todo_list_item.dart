import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/core/entities/importance.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/logger.dart';
import 'package:yandex_summer_school/core/ui/leaf/todo_date_text.dart';
import 'package:yandex_summer_school/core/ui/leaf/todo_icon.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/bloc/todo_list_bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/widgets/todo_checkbox.dart';

class ToDoListItem extends StatefulWidget {
  const ToDoListItem({
    required this.toDo,
    required this.onToggleDone,
    required this.onDelete,
    super.key,
  });

  final ToDo toDo;
  final void Function(ToDo state) onToggleDone;
  final void Function(ToDo state) onDelete;

  @override
  State<ToDoListItem> createState() => _ToDoListItemState();
}

class _ToDoListItemState extends State<ToDoListItem>
    with SingleTickerProviderStateMixin {
  double lastProgress = 0;
  static const _threshold = 0.5;

  late bool done = widget.toDo.done;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      dismissThresholds: const {
        DismissDirection.startToEnd: _threshold,
        DismissDirection.endToStart: _threshold,
      },
      key: ObjectKey(widget.toDo),
      confirmDismiss: (direction) =>
          Future.value(direction == DismissDirection.endToStart),
      background: const _CheckContainer(),
      secondaryBackground: const _DeleteContainer(),
      movementDuration: const Duration(milliseconds: 600),
      onUpdate: _onPanUpdate,
      onDismissed: _onDismissed,
      child: _DataPresentor(
        toDo: widget.toDo,
        done: done,
        onToggleDone: _onToggleDone,
      ),
    );
  }

  void _onToggleDone() {
    setState(() => done = !done);
    logger.d('Toggle done ${widget.toDo.id} as it was swiped away');
    widget.onToggleDone(widget.toDo);
  }

  void _onPanUpdate(DismissUpdateDetails details) {
    if (_enteredActionArea(details.progress, lastProgress, _threshold)) {
      // indicate start of area where action is activated
      Feedback.forLongPress(context);
      HapticFeedback.heavyImpact()
          .whenComplete(() => logger.i('Indicate user of possible action'));
      if (details.direction == DismissDirection.startToEnd) {
        _onToggleDone();
      }
      // TODO: currently: doesn't work without haptic on tap phone setting. Should work in any case
    }

    lastProgress = details.progress;
  }

  bool _enteredActionArea(
    double currentProgress,
    double lastProgress,
    double threshold,
  ) =>
      currentProgress > threshold && lastProgress < threshold;

  void _onDismissed(DismissDirection direction) {
    if (direction == DismissDirection.endToStart) {
      logger.d('Delete ${widget.toDo.id} as it was swiped away');
      widget.onDelete(widget.toDo);
    }
  }
}

class _DataPresentor extends StatelessWidget {
  const _DataPresentor({
    required this.toDo,
    required this.done,
    required this.onToggleDone,
  });

  final ToDo toDo;
  final bool done;
  final VoidCallback onToggleDone;
  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    return InkWell(
      onTap: () async {
        await context.push('/edit/${toDo.id}');
        if (context.mounted) {
          context.read<ToDoListBloc>().add(const LoadEvent());
        }
      },
      child: ColoredBox(
        color: todoTheme.backColors.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ToDoCheckbox(
                    onChanged: (value) => onToggleDone(),
                    value: done,
                    importance: toDo.importance,
                  ),
                  const SizedBox(width: 8),
                  _ToDoItemImportanceIcon(toDo: toDo),
                  Expanded(
                    child: toDo.id != null
                        ? Text(
                            toDo.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: todoTheme.textTheme.body.copyWith(
                              decoration:
                                  done ? TextDecoration.lineThrough : null,
                              color: done ? todoTheme.definedColors.gray : null,
                            ),
                          )
                        : _ToDoInlinedTextfield(toDo),
                  ),
                  ToDoIcon(
                    icon: Icons.info_outline,
                    color: todoTheme.labelTheme.tertiary,
                  ),
                ],
              ),
              if (toDo.deadline != null)
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8, left: Checkbox.width + 8),
                  child: ToDoDateText(
                    value: toDo.deadline!,
                    style: todoTheme.textTheme.subhead
                        .copyWith(color: todoTheme.labelTheme.tertiary),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToDoInlinedTextfield extends StatefulWidget {
  const _ToDoInlinedTextfield(this.todo);

  final ToDo todo;

  @override
  State<_ToDoInlinedTextfield> createState() => _ToDoInlinedTextfieldState();
}

class _ToDoInlinedTextfieldState extends State<_ToDoInlinedTextfield> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late final ToDoListBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = context.read<ToDoListBloc>();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  void onDone() {
    _controller.value = TextEditingValue(text: _controller.text.trim());
    _focusNode.unfocus();
    bloc.add(SaveJustCreatedEvent(_controller.text));
  }

  void onUpdate(String value) =>
      _controller.value = TextEditingValue(text: value);

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      onChanged: onUpdate,
      onEditingComplete: onDone,
      onTapOutside: (_) => onDone(),
      textInputAction: TextInputAction.done,
      minLines: 3,
      maxLines: 3,
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

class _DeleteContainer extends StatelessWidget {
  const _DeleteContainer();
  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    return ColoredBox(
      color: todoTheme.definedColors.red,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete, color: todoTheme.definedColors.white),
        ),
      ),
    );
  }
}

class _CheckContainer extends StatelessWidget {
  const _CheckContainer();
  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    return ColoredBox(
      color: todoTheme.definedColors.green,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child:
              Icon(Icons.check_outlined, color: todoTheme.definedColors.white),
        ),
      ),
    );
  }
}

class _ToDoItemImportanceIcon extends StatelessWidget {
  const _ToDoItemImportanceIcon({required this.toDo});

  final ToDo toDo;

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    const height = Checkbox.width;
    return switch (toDo.importance) {
      Importance.low => SizedBox(
          height: height,
          child: Image.asset(
            'assets/down-arrow.png',
            color: todoTheme.definedColors.gray,
          ),
        ),
      Importance.basic => const SizedBox(height: height),
      Importance.important => SizedBox(
          height: height,
          child: Image.asset('assets/double-exclamation-mark.png'),
        ),
    };
  }
}
