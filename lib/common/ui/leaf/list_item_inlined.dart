import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/common/entities/todo.dart';
import 'package:yandex_summer_school/common/ui/leaf/checkbox.dart';
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
  late AnimationController _controller;
  late Animation<double> _animation;

  static const double _height = 48;

  double currentPosition = 0;

  double animationStartPosition = 0;
  double animationEndPosition = 0;
  final animationDuration = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: animationDuration);
    _controller.addListener(() {
      setState(() {
        currentPosition = _animation.value * (animationEndPosition - animationStartPosition) + animationStartPosition;
      });

      final width = MediaQuery.sizeOf(context).width;

      if (currentPosition >= width) {
        widget.onToggleDone(widget.toDo);
      } else if (currentPosition <= -width) {
        widget.onDelete(widget.toDo);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation(double currentDragPosition, double targetDragPosition) {
    animationStartPosition = currentDragPosition;
    animationEndPosition = targetDragPosition;
    _animation = _controller.drive(CurveTween(curve: Curves.easeInOut));
    _controller
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final threshold = width / 3;

        return SizedBox(
          height: _height,
          child: Stack(
            children: [
              if (currentPosition >= 0) _CheckContainer() else _DeleteContainer(),
              Positioned(
                left: currentPosition,
                child: GestureDetector(
                  onTap: () => context.pushReplacement('/edit/${widget.toDo.id}'),
                  onPanDown: (details) => _controller.stop(),
                  onPanCancel: () => _runAnimation(currentPosition, 0),
                  onPanUpdate: (details) => _onPanUpdate(details, threshold),
                  onPanEnd: (_) => _onPanEnd(threshold, width),
                  child: _DataPresentor(width: width, toDo: widget.toDo),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onPanUpdate(DragUpdateDetails details, double threshold) {
    return setState(() {
      final delta = details.delta.dx;
      if (_enteredActionArea(delta, threshold)) {
        // indicate start of area where action is activated
        HapticFeedback.heavyImpact().whenComplete(() => logger.i('Indicate user of possible action'));
      }
      currentPosition += delta;
    });
  }

  void _onPanEnd(double threshold, double width) {
    if (currentPosition < -threshold) {
      _runAnimation(currentPosition, -width * 2); // to left/delete
    } else if (currentPosition > threshold) {
      _runAnimation(currentPosition, width * 2); // to right/toggle done
      Timer(animationDuration, () => _runAnimation(currentPosition, 0));
    } else {
      _runAnimation(currentPosition, 0); // reset
    }
  }

  bool _enteredActionArea(double delta, double threshold) =>
      (currentPosition + delta > threshold && currentPosition < threshold) ||
      (currentPosition + delta < -threshold && currentPosition > -threshold);
}

class _DataPresentor extends StatelessWidget {
  const _DataPresentor({required this.width, required this.toDo});

  final double width;
  final ToDo toDo;
  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    return SizedBox(
      width: width,
      child: ColoredBox(
        color: todoTheme.backColors.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              ToDoCheckbox(
                onChanged: (value) {},
                value: false,
                importance: toDo.importance,
              ),
              Expanded(
                child: Text(
                  toDo.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: todoTheme.textTheme.body,
                ),
              ),
              ToDoIcon(icon: Icons.info_outline, color: todoTheme.labelTheme.tertiary),
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
      child: const Padding(
        padding: EdgeInsets.only(right: 16),
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete_forever_outlined),
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
      child: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.check_outlined),
        ),
      ),
    );
  }
}
