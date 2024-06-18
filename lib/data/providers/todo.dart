import 'package:yandex_summer_school/data/data_sources/local_database.dart';
import 'package:yandex_summer_school/domain/todo.dart';

class ToDoProvider {
  const ToDoProvider({required this.localDatabase});

  final AppDatabase localDatabase;

  Future<List<ToDo>> getToDoList({int? limit, int? offset}) => localDatabase
      .getToDoList(limit: limit, offset: offset)
      .then((list) => list.map(ToDo.fromToDoItem).whereType<ToDo>().toList());

  Future<ToDo?> getToDoById({required int id}) => localDatabase.getToDoById(id: id).then(ToDo.fromToDoItem);
  Future<void> updateTodo({required ToDo todo}) => localDatabase.updateTodo(todo: todo.toDoItem);
  Future<void> addTodo({required ToDo todo}) => localDatabase.addTodo(todo: todo.toDoItem);
  Future<void> deleteTodo({required int id}) => localDatabase.deleteTodo(id: id);
}
