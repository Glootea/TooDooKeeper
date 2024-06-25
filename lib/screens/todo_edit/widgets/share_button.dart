import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({required this.onCopy, required this.onShare, super.key});
  final void Function() onCopy;
  final void Function() onShare;
  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    final color = todoTheme.definedColors.blue;

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: onShare,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(Icons.upload, color: color),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.share,
                      style: todoTheme.textTheme.body.copyWith(color: color),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(onPressed: onCopy, icon: Icon(Icons.content_copy, color: color)),
        ],
      ),
    );
  }
}
