import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/data/data_sources/local_database.dart';
part 'todo.freezed.dart';

const idEmpty = -1;

@freezed
sealed class ToDo with _$ToDo {
  const factory ToDo({
    required int id,
    required String description,
    required bool done,
    DateTime? deadline,
    Importance? importance,
  }) = _ToDo;
  const factory ToDo.empty({
    @Default(idEmpty) int id,
    @Default('') String description,
    @Default(false) bool done,
    @Default(null) DateTime? deadline,
    @Default(null) Importance? importance,
  }) = _ToDoEmpty;

  const ToDo._();

  String get dataToSend => throw UnimplementedError(); // TODO: implement data getter for ToDo
  bool get created => id != idEmpty;

  static ToDo? fromToDoItem(ToDoItem? item) {
    if (item == null) return null;
    return ToDo(
      id: item.id,
      description: item.description,
      done: item.isDone,
      deadline: item.deadline,
      importance: Importance.fromString(item.importance),
    );
  }

  ToDoItem get toDoItem => ToDoItem(
        id: id,
        description: description,
        isDone: done,
        deadline: deadline,
        importance: importance?.toString(),
      );
}

enum Importance {
  low,
  high;

  static Importance? fromString(String? value) {
    switch (value) {
      case 'low':
        return Importance.low;
      case 'high':
        return Importance.high;
      default:
        return null;
    }
  }
}
