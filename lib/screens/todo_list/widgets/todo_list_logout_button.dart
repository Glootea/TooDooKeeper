import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({required this.onTap, super.key});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            Icons.logout_outlined,
            color: todoTheme.definedColors.red,
          ),
          const SizedBox(width: 16),
          Text(
            AppLocalizations.of(context)!.logout,
            style: todoTheme.textTheme.body.copyWith(color: todoTheme.definedColors.red),
          ),
        ],
      ),
    );
  }
}
