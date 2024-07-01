import 'package:drift/drift.dart';
import 'package:yandex_summer_school/core/data/data_sources/local_database/local_database.dart';
import 'package:yandex_summer_school/core/entities/importance.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';

extension TodoToToDoItemsCompanionMapperExtension on ToDo {
  ToDoItemsCompanion get parseToDoItemCompanion => ToDoItemsCompanion(
        id: id == null ? const Value.absent() : Value(id!),
        description: Value(description),
        isDone: Value(done),
        deadline: Value(deadline),
        importance: Value(importance.toString()),
        color: Value(color),
        createdAt: Value(createdAt!),
        changedAt: Value(changedAt),
        lastUpdatedBy: Value(lastUpdatedBy),
      );
}

extension ToDoItemToToDoMapperExtension on ToDoItem? {
  ToDo? get parseToDo {
    if (this == null) {
      return null;
    } else {
      return ToDo.justCreated(
        id: this!.id,
        description: this!.description,
        done: this!.isDone,
        deadline: this!.deadline,
        importance: Importance.fromString(this!.importance),
        color: this!.color,
        createdAt: this!.createdAt,
        changedAt: this!.changedAt,
        lastUpdatedBy: this!.lastUpdatedBy,
      );
    }
  }
}
