import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_summer_school/components/leaf/list_item_inlined.dart';
import 'package:yandex_summer_school/screens/todo_list/bloc/bloc.dart';
import 'package:yandex_summer_school/screens/todo_list/widgets/appbar.dart';
import 'package:yandex_summer_school/theme/theme_bloc.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoListBloc, ToDoListState>(
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        final todoTheme = context.watch<ThemeBloc>().state;
        print("Build TodoListScreen with $state");
        return Scaffold(
          backgroundColor: todoTheme.backColors.primary,
          body: switch (state) {
            MainState() => _build(context, state),
            LoadingState() => _buildLoading(),
            ErrorState() => _buildError(),
          },
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildError() => const Center(child: Text('Error'));

  Widget _build(BuildContext context, MainState state) {
    final topPadding = MediaQuery.of(context).padding.top;
    final todoTheme = context.watch<ThemeBloc>().state;

    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: ToDoListAppBar(expandedHeight: 148, topPadding: topPadding, state: state),
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
              itemCount: state.todos.length + 1,
              itemBuilder: (context, index) {
                return ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: index == 0 ? const BorderRadius.vertical(top: Radius.circular(8)) : BorderRadius.zero,
                  child: (index == state.todos.length)
                      ? SizedBox(
                          height: 48,
                          child: InkWell(
                            onTap: () => context.go('/new'),
                            child: ColoredBox(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Новое',
                                    style: todoTheme.textTheme.body,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : ToDoListItemInlined(
                          state: state.todos[index],
                          onToggleDone: (toDo) {},
                          onDelete: (toDo) {},
                        ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
