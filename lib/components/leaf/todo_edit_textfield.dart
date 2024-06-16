import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

class ToDoEditTextField extends StatelessWidget {
  const ToDoEditTextField({this.onSubmitted, this.onChanged, super.key});

  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: PhysicalModel(
        color: Colors.transparent,
        shadowColor: todoTheme.supportColors.overlay,
        elevation: 2,
        child: TextField(
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          maxLines: null,
          decoration: const InputDecoration(
            constraints: BoxConstraints(minHeight: 104),
            border: InputBorder.none,
            hintText: 'Что надо сделать...',
            contentPadding: EdgeInsets.all(8),
          ),
        ),
      ),
    );
  }
}
