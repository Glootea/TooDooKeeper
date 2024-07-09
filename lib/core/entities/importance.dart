enum Importance implements Comparable<Importance> {
  low._(1),
  basic._(2),
  important._(3);

  const Importance._(this.value);
  final int value;

  static Importance fromString(String? value) {
    return switch (value) {
      'low' => Importance.low,
      'basic' => Importance.basic,
      'important' => Importance.important,
      _ => throw UnsupportedError('Unknown Importance: $value'),
    };
  }

  @override
  String toString() {
    return switch (this) {
      Importance.low => 'low',
      Importance.basic => 'basic',
      Importance.important => 'important',
    };
  }

  @override
  int compareTo(Importance other) => value.compareTo(other.value);
}
