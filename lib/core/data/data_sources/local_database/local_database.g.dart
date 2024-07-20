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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _importanceMeta =
      const VerificationMeta('importance');
  @override
  late final GeneratedColumn<String> importance = GeneratedColumn<String>(
      'importance', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('basic'));
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
      'is_done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_done" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _changedAtMeta =
      const VerificationMeta('changedAt');
  @override
  late final GeneratedColumn<DateTime> changedAt = GeneratedColumn<DateTime>(
      'changed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastUpdatedByMeta =
      const VerificationMeta('lastUpdatedBy');
  @override
  late final GeneratedColumn<String> lastUpdatedBy = GeneratedColumn<String>(
      'last_updated_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        description,
        importance,
        deadline,
        isDone,
        color,
        createdAt,
        changedAt,
        lastUpdatedBy,
        isDeleted
      ];
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
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('importance')) {
      context.handle(
          _importanceMeta,
          importance.isAcceptableOrUnknown(
              data['importance']!, _importanceMeta));
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    }
    if (data.containsKey('is_done')) {
      context.handle(_isDoneMeta,
          isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('changed_at')) {
      context.handle(_changedAtMeta,
          changedAt.isAcceptableOrUnknown(data['changed_at']!, _changedAtMeta));
    }
    if (data.containsKey('last_updated_by')) {
      context.handle(
          _lastUpdatedByMeta,
          lastUpdatedBy.isAcceptableOrUnknown(
              data['last_updated_by']!, _lastUpdatedByMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      importance: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}importance'])!,
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline']),
      isDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_done'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      changedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}changed_at']),
      lastUpdatedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_updated_by']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted']),
    );
  }

  @override
  $ToDoItemsTable createAlias(String alias) {
    return $ToDoItemsTable(attachedDatabase, alias);
  }
}

class ToDoItem extends DataClass implements Insertable<ToDoItem> {
  final String id;
  final String description;
  final String importance;
  final DateTime? deadline;
  final bool isDone;
  final int? color;
  final DateTime createdAt;
  final DateTime? changedAt;
  final String? lastUpdatedBy;
  final bool? isDeleted;
  const ToDoItem(
      {required this.id,
      required this.description,
      required this.importance,
      this.deadline,
      required this.isDone,
      this.color,
      required this.createdAt,
      this.changedAt,
      this.lastUpdatedBy,
      this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['description'] = Variable<String>(description);
    map['importance'] = Variable<String>(importance);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    map['is_done'] = Variable<bool>(isDone);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || changedAt != null) {
      map['changed_at'] = Variable<DateTime>(changedAt);
    }
    if (!nullToAbsent || lastUpdatedBy != null) {
      map['last_updated_by'] = Variable<String>(lastUpdatedBy);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<bool>(isDeleted);
    }
    return map;
  }

