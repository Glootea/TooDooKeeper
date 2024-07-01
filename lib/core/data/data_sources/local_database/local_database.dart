import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:yandex_summer_school/core/data/data_sources/local_database/database_connection_shared.dart';

part 'local_database.g.dart';

class ToDoItems extends Table {
  TextColumn get id => text()();
  TextColumn get description => text()();
  TextColumn get importance => text().withDefault(const Constant('basic'))();
  DateTimeColumn get deadline => dateTime().nullable()();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  IntColumn get color => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get changedAt => dateTime().nullable()();
  TextColumn get lastUpdatedBy => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DriftDatabase(tables: [ToDoItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connect());

  Future<List<ToDoItem>> getToDoList() async => select(toDoItems).get();

  Future<ToDoItem?> getToDoById({required String id}) async {
    return (select(toDoItems)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> createOrUpdateTodo({required ToDoItemsCompanion companion}) {
    // TODO: divide into two functions
    return into(toDoItems).insertOnConflictUpdate(companion);
  }

  Future<void> deleteTodo({required String id}) async => (delete(toDoItems)..where((t) => t.id.equals(id))).go();

  Future<void> setFromOnline(List<ToDoItemsCompanion> list) async {
    await delete(toDoItems).go();
    return batch((b) => b.insertAllOnConflictUpdate(toDoItems, list));
  }

  Future<void> logout() async => delete(toDoItems).go();

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (kDebugMode) {
            await m.createAll();
            await delete(toDoItems).go();
            await m.createAll();
          }
        },
        onCreate: (m) async {
          await m.createAll();
        },
      );
}
