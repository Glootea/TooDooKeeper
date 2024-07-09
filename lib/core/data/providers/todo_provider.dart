import 'package:uuid/uuid.dart';
import 'package:yandex_summer_school/core/data/data_sources/local_database/local_database.dart';
import 'package:yandex_summer_school/core/data/providers/online/online_provider_abst.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/extensions/local_database_todo_mapper_extension.dart';
import 'package:yandex_summer_school/core/logger.dart';

class ToDoProvider {
  // TODO: handle failed online requests
  const ToDoProvider({required AppDatabase localDatabase, required OnlineProvider onlineProvider})
      : _onlineProvider = onlineProvider,
        _localDatabase = localDatabase;

  final AppDatabase _localDatabase;
  final OnlineProvider _onlineProvider;

  Future<(List<ToDo>, bool)> getToDoList() async {
    final onlineTodoList = await _onlineProvider.database?.getToDoList();
    if (onlineTodoList != null) {
      await _localDatabase.setFromOnline(onlineTodoList.map((toDo) => toDo.parseToDoItemCompanion).toList());
      logger.i('Got list from online: $onlineTodoList');
      return (onlineTodoList, true);
    }
    final localToDoList = await _localDatabase.getToDoList();
    logger.i('Got list from local: $localToDoList');
    final localParsedList = localToDoList.map((toDoItem) => toDoItem.parseToDo).whereType<ToDo>().toList();
    return (localParsedList, false);
  }

  Future<(ToDo?, bool)> getToDoById({required String id}) async {
    final onlineToDo = await _onlineProvider.database?.getToDoById(id);
    if (onlineToDo != null) {
      await _localDatabase.createOrUpdateTodo(companion: onlineToDo.parseToDoItemCompanion);
      return (onlineToDo, true);
    }
    final localToDo = await _localDatabase.getToDoById(id: id);
    final parsedToDo = localToDo.parseToDo;
    return (parsedToDo, false);
  }

  Future<(void, bool)> createOrUpdateTodo({required ToDo todo}) async {
    final now = DateTime.now();
    var updatedToDo = todo.copyWith(changedAt: now);
    late ToDo? onlineToDo;
    if (updatedToDo.justCreated) {
      updatedToDo = updatedToDo.copyWith(id: const Uuid().v4(), createdAt: now);
      onlineToDo = await _onlineProvider.database?.createToDo(updatedToDo);
    } else {
      onlineToDo = await _onlineProvider.database?.updateToDo(updatedToDo);
    }

    if (onlineToDo != null) {
      await _localDatabase.createOrUpdateTodo(companion: onlineToDo.parseToDoItemCompanion);
      return (null, true);
    }
    await _localDatabase.createOrUpdateTodo(companion: updatedToDo.parseToDoItemCompanion);
    return (null, false);
  }

  Future<(void, bool)> deleteTodo({required String id}) async {
    final onlineToDo = await _onlineProvider.database?.deleteToDo(id);
    if (onlineToDo != null) {
      await _localDatabase.deleteTodo(id: id);
      return (null, true);
    }
    await _localDatabase.deleteTodo(id: id);
    return (null, false);
  }

  Future<void> logout() async {
    await _onlineProvider.logout();
    await _localDatabase.close();
  }
}
