import 'package:drift/drift.dart';
import 'package:yandex_summer_school/data/data_sources/database_connection_shared.dart';
import 'package:yandex_summer_school/domain/todo.dart';

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

  Future<void> updateTodo({required ToDoItem todo}) {
    final companion = todo.id == idEmpty
        ? ToDoItemsCompanion.insert(
            // new
            description: todo.description,
            isDone: Value(todo.isDone),
            deadline: Value(todo.deadline),
            importance: Value(todo.importance),
          )
        : ToDoItemsCompanion(
            // already in database
            id: Value(todo.id),
            description: Value(todo.description),
            isDone: Value(todo.isDone),
            deadline: Value(todo.deadline),
            importance: Value(todo.importance),
          );
    return into(toDoItems).insert(companion);
  }

  Future<int> addTodo({required ToDoItem todo}) async => into(toDoItems).insert(todo);

  Future<void> deleteTodo({required int id}) async => (delete(toDoItems)..where((t) => t.id.equals(id))).go();

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy();
}
