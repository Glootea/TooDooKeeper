part of 'todo_list_bloc.dart';

@freezed
sealed class ToDoListQuery with _$ToDoListQuery {
  const factory ToDoListQuery({
    String? search,
    List<SortOption>? sortOptions,
    List<FilterOption>? filterOptions,
  }) = _ToDoListQuery;
}

class SortOption {}

class FilterOption {}
