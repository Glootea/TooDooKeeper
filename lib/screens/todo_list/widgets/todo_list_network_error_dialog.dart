import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/core/extensions/l10n_extension.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';

class TodoListNetworkErrorDialog extends StatelessWidget {
  const TodoListNetworkErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeBloc>().state;

    final titleTheme = theme.textTheme.largeTitle;
    final bodyTheme = theme.textTheme.body;
    final buttonTheme = theme.textTheme.button;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: AlertDialog(
        title: Text(context.loc.networkError, style: titleTheme),
        content: Text(context.loc.networkErrorDescription, style: bodyTheme),
        actions: [
          TextButton(
            onPressed: context.pop,
            child: Text(context.loc.ok, style: buttonTheme.copyWith(color: theme.definedColors.blue)),
          ),
        ],
      ),
    );
  }
}
