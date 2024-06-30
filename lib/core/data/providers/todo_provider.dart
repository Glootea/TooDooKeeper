import 'package:uuid/uuid.dart';
import 'package:yandex_summer_school/core/data/data_sources/local_database/local_database.dart';
import 'package:yandex_summer_school/core/data/providers/online/online_provider_abst.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/extensions/local_database_todo_mapper_extension.dart';
import 'package:yandex_summer_school/core/logger.dart';

class ToDoProvider {
  const ToDoProvider({required this.localDatabase, required this.onlineProvider});

  final AppDatabase localDatabase;
  final OnlineProvider onlineProvider;

  Future<List<ToDo>> getToDoList() async {
    final onlineTodoList = await onlineProvider.database?.getToDoList();
    if (onlineTodoList != null) {
      await localDatabase.setFromOnline(onlineTodoList.map((toDo) => toDo.parseToDoItemCompanion).toList());
      logger.i('Got list from online: $onlineTodoList');
      return onlineTodoList;
    }
    final localToDoList = await localDatabase.getToDoList();
    logger.i('Got list from local: $localToDoList');
    return localToDoList.map((toDoItem) => toDoItem.parseToDo).whereType<ToDo>().toList();
  }

  Future<ToDo?> getToDoById({required String id}) async {
    final onlineToDo = await onlineProvider.database?.getToDoById(id);
    if (onlineToDo != null) {
      await localDatabase.createOrUpdateTodo(companion: onlineToDo.parseToDoItemCompanion);
      return onlineToDo;
    }
    final localToDo = await localDatabase.getToDoById(id: id);
    return localToDo.parseToDo;
  }

  Future<void> createOrUpdateTodo({required ToDo todo}) async {
    final now = DateTime.now();
    var updatedToDo = todo.copyWith(changedAt: now);
    late ToDo? onlineToDo;
    if (updatedToDo.justCreated) {
      updatedToDo = updatedToDo.copyWith(id: const Uuid().v4(), createdAt: now);
      onlineToDo = await onlineProvider.database?.createToDo(updatedToDo);
    } else {
      onlineToDo = await onlineProvider.database?.updateToDo(updatedToDo);
    }

    if (onlineToDo != null) {
      await localDatabase.createOrUpdateTodo(companion: onlineToDo.parseToDoItemCompanion);
      return;
    }
    return localDatabase.createOrUpdateTodo(companion: updatedToDo.parseToDoItemCompanion);
  }

  Future<void> deleteTodo({required String id}) async {
    await onlineProvider.database?.deleteToDo(id);
    return localDatabase.deleteTodo(id: id);
  }
}
