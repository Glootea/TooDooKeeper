import 'package:yandex_summer_school/core/entities/todo.dart';

abstract interface class RemoteDatabase {
  Future<List<ToDo>?> getToDoList();
  Future<List<ToDo>?> updateToDoList(List<ToDo> todos);
  Future<ToDo?> getToDoById(String id);
  Future<ToDo?> createToDo(ToDo todo);
  Future<ToDo?> updateToDo(ToDo todo);
  Future<ToDo?> deleteToDo(String id);

  Future<void> onLogout();
}
