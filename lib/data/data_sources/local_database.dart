import 'package:drift/drift.dart';
import 'package:yandex_summer_school/data/data_sources/database_connection_shared.dart';

part 'local_database.g.dart';

class ToDoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  DateTimeColumn get deadline => dateTime().nullable()();
  TextColumn get importance => text().nullable().withDefault(const Constant('null'))();
}

@DriftDatabase(tables: [ToDoItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connect());

  Future<List<ToDoItem>> getToDoList({int? limit, int? offset}) async {
    if (limit == null) {
      return select(toDoItems).get();
    }
    return (select(toDoItems)..limit(limit, offset: offset)).get();
  }

  Future<ToDoItem?> getToDoById({required int id}) async {
    return (select(toDoItems)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> updateTodo({required ToDoItem todo}) async => update(toDoItems).replace(todo);

  Future<int> addTodo({required ToDoItem todo}) async => into(toDoItems).insert(todo);

  Future<void> deleteTodo({required int id}) async => (delete(toDoItems)..where((t) => t.id.equals(id))).go();

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy();
}
