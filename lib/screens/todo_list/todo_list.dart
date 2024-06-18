import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_summer_school/components/leaf/list_item_inlined.dart';
import 'package:yandex_summer_school/domain/todo.dart';
import 'package:yandex_summer_school/screens/todo_list/widgets/appbar.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoTheme = context.watch<ThemeBloc>().state;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: todoTheme.backColors.primary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: ToDoListAppBar(expandedHeight: 148, topPadding: topPadding),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: DecoratedSliver(
              decoration: ShapeDecoration(
                shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
                color: todoTheme.backColors.secondary,
              ),
              sliver: SliverList.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: index == 0 ? const BorderRadius.vertical(top: Radius.circular(8)) : BorderRadius.zero,
                    child: ToDoListItemInlined(state: ToDo(id: 1, description: index.toString(), done: index.isEven)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
