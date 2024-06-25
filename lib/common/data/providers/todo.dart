import 'package:drift/drift.dart';
import 'package:yandex_summer_school/common/data/data_sources/local_database/local_database.dart';
import 'package:yandex_summer_school/common/entities/todo.dart';

class ToDoProvider {
  const ToDoProvider({required this.localDatabase});

  final AppDatabase localDatabase;

  Future<List<ToDo>> getToDoList({int? limit, int? offset}) => localDatabase
      .getToDoList(limit: limit, offset: offset)
      .then((list) => list.map(_parseToDoItem).whereType<ToDo>().toList());

  Future<ToDo?> getToDoById({required int id}) => localDatabase.getToDoById(id: id).then(_parseToDoItem);
  Future<int> createOrUpdateTodo({required ToDo todo}) =>
      localDatabase.createOrUpdateTodo(companion: _parseToDoItemCompanion(todo));
  Future<void> deleteTodo({required int id}) => localDatabase.deleteTodo(id: id);
  Future<int> getToDoCount() => localDatabase.getToDoCount();

  ToDoItemsCompanion _parseToDoItemCompanion(ToDo todo) => ToDoItemsCompanion(
        id: todo.id == null ? const Value.absent() : Value(todo.id!),
        description: Value(todo.description),
        isDone: Value(todo.done),
        deadline: Value(todo.deadline),
        importance: Value(todo.importance.toString()),
      );

  ToDo? _parseToDoItem(ToDoItem? item) {
    if (item == null) {
      return null;
    }
    return ToDo(
      id: item.id,
      description: item.description,
      done: item.isDone,
      deadline: item.deadline,
      importance: Importance.fromString(item.importance),
    );
  }
}
