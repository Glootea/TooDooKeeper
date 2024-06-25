import 'package:drift/drift.dart';
import 'package:yandex_summer_school/common/data/data_sources/local_database/database_connection_shared.dart';

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
          await Future.wait([
            into(toDoItems).insert(
              const ToDoItemsCompanion(
                id: Value(1),
                description: Value('Простой to-do'),
                isDone: Value(false),
                deadline: Value(null),
                importance: Value(null),
              ),
            ),
            into(toDoItems).insert(
              ToDoItemsCompanion(
                id: const Value(2),
                description: const Value(
                  'Очень длинная задача, которая точно не поместиться в одну строчку. Даже в три строки ее сложно будет уместить. Еще и дедлайн для нее надо отразить? ',
                ),
                isDone: const Value(false),
                deadline: Value(DateTime(2024, 17, 12)),
                importance: const Value('Importance.high'),
              ),
            ),
            into(toDoItems).insert(
              const ToDoItemsCompanion(
                id: Value(3),
                description: Value('Задачи с низким приоритетом выполнять проще...'),
                isDone: Value(true),
                deadline: Value(null),
                importance: Value('Importance.low'),
              ),
            ),
            into(toDoItems).insert(
              const ToDoItemsCompanion(
                id: Value(4),
                description: Value('Я здесь, чтобы заполнить пространство\n\n'),
                isDone: Value(false),
                deadline: Value(null),
                importance: Value('null'),
              ),
            ),
            into(toDoItems).insert(
              const ToDoItemsCompanion(
                id: Value(5),
                description: Value('Нужно съесть еще больше места\n\n'),
                isDone: Value(false),
                deadline: Value(null),
                importance: Value('null'),
              ),
            ),
            into(toDoItems).insert(
              const ToDoItemsCompanion(
                id: Value(6),
                description: Value('Еще чуть-чуть...\n\n'),
                isDone: Value(false),
                deadline: Value(null),
                importance: Value('null'),
              ),
            ),
            into(toDoItems).insert(
              const ToDoItemsCompanion(
                id: Value(7),
                description: Value('Скролится ли этот экран?\n\n'),
                isDone: Value(false),
                deadline: Value(null),
                importance: Value('null'),
              ),
            ),
            into(toDoItems).insert(
              const ToDoItemsCompanion(
                id: Value(8),
                description: Value('Меня никто не увидет :('),
                isDone: Value(false),
                deadline: Value(null),
                importance: Value('null'),
              ),
            ),
            into(toDoItems).insert(
              const ToDoItemsCompanion(
                id: Value(9),
                description: Value('Теперь оно точно выше экрана!\n\n'),
                isDone: Value(false),
                deadline: Value(null),
                importance: Value('null'),
              ),
            ),
            into(toDoItems).insert(
              const ToDoItemsCompanion(
                id: Value(10),
                description: Value('Теперь оно точно выше экрана!\n\n'),
                isDone: Value(false),
                deadline: Value(null),
                importance: Value('null'),
              ),
            ),
            into(toDoItems).insert(
              const ToDoItemsCompanion(
                id: Value(11),
                description: Value('Теперь оно точно выше экрана!\n\n'),
                isDone: Value(false),
                deadline: Value(null),
                importance: Value('null'),
              ),
            ),
          ]);
        },
      );

  Future<int> getToDoCount() => select(toDoItems).table.count().getSingle();
}
