part of 'todo_edit_bloc.dart';

@freezed
sealed class ToDoEditState with _$ToDoEditState {
  const factory ToDoEditState({required ToDo todo, ToDoEditMessage? message}) =
      MainState;
  const ToDoEditState._();
  const factory ToDoEditState.loading() = LoadingState;
  const factory ToDoEditState.error() = ErrorState;
  const factory ToDoEditState.saved() = SavedState;
}

enum ToDoEditMessage {
  unsupportedOnPlatform,
  shareError,
  copiedToDo,
  prepareShareLink
}
