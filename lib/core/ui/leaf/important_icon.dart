import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';

class ImportantIcon extends StatelessWidget {
  const ImportantIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeBloc>().state;
    return SizedBox(
      height: Checkbox.width,
      child: Image.asset(
        'assets/double-exclamation-mark.png',
        color: color.importantColor,
      ),
    );
  }
}
