part of 'todo_edit_bloc.dart';

@Freezed(equal: false)
sealed class ToDoEditState with _$ToDoEditState {
  const factory ToDoEditState({required ToDo todo, ToDoEditMessage? message}) = MainState;
  const factory ToDoEditState.loading() = LoadingState;
  const factory ToDoEditState.error() = ErrorState;
  const factory ToDoEditState.save() = SaveState;
  const factory ToDoEditState.saved() = SavedState;
}

enum ToDoEditMessage { unsupportedOnPlatform, shareError, copiedToDo, prepareShareLink }
