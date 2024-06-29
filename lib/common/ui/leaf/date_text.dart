import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';

class ToDoDateText extends StatelessWidget {
  const ToDoDateText({
    required this.value,
    this.textAlign,
    this.style,
    super.key,
  });

  final DateTime value;
  final TextAlign? textAlign;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    final locale = Localizations.localeOf(context).languageCode;
    return Text(
      DateFormat.yMMMd(locale).format(value),
      textAlign: textAlign,
      style: style ?? todoTheme.textTheme.body.copyWith(color: todoTheme.definedColors.blue),
    );
  }
}
