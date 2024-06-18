import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/components/leaf/checkbox.dart';
import 'package:yandex_summer_school/components/leaf/icon.dart';
import 'package:yandex_summer_school/domain/todo.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

class ToDoListItemInlined extends StatefulWidget {
  const ToDoListItemInlined({required this.state, super.key});
  final ToDo state;

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {
        currentPosition = _animation.value * (animationEndPosition - animationStartPosition) + animationStartPosition;
      });
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
                  onPanDown: (details) => _controller.stop(),
                  onPanUpdate: (details) => setState(() => currentPosition += details.delta.dx),
                  onPanEnd: (_) {
                    if (currentPosition < -threshold) {
                      _runAnimation(currentPosition, -width * 2);
                    } else if (currentPosition > threshold) {
                      _runAnimation(currentPosition, width * 2);
                    } else {
                      _runAnimation(currentPosition, 0);
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
                              onChanged: (_) {},
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
