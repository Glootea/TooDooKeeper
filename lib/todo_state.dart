import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo_state.freezed.dart';

@freezed
class ToDoState with _$ToDoState {
  const factory ToDoState({
    required String text,
    required bool done,
    DateTime? deadline,
    Importance? importance,
  }) = _ToDoState;
}

enum Importance { low, high }
