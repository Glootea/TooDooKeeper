import 'package:freezed_annotation/freezed_annotation.dart';
part 'importance.freezed.dart';

@freezed
sealed class Importance implements Comparable<Importance> {
  const factory Importance.low() = LowImportance;
  const factory Importance.basic() = BasicImportance;
  const factory Importance.important() = ImportantImportance;

  static Importance fromString(String? value) {
    return switch (value) {
      'low' => const LowImportance(),
      'basic' => const BasicImportance(),
      'important' => const ImportantImportance(),
      _ => throw UnsupportedError('Unknown Importance: $value'),
    };
  }

  @override
  String toString() {
    return switch (this) {
      LowImportance() => 'low',
      BasicImportance() => 'basic',
      ImportantImportance() => 'important',
    };
  }

  @override
  int compareTo(Importance other) {
    return switch ((this, other)) {
      (LowImportance(), LowImportance()) ||
      (BasicImportance(), BasicImportance()) ||
      (ImportantImportance(), ImportantImportance()) =>
        0,
      (LowImportance(), BasicImportance()) ||
      (LowImportance(), ImportantImportance()) ||
      (BasicImportance(), ImportantImportance()) =>
        1,
      (BasicImportance(), LowImportance()) ||
      (ImportantImportance(), LowImportance()) ||
      (ImportantImportance(), BasicImportance()) =>
        -1,
    };
  }
}
