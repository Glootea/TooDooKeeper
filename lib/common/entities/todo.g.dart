// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDoImpl _$$ToDoImplFromJson(Map<String, dynamic> json) => _$ToDoImpl(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      done: json['done'] as bool,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      importance: $enumDecodeNullable(_$ImportanceEnumMap, json['importance']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ToDoImplToJson(_$ToDoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'done': instance.done,
      'deadline': instance.deadline?.toIso8601String(),
      'importance': _$ImportanceEnumMap[instance.importance],
      'runtimeType': instance.$type,
    };

const _$ImportanceEnumMap = {
  Importance.low: 'low',
  Importance.high: 'high',
};

_$ToDoEmptyImpl _$$ToDoEmptyImplFromJson(Map<String, dynamic> json) =>
    _$ToDoEmptyImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      description: json['description'] as String? ?? '',
      done: json['done'] as bool? ?? false,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      importance:
          $enumDecodeNullable(_$ImportanceEnumMap, json['importance']) ?? null,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ToDoEmptyImplToJson(_$ToDoEmptyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'done': instance.done,
      'deadline': instance.deadline?.toIso8601String(),
      'importance': _$ImportanceEnumMap[instance.importance],
      'runtimeType': instance.$type,
    };
