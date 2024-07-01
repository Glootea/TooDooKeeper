import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/ui/complex/error_screen.dart';
import 'package:yandex_summer_school/core/ui/complex/loading_screen.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/bloc/todo_list_bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/widgets/todo_list_appbar.dart';
import 'package:yandex_summer_school/screens/todo_list/widgets/todo_list_create_todo_item.dart';
import 'package:yandex_summer_school/screens/todo_list/widgets/todo_list_item.dart';
import 'package:yandex_summer_school/screens/todo_list/widgets/todo_list_logout_button.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoListBloc, ToDoListState>(
      builder: (context, state) {
        return switch (state) {
          MainState() => _MainScreen(state: state),
          LoadingState() => const LoadingScreen(),
          ErrorState() => const ErrorScreen(),
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
    final padding = MediaQuery.paddingOf(context);
    final topPadding = padding.top;
    final bottomPadding = padding.bottom;
    final todoTheme = context.watch<ThemeBloc>().state;
    final bloc = context.read<ToDoListBloc>();

    final toDoListToShow = prepareToDoList(state.todos, state.showDone, state.query);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => bloc.add(const LoadEvent()),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: ToDoListAppBar(expandedHeight: 148, topPadding: topPadding, state: state),
              pinned: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              sliver: DecoratedSliver(
                decoration: ShapeDecoration(
                  shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
                  color: todoTheme.backColors.secondary,
                ),
                sliver: SliverList.builder(
                  // TODO: add insert/move animation
                  itemCount: toDoListToShow.length + 1,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius:
                          index == 0 ? const BorderRadius.vertical(top: Radius.circular(8)) : BorderRadius.zero,
                      child: (index == toDoListToShow.length)
                          ? CreateTodoItem(
                              onTap: () => context.read<ToDoListBloc>().add(const CreateEvent()),
                            )
                          : ToDoListItem(
                              toDo: toDoListToShow[index],
                              onToggleDone: (toDo) => bloc.add(ToDoListEvent.toggleDone(toDo.id!)),
                              onDelete: (toDo) => bloc.add(ToDoListEvent.delete(toDo.id!)),
                              key: ValueKey(toDoListToShow[index].id),
                            ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 16, bottom: bottomPadding + 16),
                child: LogoutButton(
                  onTap: () {
                    bloc.add(const LogoutEvent());
                    context.go('/auth');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.push('/new');
          if (context.mounted) {
            context.read<ToDoListBloc>().add(const LoadEvent());
          }
        },
        backgroundColor: todoTheme.definedColors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add, color: todoTheme.definedColors.white),
      ),
    );
  }

  List<ToDo> prepareToDoList(List<ToDo> list, bool showDone, ToDoListQuery query) {
    if (!showDone) {
      return list.where((t) => !t.done).toList();
    } else {
      // done at the end
      return list.toList()
        ..sort(
          // TODO: implement sort by query
          (a, b) => switch ((a.done, b.done)) {
            (false, false) || (true, true) => a.importance.compareTo(b.importance),
            (false, true) => -1,
            (true, false) => 1,
          },
        );
    }
  }
}
