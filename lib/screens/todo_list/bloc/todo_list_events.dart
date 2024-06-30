part of 'todo_list_bloc.dart';

@freezed
sealed class ToDoListEvent with _$ToDoListEvent {
  const factory ToDoListEvent.load() = LoadEvent;
  const factory ToDoListEvent.delete(String id) = DeleteEvent;
  const factory ToDoListEvent.toggleDone(String id) = ToggleDoneEvent;
  const factory ToDoListEvent.logout() = LogoutEvent;
  const factory ToDoListEvent.create() = CreateEvent;
  const factory ToDoListEvent.saveJustCreated(String description) = SaveJustCreatedEvent;
  const factory ToDoListEvent.toggleVisibility() = ToggleVisibilityEvent;
}

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
