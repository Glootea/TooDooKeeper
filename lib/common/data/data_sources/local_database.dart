import 'package:drift/drift.dart';
import 'package:yandex_summer_school/common/data/data_sources/database_connection_shared.dart';

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

  Future<int> createOrUpdateTodo({required ToDoItemsCompanion companion}) {
    return into(toDoItems).insert(companion, mode: InsertMode.insertOrReplace);
  }

  Future<void> deleteTodo({required int id}) async => (delete(toDoItems)..where((t) => t.id.equals(id))).go();

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await into(toDoItems).insert(
            const ToDoItem(
              id: 1,
              description: 'Добро пожаловать в приложение',
              isDone: false,
              importance: 'Importance.high',
            ),
          );
        },
      );

  Future<int> getToDoCount() => select(toDoItems).table.count().getSingle();
}
