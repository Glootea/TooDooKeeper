import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';

class ToDoEditTextField extends StatefulWidget {
  const ToDoEditTextField({required this.value, this.onSubmitted, this.onChanged, super.key});
  final String? value;
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;

  @override
  State<ToDoEditTextField> createState() => _ToDoEditTextFieldState();
}

class _ToDoEditTextFieldState extends State<ToDoEditTextField> {
  late final TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    final shadowColor = todoTheme.definedColors.gray;

    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(offset: const Offset(0, 2), blurRadius: 4, color: shadowColor.withOpacity(0.14)),
          BoxShadow(offset: const Offset(0, 4), blurRadius: 5, color: shadowColor.withOpacity(0.12)),
          BoxShadow(offset: const Offset(0, 1), blurRadius: 10, color: shadowColor.withOpacity(0.2)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ColoredBox(
          color: todoTheme.backColors.secondary,
          child: TextField(
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            maxLines: null,
            controller: controller,
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              constraints: const BoxConstraints(minHeight: 104),
              border: InputBorder.none,
              hintText: AppLocalizations.of(context)!.needToBeDone,
              contentPadding: const EdgeInsets.all(8),
            ),
          ),
        ),
      ),
    );
  }
}
