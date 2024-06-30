part of 'todo_list_bloc.dart';

@Freezed(equal: false)
sealed class ToDoListState with _$ToDoListState {
  const factory ToDoListState({
    required List<ToDo> todos,
    required ToDoListQuery query,
    required bool showDone,
  }) = MainState;

  const factory ToDoListState.loading() = LoadingState;

  const factory ToDoListState.error({required String message}) = ErrorState;
}
