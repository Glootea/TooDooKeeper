import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:uuid/uuid.dart';
import 'package:yandex_summer_school/core/data/data_sources/local_database/local_database.dart';
import 'package:yandex_summer_school/core/data/providers/device_id_provider.dart';
import 'package:yandex_summer_school/core/data/providers/online/online_provider_abst.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/extensions/local_database_todo_mapper_extension.dart';
import 'package:yandex_summer_school/core/logger.dart';

class ToDoRepository {
  // TODO: handle failed online requests
  const ToDoRepository(
      {required LocalDatabase localDatabase,
      required OnlineProvider onlineProvider,
      required DeviceIdProvider deviceIdProvider,
      required FirebaseAnalytics firebaseAnalytics})
      : _onlineProvider = onlineProvider,
        _localDatabase = localDatabase,
        _deviceIdProvider = deviceIdProvider,
        _firebaseAnalytics = firebaseAnalytics;

  final LocalDatabase _localDatabase;
  final OnlineProvider _onlineProvider;
  final DeviceIdProvider _deviceIdProvider;
  final FirebaseAnalytics _firebaseAnalytics;

  Future<(List<ToDo>, bool)> getToDoList() async {
    final onlineTodoList = await _onlineProvider.database
        ?.getToDoList()
        .catchError((e) => <ToDo>[]);
    final localToDoList = await _localDatabase.getToDoList(withDeleted: true);

    if (onlineTodoList != null) {
      final merged = _merge(local: localToDoList, online: onlineTodoList);
      await _localDatabase.setFromOnline(
          merged.map((toDo) => toDo.parseToDoItemCompanion).toList());
      await _onlineProvider.database?.updateToDoList(merged);
      logger.i('Got list from online: $onlineTodoList');
      return (merged, true);
    }

    final localToDoListToShow = await _localDatabase.getToDoList();
    logger.i('Got list from local: $localToDoListToShow');
    final localParsedList = localToDoListToShow
        .map((toDoItem) => toDoItem.parseToDo)
        .whereType<ToDo>()
        .toList();
    return (localParsedList, false);
  }

  Future<(ToDo?, bool)> getToDoById({required String id}) async {
    final onlineToDo = await _onlineProvider.database?.getToDoById(id);
    final localToDo =
        await _localDatabase.getToDoById(id: id, withDeleted: true);
    if (onlineToDo != null) {
      final merged = _pickActual(local: localToDo, online: onlineToDo);
      if (merged == null) return (null, false);
      await _localDatabase.updateTodo(companion: merged.parseToDoItemCompanion);
      return (merged, true);
    }

    final localToShow = await _localDatabase.getToDoById(id: id);
    final parsedToDo = localToShow.parseToDo;
    return (parsedToDo, false);
  }

  Future<(void, bool)> createTodo({required ToDo todo}) async {
    await _firebaseAnalytics.logEvent(name: 'create_todo');

    final time = DateTime.now();
    final updatedToDo = todo.copyWith(
      id: const Uuid().v4(),
      createdAt: time,
      changedAt: time,
      lastUpdatedBy: _deviceIdProvider.deviceId,
    );
    final onlineToDo = await _onlineProvider.database?.createToDo(updatedToDo);
    if (onlineToDo != null) {
      await _localDatabase.createToDo(
          companion: onlineToDo.parseToDoItemCompanion);
      return (null, true);
    }
    await _localDatabase.createToDo(
        companion: updatedToDo.parseToDoItemCompanion);
    return (null, false);
  }

  Future<(void, bool)> updateTodo({required ToDo todo}) async {
    final time = DateTime.now();
    final updatedToDo = todo.copyWith(
        changedAt: time, lastUpdatedBy: _deviceIdProvider.deviceId);
    final onlineToDo = await _onlineProvider.database?.updateToDo(updatedToDo);
    if (onlineToDo != null) {
      await _localDatabase.updateTodo(
          companion: onlineToDo.parseToDoItemCompanion);
      return (null, true);
    }
    await _localDatabase.updateTodo(
        companion: updatedToDo.parseToDoItemCompanion);
    return (null, false);
  }

  Future<(void, bool)> deleteTodo({required ToDo todo}) async {
    await _firebaseAnalytics.logEvent(name: 'Delete ToDo');

    final time = DateTime.now();
    final updatedToDo = todo.copyWith(
        changedAt: time, lastUpdatedBy: _deviceIdProvider.deviceId);
    await _localDatabase.markAsDeleted(
        todo: updatedToDo.parseToDoItemCompanion);
    final onlineToDo =
        await _onlineProvider.database?.deleteToDo(updatedToDo.id!);
    if (onlineToDo != null) {
      await _localDatabase.deleteToDo(id: updatedToDo.id!);
      return (null, true);
    }
    return (null, false);
  }

  Future<void> logout() async {
    await _onlineProvider.logout();
    await _localDatabase.logout();
  }

  List<ToDo> _merge(
      {required List<ToDoItem> local, required List<ToDo?> online}) {
    final localCopy = List<ToDoItem>.from(local);
    final onlineCopy = List<ToDo?>.from(online);
    localCopy.sort((a, b) => a.id.compareTo(b.id));
    onlineCopy.sort((a, b) => a!.id!.compareTo(b!.id!));
    final result = <ToDo>[];
    for (final localToDoItem in localCopy) {
      final onlineItem = onlineCopy.firstWhere(
          (element) => element!.id == localToDoItem.id,
          orElse: () => null);
      final actual = _pickActual(local: localToDoItem, online: onlineItem);
      onlineCopy.remove(onlineItem);
      if (actual == null) continue;
      result.add(actual);
    }
    return result + onlineCopy.whereType<ToDo>().toList();
  }

  ToDo? _pickActual({ToDoItem? local, ToDo? online}) {
    if (local == null && online == null) return null;
    if ((local?.isDeleted ?? false) == true) {
      return null;
    }
    if (local == null) return online!;
    if (online == null) return local.parseToDo!;
    return local.changedAt!.isAfter(online.changedAt!)
        ? local.parseToDo!
        : online;
  }
}
