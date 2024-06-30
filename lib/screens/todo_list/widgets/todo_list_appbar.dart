import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/core/extensions/l10n_extension.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/bloc/todo_list_bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/widgets/todo_list_overlay_container.dart';

class ToDoListAppBar extends SliverPersistentHeaderDelegate {
  ToDoListAppBar({required this.expandedHeight, required this.topPadding, required this.state});
  final double expandedHeight;
  final double topPadding;
  final MainState state;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final todoTheme = context.watch<ThemeBloc>().state;
    final shadowColor = todoTheme.backColors.primary;

    const expandedTitleOffset = Offset(60, 82);
    const collapsedTitleOffset = Offset(48, 28);

    final subtitleOffset = Offset(60, 124 + topPadding);

    const expanedIconOffset = Offset(20, 124); // x - from right side as it aligns from there
    const collapsedIconOffset = Offset(20, 24); // x - from right side as it aligns from there

    const expandedFontSize = 32.0;
    const collapsedFontSize = 24.0;

    final extendFactor = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    final titleFontSize = extendFactor.lerpDouble(expandedFontSize, collapsedFontSize);
    final titlePosition = extendFactor
        .lerpOffset(expandedTitleOffset, collapsedTitleOffset)
        .translate(0, -titleFontSize / 2 + topPadding);

    final iconSize = Theme.of(context).iconTheme.size ?? 24;
    final iconPosition =
        extendFactor.lerpOffset(expanedIconOffset, collapsedIconOffset).translate(0, -iconSize / 2 + topPadding);

    var overlayOpened = false;

    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: expandedHeight + topPadding),
      child: ColoredBox(
        color: todoTheme.backColors.primary,
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
              child: Text(
                context.loc.myTasks,
                style: todoTheme.textTheme.largeTitle.copyWith(fontSize: titleFontSize),
              ),
            ),
            Positioned(
              left: subtitleOffset.dx,
              top: subtitleOffset.dy,
              child: BlocBuilder<ToDoListBloc, ToDoListState>(
                builder: (context, state) {
                  if (state is MainState) {
                    return Text(
                      '${context.loc.completed} - ${state.todos.where((t) => t.done).length}',
                      style: todoTheme.textTheme.body.copyWith(color: todoTheme.labelTheme.tertiary),
                    );
                  }
                  throw Exception('Unexpected state');
                },
              ),
            ),
            Positioned(
              right: iconPosition.dx,
              top: iconPosition.dy,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.read<ToDoListBloc>().add(const ToggleVisibilityEvent()),
                    icon: Icon(
                      state.showDone ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      color: state.showDone ? todoTheme.definedColors.blue : todoTheme.supportColors.overlay,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (overlayOpened) return;
                      overlayOpened = true;
                      final entry = ToDoOverlayContainer(
                        children: [
                          Text(
                            context.loc.filtersStub,
                            style: todoTheme.textTheme.body,
                          ),
                        ],
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
                      final entry = ToDoOverlayContainer(
                        children: [
                          Text(
                            context.loc.sortStub,
                            style: todoTheme.textTheme.body,
                          ),
                        ],
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

extension Lerp on double {
  Offset lerpOffset(Offset one, Offset two) => one + (two - one) * this;
  double lerpDouble(double one, double two) => one + (two - one) * this;
}
