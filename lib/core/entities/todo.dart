// ignore_for_file: always_put_required_named_parameters_first, avoid_equals_and_hash_code_on_mutable_classes, invalid_annotation_target

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/core/entities/importance.dart';
import 'package:yandex_summer_school/core/extensions/json_converter_extension.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@Freezed(fromJson: true, toJson: true)
sealed class ToDo extends Equatable with _$ToDo {
  const factory ToDo({
    required String id,
    @JsonKey(name: 'text') required String description,
    @Default(Importance.basic) Importance importance,
    @EpochDateTimeConverter() DateTime? deadline,
    @Default(false) bool done,
    int? color,
    @JsonKey(name: 'created_at') @EpochDateTimeConverter() required DateTime createdAt,
    @JsonKey(name: 'changed_at') @EpochDateTimeConverter() required DateTime changedAt,
    @JsonKey(name: 'last_updated_by') required String lastUpdatedBy,
  }) = _ToDo;

  const factory ToDo.justCreated({
    String? id,
    @JsonKey(name: 'text') @Default('') String description,
    @Default(Importance.basic) Importance importance,
    @EpochDateTimeConverter() DateTime? deadline,
    @Default(false) bool done,
    int? color,
    @JsonKey(name: 'created_at') @EpochDateTimeConverter() DateTime? createdAt,
    @JsonKey(name: 'changed_at') @EpochDateTimeConverter() DateTime? changedAt,
    @JsonKey(name: 'last_updated_by') String? lastUpdatedBy,
  }) = _ToDoEmpty;

  const ToDo._();

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoEmptyImpl.fromJson(json);

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

  String dataToExport(String deviceID) => jsonEncode(
        copyWith(
          createdAt: DateTime.now(),
          changedAt: DateTime.now(),
        ).toJson(),
      );

  bool get justCreated => id == null;

  @override
  List<Object?> get props => [
        id,
        description,
        importance,
        deadline,
        done,
        color,
      ];
}
