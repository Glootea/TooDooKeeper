// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $ToDoItemsTable extends ToDoItems
    with TableInfo<$ToDoItemsTable, ToDoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToDoItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
      'is_done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_done" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _importanceMeta =
      const VerificationMeta('importance');
  @override
  late final GeneratedColumn<String> importance = GeneratedColumn<String>(
      'importance', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('null'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, description, isDone, deadline, importance];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'to_do_items';
  @override
  VerificationContext validateIntegrity(Insertable<ToDoItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(_isDoneMeta,
          isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta));
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    }
    if (data.containsKey('importance')) {
      context.handle(
          _importanceMeta,
          importance.isAcceptableOrUnknown(
              data['importance']!, _importanceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToDoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ToDoItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_done'])!,
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline']),
      importance: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}importance']),
    );
  }

  @override
  $ToDoItemsTable createAlias(String alias) {
    return $ToDoItemsTable(attachedDatabase, alias);
  }
}

class ToDoItem extends DataClass implements Insertable<ToDoItem> {
  final int id;
  final String description;
  final bool isDone;
  final DateTime? deadline;
  final String? importance;
  const ToDoItem(
      {required this.id,
      required this.description,
      required this.isDone,
      this.deadline,
      this.importance});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['is_done'] = Variable<bool>(isDone);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    if (!nullToAbsent || importance != null) {
      map['importance'] = Variable<String>(importance);
    }
    return map;
  }

  ToDoItemsCompanion toCompanion(bool nullToAbsent) {
    return ToDoItemsCompanion(
      id: Value(id),
      description: Value(description),
      isDone: Value(isDone),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      importance: importance == null && nullToAbsent
          ? const Value.absent()
          : Value(importance),
    );
  }

  factory ToDoItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ToDoItem(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      importance: serializer.fromJson<String?>(json['importance']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'isDone': serializer.toJson<bool>(isDone),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'importance': serializer.toJson<String?>(importance),
    };
  }

  ToDoItem copyWith(
          {int? id,
          String? description,
          bool? isDone,
          Value<DateTime?> deadline = const Value.absent(),
          Value<String?> importance = const Value.absent()}) =>
      ToDoItem(
        id: id ?? this.id,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        deadline: deadline.present ? deadline.value : this.deadline,
        importance: importance.present ? importance.value : this.importance,
      );
  @override
  String toString() {
    return (StringBuffer('ToDoItem(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('isDone: $isDone, ')
          ..write('deadline: $deadline, ')
          ..write('importance: $importance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, description, isDone, deadline, importance);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ToDoItem &&
          other.id == this.id &&
          other.description == this.description &&
          other.isDone == this.isDone &&
          other.deadline == this.deadline &&
          other.importance == this.importance);
}

class ToDoItemsCompanion extends UpdateCompanion<ToDoItem> {
  final Value<int> id;
  final Value<String> description;
  final Value<bool> isDone;
  final Value<DateTime?> deadline;
  final Value<String?> importance;
  const ToDoItemsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.isDone = const Value.absent(),
    this.deadline = const Value.absent(),
    this.importance = const Value.absent(),
  });
  ToDoItemsCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.isDone = const Value.absent(),
    this.deadline = const Value.absent(),
    this.importance = const Value.absent(),
  }) : description = Value(description);
  static Insertable<ToDoItem> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<bool>? isDone,
    Expression<DateTime>? deadline,
    Expression<String>? importance,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (isDone != null) 'is_done': isDone,
      if (deadline != null) 'deadline': deadline,
      if (importance != null) 'importance': importance,
    });
  }

  ToDoItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<bool>? isDone,
      Value<DateTime?>? deadline,
      Value<String?>? importance}) {
    return ToDoItemsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      deadline: deadline ?? this.deadline,
      importance: importance ?? this.importance,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (importance.present) {
      map['importance'] = Variable<String>(importance.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToDoItemsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('isDone: $isDone, ')
          ..write('deadline: $deadline, ')
          ..write('importance: $importance')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $ToDoItemsTable toDoItems = $ToDoItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [toDoItems];
}

typedef $$ToDoItemsTableInsertCompanionBuilder = ToDoItemsCompanion Function({
  Value<int> id,
  required String description,
  Value<bool> isDone,
  Value<DateTime?> deadline,
  Value<String?> importance,
});
typedef $$ToDoItemsTableUpdateCompanionBuilder = ToDoItemsCompanion Function({
  Value<int> id,
  Value<String> description,
  Value<bool> isDone,
  Value<DateTime?> deadline,
  Value<String?> importance,
});

class $$ToDoItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ToDoItemsTable,
    ToDoItem,
    $$ToDoItemsTableFilterComposer,
    $$ToDoItemsTableOrderingComposer,
    $$ToDoItemsTableProcessedTableManager,
    $$ToDoItemsTableInsertCompanionBuilder,
    $$ToDoItemsTableUpdateCompanionBuilder> {
  $$ToDoItemsTableTableManager(_$AppDatabase db, $ToDoItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ToDoItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ToDoItemsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ToDoItemsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> isDone = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<String?> importance = const Value.absent(),
          }) =>
              ToDoItemsCompanion(
            id: id,
            description: description,
            isDone: isDone,
            deadline: deadline,
            importance: importance,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String description,
            Value<bool> isDone = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<String?> importance = const Value.absent(),
          }) =>
              ToDoItemsCompanion.insert(
            id: id,
            description: description,
            isDone: isDone,
            deadline: deadline,
            importance: importance,
          ),
        ));
}

class $$ToDoItemsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ToDoItemsTable,
    ToDoItem,
    $$ToDoItemsTableFilterComposer,
    $$ToDoItemsTableOrderingComposer,
    $$ToDoItemsTableProcessedTableManager,
    $$ToDoItemsTableInsertCompanionBuilder,
    $$ToDoItemsTableUpdateCompanionBuilder> {
  $$ToDoItemsTableProcessedTableManager(super.$state);
}

class $$ToDoItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ToDoItemsTable> {
  $$ToDoItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDone => $state.composableBuilder(
      column: $state.table.isDone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get deadline => $state.composableBuilder(
      column: $state.table.deadline,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get importance => $state.composableBuilder(
      column: $state.table.importance,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ToDoItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ToDoItemsTable> {
  $$ToDoItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDone => $state.composableBuilder(
      column: $state.table.isDone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get deadline => $state.composableBuilder(
      column: $state.table.deadline,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get importance => $state.composableBuilder(
      column: $state.table.importance,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$ToDoItemsTableTableManager get toDoItems =>
      $$ToDoItemsTableTableManager(_db, _db.toDoItems);
}
