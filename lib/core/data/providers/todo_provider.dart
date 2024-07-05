import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:yandex_summer_school/core/data/data_sources/local_database/local_database.dart';
import 'package:yandex_summer_school/core/data/providers/online/online_provider_abst.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/main.dart';

class ToDoProvider {
  const ToDoProvider({required this.localDatabase, required this.onlineProvider});

  final AppDatabase localDatabase;
  final OnlineProvider onlineProvider;

  Future<List<ToDo>> getToDoList() async {
    final online = await onlineProvider.database?.getToDoList();
    if (online != null) {
      await localDatabase.setFromOnline(online.map(_parseToDoItemCompanion).toList());
      logger.i('Got list from online: $online');
      return online;
    }
    final local = await localDatabase.getToDoList();
    logger.i('Got list from local: $local');
    return local.map(_parseToDoItem).whereType<ToDo>().toList();
  }

  Future<ToDo?> getToDoById({required String id}) async {
    final online = await onlineProvider.database?.getToDoById(id);
    if (online != null) {
      await localDatabase.createOrUpdateTodo(companion: _parseToDoItemCompanion(online));
      return online;
    }
    final local = await localDatabase.getToDoById(id: id);
    return _parseToDoItem(local);
  }

  Future<void> createOrUpdateTodo({required ToDo todo}) async {
    final now = DateTime.now();
    var updatedToDo = todo.copyWith(changedAt: now);
    late ToDo? online;
    if (updatedToDo.justCreated) {
      updatedToDo = updatedToDo.copyWith(id: const Uuid().v4(), createdAt: now);
      online = await onlineProvider.database?.createToDo(updatedToDo);
    } else {
      online = await onlineProvider.database?.updateToDo(updatedToDo);
    }

    if (online != null) {
      await localDatabase.createOrUpdateTodo(companion: _parseToDoItemCompanion(online));
      return;
    }
    return localDatabase.createOrUpdateTodo(companion: _parseToDoItemCompanion(updatedToDo));
  }

  Future<void> deleteTodo({required String id}) async {
    await onlineProvider.database?.deleteToDo(id);
    return localDatabase.deleteTodo(id: id);
  }

  ToDoItemsCompanion _parseToDoItemCompanion(ToDo todo) => ToDoItemsCompanion(
        id: todo.id == null ? const Value.absent() : Value(todo.id!),
        description: Value(todo.description),
        isDone: Value(todo.done),
        deadline: Value(todo.deadline),
        importance: Value(todo.importance.toString()),
        color: Value(todo.color),
        createdAt: Value(todo.createdAt!),
        changedAt: Value(todo.changedAt),
        lastUpdatedBy: Value(todo.lastUpdatedBy),
      );

  ToDo? _parseToDoItem(ToDoItem? item) {
    if (item == null) {
      return null;
    }
    return ToDo.justCreated(
      id: item.id,
      description: item.description,
      done: item.isDone,
      deadline: item.deadline,
      importance: Importance.fromString(item.importance),
      color: item.color,
      createdAt: item.createdAt,
      changedAt: item.changedAt,
      lastUpdatedBy: item.lastUpdatedBy,
    );
  }
}
