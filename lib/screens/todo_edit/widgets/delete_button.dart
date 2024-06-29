import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    required this.onPressed,
    required this.canDelete,
    super.key,
  });

  final void Function() onPressed;
  final bool canDelete;

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    final color = canDelete ? todoTheme.definedColors.red : todoTheme.supportColors.overlay;
    return InkWell(
      onTap: canDelete ? onPressed : null,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(Icons.delete, color: color),
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context)!.delete,
              style: todoTheme.textTheme.body.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
