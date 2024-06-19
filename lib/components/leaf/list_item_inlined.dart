import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/components/leaf/checkbox.dart';
import 'package:yandex_summer_school/components/leaf/icon.dart';
import 'package:yandex_summer_school/domain/todo.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

class ToDoListItemInlined extends StatefulWidget {
  const ToDoListItemInlined({required this.state, required this.onToggleDone, required this.onDelete, super.key});
  final ToDo state;
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
        widget.onToggleDone(widget.state);
      } else if (currentPosition <= -width) {
        widget.onDelete(widget.state);
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
    final todoTheme = context.watch<ThemeBloc>().state;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final threshold = width / 3;

        return SizedBox(
          height: _height,
          child: Stack(
            children: [
              if (currentPosition >= 0)
                ColoredBox(
                  color: todoTheme.definedColors.green,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.check_outlined),
                    ),
                  ),
                )
              else
                ColoredBox(
                  color: todoTheme.definedColors.red,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.delete_forever_outlined),
                    ),
                  ),
                ),
              Positioned(
                left: currentPosition,
                child: GestureDetector(
                  onTap: () => context.push('/edit/${widget.state.id}'),
                  onPanDown: (details) => _controller.stop(),
                  onPanUpdate: (details) => setState(() => currentPosition += details.delta.dx),
                  onPanEnd: (_) {
                    if (currentPosition < -threshold) {
                      _runAnimation(currentPosition, -width * 2); // to left/delete
                    } else if (currentPosition > threshold) {
                      _runAnimation(currentPosition, width * 2); // to right/toggle done
                      Timer(animationDuration, () => _runAnimation(currentPosition, 0));
                    } else {
                      _runAnimation(currentPosition, 0); // reset
                    }
                  },
                  child: SizedBox(
                    width: width,
                    height: _height,
                    child: ColoredBox(
                      color: todoTheme.backColors.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            ToDoCheckbox(
                              onChanged: (value) {},
                              value: false,
                              importance: widget.state.importance,
                            ),
                            Expanded(
                              child: Text(
                                widget.state.description,
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
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
