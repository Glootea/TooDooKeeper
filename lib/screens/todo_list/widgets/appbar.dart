import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/bloc/bloc.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

class ToDoListAppBar extends SliverPersistentHeaderDelegate {
  ToDoListAppBar({required this.expandedHeight, required this.topPadding, required this.state});
  final double expandedHeight;
  final double topPadding;
  final MainState state;

  Summable<T> getLerpValue<T>(Summable<T> one, Summable<T> two, double factor) {
    return one + (two - one) * factor;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final todoTheme = context.watch<ThemeBloc>().state;
    final shadowColor = todoTheme.backColors.primary;

    const expandedTitleOffset = ToDoOffset(Offset(60, 82));
    const collapsedTitleOffset = ToDoOffset(Offset(48, 24));
    final subtitleOffset = ToDoOffset(Offset(60, 124 + topPadding));
    const expanedIconOffset = ToDoOffset(Offset(20, 108)); // x - from right side as it aligns from there
    const expandedFontSize = ToDoDouble(32);
    const collapsedFontSize = ToDoDouble(24);

    final collapsedIconOffset = ToDoOffset(
      Offset(
        20, // x - from right side as it aligns from there
        16 - ((Theme.of(context).iconTheme.size ?? 24) / 2),
      ),
    );

    final extendFactor = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    final titleFontSize = getLerpValue(expandedFontSize, collapsedFontSize, extendFactor).value;

    final titlePosition = getLerpValue(
      expandedTitleOffset,
      collapsedTitleOffset,
      extendFactor,
    ).value.translate(0, -titleFontSize / 2 + topPadding);

    final iconPosition = getLerpValue(
      expanedIconOffset,
      collapsedIconOffset,
      extendFactor,
    ).value.translate(0, topPadding);

    bool overlayOpened = false;

    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: expandedHeight + topPadding),
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: shrinkOffset,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: todoTheme.backColors.primary,
                boxShadow: [
                  BoxShadow(offset: const Offset(0, 2), blurRadius: 4, color: shadowColor.withOpacity(0.14)),
                  BoxShadow(offset: const Offset(0, 4), blurRadius: 5, color: shadowColor.withOpacity(0.12)),
                  BoxShadow(offset: const Offset(0, 1), blurRadius: 10, color: shadowColor.withOpacity(0.2)),
                ],
              ),
            ),
          ),
          Positioned(
            left: titlePosition.dx,
            top: titlePosition.dy,
            child: Text('Мои дела', style: todoTheme.textTheme.largeTitle.copyWith(fontSize: titleFontSize)),
          ),
          Positioned(
            left: subtitleOffset.value.dx,
            top: subtitleOffset.value.dy,
            child: Text(
              'Выполнено - 5',
              style: todoTheme.textTheme.body.copyWith(color: todoTheme.labelTheme.tertiary),
            ),
          ),
          Positioned(
            right: iconPosition.dx,
            top: iconPosition.dy,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (overlayOpened) return;
                    overlayOpened = true;
                    final entry = ToDoOverlay(
                      children: [Text('Здесь будут фильтры', style: todoTheme.textTheme.body)],
                      position: iconPosition + const Offset(0, 40),
                      onClose: () => overlayOpened = false,
                    );
                    Overlay.of(context).insert(entry);
                  },
                  icon: Icon(
                    Icons.filter_list_outlined,
                    color: state.query.filterOptions?.isNotEmpty ?? false
                        ? todoTheme.definedColors.blue
                        : todoTheme.supportColors.overlay,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (overlayOpened) return;
                    overlayOpened = true;
                    final entry = ToDoOverlay(
                      children: [Text('Здесь будет сортировка', style: todoTheme.textTheme.body)],
                      position: iconPosition + const Offset(0, 40),
                      onClose: () => overlayOpened = false,
                    );
                    Overlay.of(context).insert(entry);
                  },
                  icon: Icon(
                    Icons.swap_vert_outlined,
                    color: state.query.sortOptions?.isNotEmpty ?? false
                        ? todoTheme.definedColors.blue
                        : todoTheme.supportColors.overlay,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + topPadding;

  @override
  double get minExtent => kToolbarHeight + topPadding;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

abstract interface class Summable<T> {
  /// Used for calculation of lerp values for scroll driven animations
  const Summable(this.value);
  final T value;

  Summable<T> operator +(Summable<T> other);
  Summable<T> operator -(Summable<T> other);
  Summable<T> operator *(double factor);
}

class ToDoOffset implements Summable<Offset> {
  const ToDoOffset(this.value);

  @override
  final Offset value;

  @override
  ToDoOffset operator +(Summable<Offset> other) => ToDoOffset(value + other.value);

  @override
  ToDoOffset operator -(Summable<Offset> other) => ToDoOffset(value - other.value);

  @override
  ToDoOffset operator *(double factor) => ToDoOffset(value * factor);
}

class ToDoDouble implements Summable<double> {
  const ToDoDouble(this.value);

  @override
  final double value;

  @override
  ToDoDouble operator +(Summable<double> other) => ToDoDouble(value + other.value);

  @override
  ToDoDouble operator *(double factor) => ToDoDouble(value * factor);

  @override
  ToDoDouble operator -(Summable<double> other) => ToDoDouble(value - other.value);
}

class ToDoOverlay extends OverlayEntry {
  ToDoOverlay({required this.children, required this.position, required this.onClose})
      : super(
          builder: (context) {
            return Column(children: children);
          },
        );
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
                      child: Text('Закрыть', style: todoTheme.textTheme.button),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      };
}
