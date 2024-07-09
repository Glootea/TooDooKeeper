import 'package:yandex_summer_school/core/data/data_sources/local_database/local_database.dart';
import 'package:yandex_summer_school/core/data/providers/online/remote_provider_abst.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/extensions/local_database_todo_mapper_extension.dart';
import 'package:yandex_summer_school/core/logger.dart';

class ToDoProvider {
  // TODO: handle failed online requests
  const ToDoProvider({
    required LocalDatabase localDatabase,
    required RemoteProvider onlineProvider,
  })  : _onlineProvider = onlineProvider,
        _localDatabase = localDatabase;

  final LocalDatabase _localDatabase;
  final RemoteProvider _onlineProvider;
  Future<(List<ToDo>, bool)> getToDoList() async {
    final onlineTodoList = await _onlineProvider.database?.getToDoList();
    final localToDoList = await _localDatabase.getToDoList();

    if (onlineTodoList != null) {
      final merged = _merge(local: localToDoList, remote: onlineTodoList);
      await _localDatabase.setFromOnline(merged.map((toDo) => toDo.parseToDoItemCompanion).toList());
      await _onlineProvider.database?.updateToDoList(merged);
      logger.i('Got list from online: $onlineTodoList');
      return (merged, true);
    }

    logger.i('Got list from local: $localToDoList');
    final localParsedList = localToDoList.map((toDoItem) => toDoItem.parseToDo).whereType<ToDo>().toList();
    return (localParsedList, false);
  }

  Future<(ToDo?, bool)> getToDoById({required String id}) async {
    final onlineToDo = await _onlineProvider.database?.getToDoById(id);
    final localToDo = await _localDatabase.getToDoById(id: id);
    if (onlineToDo != null) {
      final merged = _pickActual(local: localToDo, remote: onlineToDo);
      if (merged == null) return (null, false);
      await _localDatabase.updateTodo(companion: merged.parseToDoItemCompanion);
      return (onlineToDo, true);
    }
    final parsedToDo = localToDo.parseToDo;
    return (parsedToDo, false);
  }

  Future<(void, bool)> createTodo({required ToDo todo}) async {
    final onlineToDo = await _onlineProvider.database?.createToDo(todo);
    if (onlineToDo != null) {
      await _localDatabase.createTodo(companion: onlineToDo.parseToDoItemCompanion);
      return (null, true);
    }
    await _localDatabase.createTodo(companion: todo.parseToDoItemCompanion);
    return (null, false);
  }

  Future<(void, bool)> updateTodo({required ToDo todo}) async {
    final onlineToDo = await _onlineProvider.database?.updateToDo(todo);
    if (onlineToDo != null) {
      await _localDatabase.updateTodo(companion: onlineToDo.parseToDoItemCompanion);
      return (null, true);
    }
    await _localDatabase.updateTodo(companion: todo.parseToDoItemCompanion);
    return (null, false);
  }

  Future<(void, bool)> deleteTodo({required ToDo todo}) async {
    await _localDatabase.markAsDeleted(todo: todo.parseToDoItemCompanion);
    final onlineToDo = await _onlineProvider.database?.deleteToDo(todo.id!);
    if (onlineToDo != null) {
      await _localDatabase.deleteTodo(id: todo.id!);
      return (null, true);
    }
    await _localDatabase.deleteTodo(id: todo.id!);
    return (null, false);
  }

  Future<void> logout() async {
    await _onlineProvider.logout();
    await _localDatabase.close();
  }

  List<ToDo> _merge({required List<ToDoItem> local, required List<ToDo?> remote}) {
    final localCopy = List<ToDoItem>.from(local);
    final remoteCopy = List<ToDo?>.from(remote);
    localCopy.sort((a, b) => a.id.compareTo(b.id));
    remoteCopy.sort((a, b) => a!.id!.compareTo(b!.id!));
    final result = <ToDo>[];
    for (final localToDoItem in localCopy) {
      final remoteItem = remoteCopy.firstWhere((element) => element!.id == localToDoItem.id, orElse: () => null);
      final actual = _pickActual(local: localToDoItem, remote: remoteItem);
      remoteCopy.remove(remoteItem);
      if (actual == null) continue;
      result.add(actual);
    }
    return result + remoteCopy.whereType<ToDo>().toList();
  }

  ToDo? _pickActual({ToDoItem? local, ToDo? remote}) {
    if (local == null && remote == null) return null;
    if ((local?.isDeleted ?? false) == true) {
      return null;
    }
    if (local == null) return remote!;
    if (remote == null) return local.parseToDo!;
    return local.changedAt!.isAfter(remote.changedAt!) ? local.parseToDo! : remote;
  }
}
