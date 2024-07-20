// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDoImpl _$$ToDoImplFromJson(Map<String, dynamic> json) => _$ToDoImpl(
      id: json['id'] as String,
      description: json['text'] as String,
      importance:
          $enumDecodeNullable(_$ImportanceEnumMap, json['importance']) ??
              Importance.basic,
      deadline: const EpochDateTimeConverter()
          .fromJson((json['deadline'] as num?)?.toInt()),
      done: json['done'] as bool? ?? false,
      color: (json['color'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      changedAt: DateTime.parse(json['changed_at'] as String),
      lastUpdatedBy: json['last_updated_by'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ToDoImplToJson(_$ToDoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.description,
      'importance': _$ImportanceEnumMap[instance.importance]!,
      'deadline': const EpochDateTimeConverter().toJson(instance.deadline),
      'done': instance.done,
      'color': instance.color,
      'created_at': instance.createdAt.toIso8601String(),
      'changed_at': instance.changedAt.toIso8601String(),
      'last_updated_by': instance.lastUpdatedBy,
      'runtimeType': instance.$type,
    };

const _$ImportanceEnumMap = {
  Importance.low: 'low',
  Importance.basic: 'basic',
  Importance.important: 'important',
};

_$ToDoEmptyImpl _$$ToDoEmptyImplFromJson(Map<String, dynamic> json) =>
    _$ToDoEmptyImpl(
      id: json['id'] as String?,
      description: json['text'] as String? ?? '',
      importance:
          $enumDecodeNullable(_$ImportanceEnumMap, json['importance']) ??
              Importance.basic,
      deadline: const EpochDateTimeConverter()
          .fromJson((json['deadline'] as num?)?.toInt()),
      done: json['done'] as bool? ?? false,
      color: (json['color'] as num?)?.toInt(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num?)?.toInt()),
      changedAt: const EpochDateTimeConverter()
          .fromJson((json['changed_at'] as num?)?.toInt()),
      lastUpdatedBy: json['last_updated_by'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ToDoEmptyImplToJson(_$ToDoEmptyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.description,
      'importance': _$ImportanceEnumMap[instance.importance]!,
      'deadline': const EpochDateTimeConverter().toJson(instance.deadline),
      'done': instance.done,
      'color': instance.color,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'changed_at': const EpochDateTimeConverter().toJson(instance.changedAt),
      'last_updated_by': instance.lastUpdatedBy,
      'runtimeType': instance.$type,
    };
