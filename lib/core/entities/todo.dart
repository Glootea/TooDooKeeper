// ignore_for_file: always_put_required_named_parameters_first

import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/core/entities/importance.dart';

part 'todo.freezed.dart';

@Freezed(fromJson: false, toJson: false)
sealed class ToDo with _$ToDo {
  const factory ToDo({
    required String id,
    required String description,
    @Default(Importance.basic) Importance importance,
    DateTime? deadline,
    @Default(false) bool done,
    int? color,
    required DateTime createdAt,
    required DateTime changedAt,
    required String lastUpdatedBy,
  }) = _ToDo;

  const factory ToDo.justCreated({
    String? id,
    @Default('') String description,
    @Default(Importance.basic) Importance importance,
    DateTime? deadline,
    @Default(false) bool done,
    int? color,
    DateTime? createdAt,
    DateTime? changedAt,
    String? lastUpdatedBy,
  }) = _ToDoEmpty;

  const ToDo._();

  factory ToDo.fromJson(Map<String, dynamic> json) {
    final dead = json['deadline'] as int?;
    final color = json['color'] as String?;
    return ToDo.justCreated(
      id: json['id'] as String?,
      description: json['text'] as String,
      importance: Importance.fromString(json['importance'] as String),
      deadline: dead != null ? DateTime.fromMillisecondsSinceEpoch(dead) : null,
      done: json['done'] as bool,
      color: color != null ? int.parse(color.substring(1), radix: 16) : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at'] as int),
      changedAt: DateTime.fromMillisecondsSinceEpoch(json['changed_at'] as int),
      lastUpdatedBy: json['last_updated_by'] as String,
    );
  }
  factory ToDo.justCreatedFromJson(String json) {
    final jsonMap = jsonDecode(json) as Map<String, dynamic>;
    final parsed = ToDo.fromJson(jsonMap);
    return ToDo.justCreated(
      id: parsed.id,
      description: parsed.description,
      importance: parsed.importance,
      deadline: parsed.deadline,
      done: parsed.done,
      color: parsed.color,
      createdAt: parsed.createdAt,
      changedAt: parsed.changedAt,
      lastUpdatedBy: parsed.lastUpdatedBy,
    );
  }

  Map<String, dynamic> toJson(String deviceID) {
    return {
      'id': id, // уникальный идентификатор элемента
      'text': description,
      'importance': importance.toString(), // importance = low | basic | important
      'deadline': deadline?.millisecondsSinceEpoch,
      'done': done,
      'color': null, // может отсутствовать
      'created_at': createdAt!.millisecondsSinceEpoch,
      'changed_at': changedAt!.millisecondsSinceEpoch,
      'last_updated_by': deviceID,
    };
  }

  String dataToExport(String deviceID) => jsonEncode(
        copyWith(
          createdAt: DateTime.now(),
          changedAt: DateTime.now(),
        ).toJson(deviceID),
      );

  bool get justCreated => id == null;
}