  ToDoItemsCompanion toCompanion(bool nullToAbsent) {
    return ToDoItemsCompanion(
      id: Value(id),
      description: Value(description),
      importance: Value(importance),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      isDone: Value(isDone),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      createdAt: Value(createdAt),
      changedAt: changedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(changedAt),
      lastUpdatedBy: lastUpdatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdatedBy),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
    );
  }

  factory ToDoItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ToDoItem(
      id: serializer.fromJson<String>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      importance: serializer.fromJson<String>(json['importance']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      color: serializer.fromJson<int?>(json['color']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      changedAt: serializer.fromJson<DateTime?>(json['changedAt']),
      lastUpdatedBy: serializer.fromJson<String?>(json['lastUpdatedBy']),
      isDeleted: serializer.fromJson<bool?>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'description': serializer.toJson<String>(description),
      'importance': serializer.toJson<String>(importance),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'isDone': serializer.toJson<bool>(isDone),
      'color': serializer.toJson<int?>(color),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'changedAt': serializer.toJson<DateTime?>(changedAt),
      'lastUpdatedBy': serializer.toJson<String?>(lastUpdatedBy),
      'isDeleted': serializer.toJson<bool?>(isDeleted),
    };
  }

  ToDoItem copyWith(
          {String? id,
          String? description,
          String? importance,
          Value<DateTime?> deadline = const Value.absent(),
          bool? isDone,
          Value<int?> color = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> changedAt = const Value.absent(),
          Value<String?> lastUpdatedBy = const Value.absent(),
          Value<bool?> isDeleted = const Value.absent()}) =>
      ToDoItem(
        id: id ?? this.id,
        description: description ?? this.description,
        importance: importance ?? this.importance,
        deadline: deadline.present ? deadline.value : this.deadline,
        isDone: isDone ?? this.isDone,
        color: color.present ? color.value : this.color,
        createdAt: createdAt ?? this.createdAt,
        changedAt: changedAt.present ? changedAt.value : this.changedAt,
        lastUpdatedBy:
            lastUpdatedBy.present ? lastUpdatedBy.value : this.lastUpdatedBy,
        isDeleted: isDeleted.present ? isDeleted.value : this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('ToDoItem(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('importance: $importance, ')
          ..write('deadline: $deadline, ')
          ..write('isDone: $isDone, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('changedAt: $changedAt, ')
          ..write('lastUpdatedBy: $lastUpdatedBy, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, importance, deadline, isDone,
      color, createdAt, changedAt, lastUpdatedBy, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ToDoItem &&
          other.id == this.id &&
          other.description == this.description &&
          other.importance == this.importance &&
          other.deadline == this.deadline &&
          other.isDone == this.isDone &&
          other.color == this.color &&
          other.createdAt == this.createdAt &&
          other.changedAt == this.changedAt &&
          other.lastUpdatedBy == this.lastUpdatedBy &&
          other.isDeleted == this.isDeleted);
}

class ToDoItemsCompanion extends UpdateCompanion<ToDoItem> {
  final Value<String> id;
  final Value<String> description;
  final Value<String> importance;
  final Value<DateTime?> deadline;
  final Value<bool> isDone;
  final Value<int?> color;
  final Value<DateTime> createdAt;
  final Value<DateTime?> changedAt;
  final Value<String?> lastUpdatedBy;
  final Value<bool?> isDeleted;
  final Value<int> rowid;
  const ToDoItemsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.importance = const Value.absent(),
    this.deadline = const Value.absent(),
    this.isDone = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.changedAt = const Value.absent(),
    this.lastUpdatedBy = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ToDoItemsCompanion.insert({
    required String id,
    required String description,
    this.importance = const Value.absent(),
    this.deadline = const Value.absent(),
    this.isDone = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.changedAt = const Value.absent(),
    this.lastUpdatedBy = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        description = Value(description);
  static Insertable<ToDoItem> custom({
    Expression<String>? id,
    Expression<String>? description,
    Expression<String>? importance,
    Expression<DateTime>? deadline,
    Expression<bool>? isDone,
    Expression<int>? color,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? changedAt,
    Expression<String>? lastUpdatedBy,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (importance != null) 'importance': importance,
      if (deadline != null) 'deadline': deadline,
      if (isDone != null) 'is_done': isDone,
      if (color != null) 'color': color,
      if (createdAt != null) 'created_at': createdAt,
      if (changedAt != null) 'changed_at': changedAt,
      if (lastUpdatedBy != null) 'last_updated_by': lastUpdatedBy,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ToDoItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? description,
      Value<String>? importance,
      Value<DateTime?>? deadline,
      Value<bool>? isDone,
      Value<int?>? color,
      Value<DateTime>? createdAt,
      Value<DateTime?>? changedAt,
      Value<String?>? lastUpdatedBy,
      Value<bool?>? isDeleted,
      Value<int>? rowid}) {
    return ToDoItemsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      importance: importance ?? this.importance,
      deadline: deadline ?? this.deadline,
      isDone: isDone ?? this.isDone,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      changedAt: changedAt ?? this.changedAt,
      lastUpdatedBy: lastUpdatedBy ?? this.lastUpdatedBy,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (importance.present) {
      map['importance'] = Variable<String>(importance.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (changedAt.present) {
      map['changed_at'] = Variable<DateTime>(changedAt.value);
    }
    if (lastUpdatedBy.present) {
      map['last_updated_by'] = Variable<String>(lastUpdatedBy.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToDoItemsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('importance: $importance, ')
          ..write('deadline: $deadline, ')
          ..write('isDone: $isDone, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('changedAt: $changedAt, ')
          ..write('lastUpdatedBy: $lastUpdatedBy, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  _$LocalDatabaseManager get managers => _$LocalDatabaseManager(this);
  late final $ToDoItemsTable toDoItems = $ToDoItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [toDoItems];
}

typedef $$ToDoItemsTableInsertCompanionBuilder = ToDoItemsCompanion Function({
  required String id,
  required String description,
  Value<String> importance,
  Value<DateTime?> deadline,
  Value<bool> isDone,
  Value<int?> color,
  Value<DateTime> createdAt,
  Value<DateTime?> changedAt,
  Value<String?> lastUpdatedBy,
  Value<bool?> isDeleted,
  Value<int> rowid,
});
typedef $$ToDoItemsTableUpdateCompanionBuilder = ToDoItemsCompanion Function({
  Value<String> id,
  Value<String> description,
  Value<String> importance,
  Value<DateTime?> deadline,
  Value<bool> isDone,
  Value<int?> color,
  Value<DateTime> createdAt,
  Value<DateTime?> changedAt,
  Value<String?> lastUpdatedBy,
  Value<bool?> isDeleted,
  Value<int> rowid,
});

class $$ToDoItemsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $ToDoItemsTable,
    ToDoItem,
    $$ToDoItemsTableFilterComposer,
    $$ToDoItemsTableOrderingComposer,
    $$ToDoItemsTableProcessedTableManager,
    $$ToDoItemsTableInsertCompanionBuilder,
    $$ToDoItemsTableUpdateCompanionBuilder> {
  $$ToDoItemsTableTableManager(_$LocalDatabase db, $ToDoItemsTable table)
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
            Value<String> id = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> importance = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<bool> isDone = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> changedAt = const Value.absent(),
            Value<String?> lastUpdatedBy = const Value.absent(),
            Value<bool?> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ToDoItemsCompanion(
            id: id,
            description: description,
            importance: importance,
            deadline: deadline,
            isDone: isDone,
            color: color,
            createdAt: createdAt,
            changedAt: changedAt,
            lastUpdatedBy: lastUpdatedBy,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String id,
            required String description,
            Value<String> importance = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<bool> isDone = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> changedAt = const Value.absent(),
            Value<String?> lastUpdatedBy = const Value.absent(),
            Value<bool?> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ToDoItemsCompanion.insert(
            id: id,
            description: description,
            importance: importance,
            deadline: deadline,
            isDone: isDone,
            color: color,
            createdAt: createdAt,
            changedAt: changedAt,
            lastUpdatedBy: lastUpdatedBy,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
        ));
}

class $$ToDoItemsTableProcessedTableManager extends ProcessedTableManager<
    _$LocalDatabase,
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
    extends FilterComposer<_$LocalDatabase, $ToDoItemsTable> {
  $$ToDoItemsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get importance => $state.composableBuilder(
      column: $state.table.importance,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get deadline => $state.composableBuilder(
      column: $state.table.deadline,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDone => $state.composableBuilder(
      column: $state.table.isDone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get changedAt => $state.composableBuilder(
      column: $state.table.changedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastUpdatedBy => $state.composableBuilder(
      column: $state.table.lastUpdatedBy,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDeleted => $state.composableBuilder(
      column: $state.table.isDeleted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ToDoItemsTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $ToDoItemsTable> {
  $$ToDoItemsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get importance => $state.composableBuilder(
      column: $state.table.importance,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get deadline => $state.composableBuilder(
      column: $state.table.deadline,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDone => $state.composableBuilder(
      column: $state.table.isDone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get changedAt => $state.composableBuilder(
      column: $state.table.changedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastUpdatedBy => $state.composableBuilder(
      column: $state.table.lastUpdatedBy,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDeleted => $state.composableBuilder(
      column: $state.table.isDeleted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$LocalDatabaseManager {
  final _$LocalDatabase _db;
  _$LocalDatabaseManager(this._db);
  $$ToDoItemsTableTableManager get toDoItems =>
      $$ToDoItemsTableTableManager(_db, _db.toDoItems);
}
