import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/common/entities/todo.dart';
import 'package:yandex_summer_school/common/ui/leaf/checkbox.dart';
import 'package:yandex_summer_school/common/ui/leaf/date_text.dart';
import 'package:yandex_summer_school/common/ui/leaf/icon.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';
import 'package:yandex_summer_school/main.dart';

class ToDoListItemInlined extends StatefulWidget {
  const ToDoListItemInlined({required this.toDo, required this.onToggleDone, required this.onDelete, super.key});
  final ToDo toDo;
  final void Function(ToDo state) onToggleDone;
  final void Function(ToDo state) onDelete;

  @override
  State<ToDoListItemInlined> createState() => _ToDoListItemInlinedState();
}

class _ToDoListItemInlinedState extends State<ToDoListItemInlined> with SingleTickerProviderStateMixin {
  double lastProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.toDo.id),
      background: _CheckContainer(),
      secondaryBackground: _DeleteContainer(),
      movementDuration: const Duration(milliseconds: 600),
      onUpdate: _onPanUpdate,
      onDismissed: _onDismissed,
      child: _DataPresentor(toDo: widget.toDo),
    );
  }

  void _onPanUpdate(DismissUpdateDetails details) {
    if (_enteredActionArea(details.progress, lastProgress, 0.5)) {
      // indicate start of area where action is activated
      Feedback.forLongPress(context);
      HapticFeedback.heavyImpact().whenComplete(() => logger.i('Indicate user of possible action'));

      // TODO: currently: doesn't work without haptic on tap phone setting. Should work in any case
    }

    lastProgress = details.progress;
  }

  bool _enteredActionArea(double currentProgress, double lastProgress, double threshold) =>
      currentProgress > threshold && lastProgress < threshold;

  void _onDismissed(DismissDirection direction) {
    if (direction == DismissDirection.endToStart) {
      logger.d('Delete ${widget.toDo.id} as it was swiped away');
      widget.onDelete(widget.toDo);
    } else if (direction == DismissDirection.startToEnd) {
      logger.d('Toggle done ${widget.toDo.id} as it was swiped away');
      widget.onToggleDone(widget.toDo);
    }
  }
}

class _DataPresentor extends StatelessWidget {
  const _DataPresentor({required this.toDo});

  final ToDo toDo;
  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    return InkWell(
      onTap: () => context.pushReplacement('/edit/${toDo.id}'),
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
                    onChanged: (value) {},
                    value: toDo.done,
                    importance: toDo.importance,
                  ),
                  const SizedBox(width: 8),
                  switch (toDo.importance) {
                    Importance.high => SizedBox(
                        height: Checkbox.width,
                        child: Image.asset('assets/double-exclamation-mark.png'),
                      ),
                    Importance.low => SizedBox(
                        height: todoTheme.textTheme.body.fontSize,
                        child: Image.asset(
                          'assets/down-arrow.png',
                          color: todoTheme.definedColors.gray,
                        ),
                      ),
                    null => const SizedBox(),
                  },
                  Expanded(
                    child: Text(
                      toDo.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: todoTheme.textTheme.body.copyWith(
                        decoration: toDo.done ? TextDecoration.lineThrough : null,
                        color: toDo.done ? todoTheme.definedColors.gray : null,
                      ),
                    ),
                  ),
                  ToDoIcon(icon: Icons.info_outline, color: todoTheme.labelTheme.tertiary),
                ],
              ),
              if (toDo.deadline != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: Checkbox.width + 8),
                  child: ToDoDateText(
                    value: toDo.deadline!,
                    style: todoTheme.textTheme.subhead.copyWith(color: todoTheme.labelTheme.tertiary),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DeleteContainer extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    return ColoredBox(
      color: todoTheme.definedColors.green,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.check_outlined, color: todoTheme.definedColors.white),
        ),
      ),
    );
  }
}
