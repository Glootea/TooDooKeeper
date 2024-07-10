import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yandex_summer_school/core/data/data_sources/local_database/local_database.dart';

class FakeCompanion extends Mock implements ToDoItemsCompanion {}

class FakeLocalDatabase extends Mock implements LocalDatabase {
  final _deviceId = 'deviceId';
  List<ToDoItem> _todos = [];
  @override
  Future<List<ToDoItem>> getToDoList() async => _todos.toList();

  @override
  Future<ToDoItem?> getToDoById({required String id}) async => _todos.where((t) => t.id == id).firstOrNull;

  @override
  Future<void> createToDo({required ToDoItemsCompanion companion}) async => _todos.add(
        _parseItem(companion).copyWith(
          changedAt: Value(DateTime.now()),
          createdAt: DateTime.now(),
          lastUpdatedBy: Value(_deviceId),
        ),
      );

  @override
  Future<void> updateTodo({required ToDoItemsCompanion companion}) async => _todos.add(
        _parseItem(companion).copyWith(
          changedAt: Value(DateTime.now()),
          lastUpdatedBy: Value(_deviceId),
        ),
      );

  @override
  Future<void> deleteToDo({required String id}) async => _todos.removeWhere((t) => t.id == id);

  @override
  Future<void> setFromOnline(List<ToDoItemsCompanion> list) async => _todos = list.map(_parseItem).toList();

  @override
  Future<void> markAsDeleted({required ToDoItemsCompanion todo}) {
    for (var i = 0; i < _todos.length; i++) {
      if (_todos[i].id == todo.id.value) {
        _todos[i] = _todos[i].copyWith(isDeleted: const Value(true));
        return Future.value();
      }
    }
    return Future.value();
  }

  ToDoItem _parseItem(ToDoItemsCompanion companion) => ToDoItem(
      id: companion.id.value,
      description: companion.description.value,
      importance: companion.importance.value,
      isDone: companion.isDone.value,
      createdAt: companion.createdAt.value);
}
