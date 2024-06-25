import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo.freezed.dart';
part 'todo.g.dart';

@Freezed(toJson: true, fromJson: true)
sealed class ToDo with _$ToDo {
  const factory ToDo({
    required int id,
    required String description,
    required bool done,
    DateTime? deadline,
    Importance? importance,
  }) = _ToDo;

  const factory ToDo.justCreated({
    @Default(null) int? id,
    @Default('') String description,
    @Default(false) bool done,
    @Default(null) DateTime? deadline,
    @Default(null) Importance? importance,
  }) = _ToDoEmpty;

  const ToDo._();

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);

  String get dataToExport => jsonEncode((this as _ToDo).toJson());
}

enum Importance {
  low,
  high;

  static Importance? fromString(String? value) {
    switch (value) {
      case 'Importance.low':
        return Importance.low;
      case 'Importance.high':
        return Importance.high;
      default:
        return null;
    }
  }
}
