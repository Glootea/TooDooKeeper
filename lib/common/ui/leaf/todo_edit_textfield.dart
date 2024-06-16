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

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: PhysicalModel(
        color: Colors.transparent,
        shadowColor: todoTheme.supportColors.overlay,
        elevation: 2,
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
    );
  }
}
