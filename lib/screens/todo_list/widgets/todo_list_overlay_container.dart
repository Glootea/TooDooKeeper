import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/core/extensions/l10n_extension.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';

class ToDoOverlayContainer extends OverlayEntry {
  ToDoOverlayContainer({required this.children, required this.position, required this.onClose})
      : super(builder: (context) => Column(children: children));

  final List<Widget> children;
  final Offset position;
  final VoidCallback onClose;

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
                border: Border.all(color: todoTheme.supportColors.separator),
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
                      child: Text(context.loc.close, style: todoTheme.textTheme.button),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      };
}
