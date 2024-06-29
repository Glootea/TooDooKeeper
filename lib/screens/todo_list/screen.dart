import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/common/ui/complex/error_screen.dart';
import 'package:yandex_summer_school/common/ui/complex/list_item_inlined.dart';
import 'package:yandex_summer_school/common/ui/leaf/loading_screen.dart';
import 'package:yandex_summer_school/common/ui/theme/theme_bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/bloc/bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/widgets/appbar.dart';
import 'package:yandex_summer_school/screens/todo_list/widgets/create_todo_item.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoListBloc, ToDoListState>(
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        return switch (state) {
          MainState() => _MainScreen(state: state),
          LoadingState() => const LoadingScreen(),
          ErrorState() => ErrorScreen(state.message),
        };
      },
    );
  }
}

class _MainScreen extends StatelessWidget {
  const _MainScreen({required this.state});
  final MainState state;
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final todoTheme = context.watch<ThemeBloc>().state;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: ToDoListAppBar(expandedHeight: 148, topPadding: topPadding, state: state),
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: bottomPadding),
            sliver: DecoratedSliver(
              decoration: ShapeDecoration(
                shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
                color: todoTheme.backColors.secondary,
              ),
              sliver: SliverList.builder(
                itemCount: state.todos.length + 1,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: index == 0 ? const BorderRadius.vertical(top: Radius.circular(8)) : BorderRadius.zero,
                    child: (index == state.todos.length)
                        ? const CreateTodoItem()
                        : ToDoListItemInlined(
                            toDo: state.todos[index],
                            onToggleDone: (toDo) {},
                            onDelete: (toDo) {},
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/new'),
        backgroundColor: todoTheme.definedColors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add, color: todoTheme.definedColors.white),
      ),
    );
  }
}
