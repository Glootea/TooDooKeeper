import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';

class ToDoOverlayContainer extends OverlayEntry {
  ToDoOverlayContainer({required this.children, required this.position, required this.onClose})
      : super(builder: (context) => Column(children: children));

  final List<Widget> children;
  final Offset position;
  final void Function() onClose;

  @override
  WidgetBuilder get builder => (context) {
        final todoTheme = context.watch<ThemeBloc>().state;
        return Positioned(
          right: position.dx,
          top: position.dy, // aligned to right border as icons are
          child: Material(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: todoTheme.backColors.elevated,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ...children,
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () {
                        remove();
                        onClose();
                      },
                      child: Text(AppLocalizations.of(context)!.close, style: todoTheme.textTheme.button),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      };
}
