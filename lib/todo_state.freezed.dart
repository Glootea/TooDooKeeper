// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ToDoState {
  String get text => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  Importance? get importance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToDoStateCopyWith<ToDoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoStateCopyWith<$Res> {
  factory $ToDoStateCopyWith(ToDoState value, $Res Function(ToDoState) then) =
      _$ToDoStateCopyWithImpl<$Res, ToDoState>;
  @useResult
  $Res call(
      {String text, bool done, DateTime? deadline, Importance? importance});
}

/// @nodoc
class _$ToDoStateCopyWithImpl<$Res, $Val extends ToDoState>
    implements $ToDoStateCopyWith<$Res> {
  _$ToDoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? done = null,
    Object? deadline = freezed,
    Object? importance = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      importance: freezed == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Importance?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDoStateImplCopyWith<$Res>
    implements $ToDoStateCopyWith<$Res> {
  factory _$$ToDoStateImplCopyWith(
          _$ToDoStateImpl value, $Res Function(_$ToDoStateImpl) then) =
      __$$ToDoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text, bool done, DateTime? deadline, Importance? importance});
}

/// @nodoc
class __$$ToDoStateImplCopyWithImpl<$Res>
    extends _$ToDoStateCopyWithImpl<$Res, _$ToDoStateImpl>
    implements _$$ToDoStateImplCopyWith<$Res> {
  __$$ToDoStateImplCopyWithImpl(
      _$ToDoStateImpl _value, $Res Function(_$ToDoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? done = null,
    Object? deadline = freezed,
    Object? importance = freezed,
  }) {
    return _then(_$ToDoStateImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      importance: freezed == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Importance?,
    ));
  }
}

/// @nodoc

class _$ToDoStateImpl implements _ToDoState {
  const _$ToDoStateImpl(
      {required this.text, required this.done, this.deadline, this.importance});

  @override
  final String text;
  @override
  final bool done;
  @override
  final DateTime? deadline;
  @override
  final Importance? importance;

  @override
  String toString() {
    return 'ToDoState(text: $text, done: $done, deadline: $deadline, importance: $importance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoStateImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.importance, importance) ||
                other.importance == importance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, text, done, deadline, importance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoStateImplCopyWith<_$ToDoStateImpl> get copyWith =>
      __$$ToDoStateImplCopyWithImpl<_$ToDoStateImpl>(this, _$identity);
}

abstract class _ToDoState implements ToDoState {
  const factory _ToDoState(
      {required final String text,
      required final bool done,
      final DateTime? deadline,
      final Importance? importance}) = _$ToDoStateImpl;

  @override
  String get text;
  @override
  bool get done;
  @override
  DateTime? get deadline;
  @override
  Importance? get importance;
  @override
  @JsonKey(ignore: true)
  _$$ToDoStateImplCopyWith<_$ToDoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
