import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yandex_summer_school/common/data/data_sources/obfuscation/gzip.dart';
import 'package:yandex_summer_school/common/data/providers/share.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';
import 'package:yandex_summer_school/main.dart';
import 'package:yandex_summer_school/screens/todo_edit/bloc/bloc.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

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
              onTap: () => _onShare(context),
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
          IconButton(onPressed: () => _onCopy(context), icon: Icon(Icons.content_copy, color: color)),
        ],
      ),
    );
  }

  Future<void> _onShare(BuildContext context) async {
    try {
      final data = _getToDoData(context);
      final obfuscation = GZipObfuscation();
      final shareProvider = ShareProvider(obfuscation: obfuscation);
      final exportText = shareProvider.getShareLink(data);
      const platform = MethodChannel('com.glootea.toodookeeper/todo');
      await platform.invokeMethod<void>('share', {'text': exportText});
    } catch (e) {
      if (context.mounted) {
        final errorMessage = kIsWeb || !Platform.isAndroid
            ? AppLocalizations.of(context)!.unsupportedOnPlatform
            : '${AppLocalizations.of(context)?.shareError}: $e';

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      }
      logger.e(e.toString(), stackTrace: StackTrace.current);
    }
  }

  Future<void> _onCopy(BuildContext context) async {
    final data = _getToDoData(context);
    final obfuscation = GZipObfuscation();
    final shareProvider = ShareProvider(obfuscation: obfuscation);
    final exportText = shareProvider.getShareLink(data);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.copiedToDo),
      ),
    );

    return Clipboard.setData(ClipboardData(text: exportText));
  }

  String _getToDoData(BuildContext context) {
    final bloc = context.read<ToDoEditBloc>();
    final state = bloc.state as MainState;
    final toDo = state.todo;
    final text = toDo.dataToExport;
    return text;
  }
}
