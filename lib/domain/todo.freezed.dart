// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ToDo {
  int get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  Importance? get importance => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)
        $default, {
    required TResult Function(int id, String description, bool done,
            DateTime? deadline, Importance? importance)
        empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        $default, {
    TResult? Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        $default, {
    TResult Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ToDo value) $default, {
    required TResult Function(_ToDoEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ToDo value)? $default, {
    TResult? Function(_ToDoEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ToDo value)? $default, {
    TResult Function(_ToDoEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToDoCopyWith<ToDo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoCopyWith<$Res> {
  factory $ToDoCopyWith(ToDo value, $Res Function(ToDo) then) =
      _$ToDoCopyWithImpl<$Res, ToDo>;
  @useResult
  $Res call(
      {int id,
      String description,
      bool done,
      DateTime? deadline,
      Importance? importance});
}

/// @nodoc
class _$ToDoCopyWithImpl<$Res, $Val extends ToDo>
    implements $ToDoCopyWith<$Res> {
  _$ToDoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? done = null,
    Object? deadline = freezed,
    Object? importance = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ToDoImplCopyWith<$Res> implements $ToDoCopyWith<$Res> {
  factory _$$ToDoImplCopyWith(
          _$ToDoImpl value, $Res Function(_$ToDoImpl) then) =
      __$$ToDoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String description,
      bool done,
      DateTime? deadline,
      Importance? importance});
}

/// @nodoc
class __$$ToDoImplCopyWithImpl<$Res>
    extends _$ToDoCopyWithImpl<$Res, _$ToDoImpl>
    implements _$$ToDoImplCopyWith<$Res> {
  __$$ToDoImplCopyWithImpl(_$ToDoImpl _value, $Res Function(_$ToDoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? done = null,
    Object? deadline = freezed,
    Object? importance = freezed,
  }) {
    return _then(_$ToDoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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

class _$ToDoImpl extends _ToDo {
  const _$ToDoImpl(
      {required this.id,
      required this.description,
      required this.done,
      this.deadline,
      this.importance})
      : super._();

  @override
  final int id;
  @override
  final String description;
  @override
  final bool done;
  @override
  final DateTime? deadline;
  @override
  final Importance? importance;

  @override
  String toString() {
    return 'ToDo(id: $id, description: $description, done: $done, deadline: $deadline, importance: $importance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.importance, importance) ||
                other.importance == importance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, done, deadline, importance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoImplCopyWith<_$ToDoImpl> get copyWith =>
      __$$ToDoImplCopyWithImpl<_$ToDoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)
        $default, {
    required TResult Function(int id, String description, bool done,
            DateTime? deadline, Importance? importance)
        empty,
  }) {
    return $default(id, description, done, deadline, importance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        $default, {
    TResult? Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        empty,
  }) {
    return $default?.call(id, description, done, deadline, importance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        $default, {
    TResult Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, description, done, deadline, importance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ToDo value) $default, {
    required TResult Function(_ToDoEmpty value) empty,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ToDo value)? $default, {
    TResult? Function(_ToDoEmpty value)? empty,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ToDo value)? $default, {
    TResult Function(_ToDoEmpty value)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ToDo extends ToDo {
  const factory _ToDo(
      {required final int id,
      required final String description,
      required final bool done,
      final DateTime? deadline,
      final Importance? importance}) = _$ToDoImpl;
  const _ToDo._() : super._();

  @override
  int get id;
  @override
  String get description;
  @override
  bool get done;
  @override
  DateTime? get deadline;
  @override
  Importance? get importance;
  @override
  @JsonKey(ignore: true)
  _$$ToDoImplCopyWith<_$ToDoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToDoEmptyImplCopyWith<$Res> implements $ToDoCopyWith<$Res> {
  factory _$$ToDoEmptyImplCopyWith(
          _$ToDoEmptyImpl value, $Res Function(_$ToDoEmptyImpl) then) =
      __$$ToDoEmptyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String description,
      bool done,
      DateTime? deadline,
      Importance? importance});
}

/// @nodoc
class __$$ToDoEmptyImplCopyWithImpl<$Res>
    extends _$ToDoCopyWithImpl<$Res, _$ToDoEmptyImpl>
    implements _$$ToDoEmptyImplCopyWith<$Res> {
  __$$ToDoEmptyImplCopyWithImpl(
      _$ToDoEmptyImpl _value, $Res Function(_$ToDoEmptyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? done = null,
    Object? deadline = freezed,
    Object? importance = freezed,
  }) {
    return _then(_$ToDoEmptyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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

class _$ToDoEmptyImpl extends _ToDoEmpty {
  const _$ToDoEmptyImpl(
      {this.id = 0,
      this.description = '',
      this.done = false,
      this.deadline = null,
      this.importance = null})
      : super._();

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool done;
  @override
  @JsonKey()
  final DateTime? deadline;
  @override
  @JsonKey()
  final Importance? importance;

  @override
  String toString() {
    return 'ToDo.empty(id: $id, description: $description, done: $done, deadline: $deadline, importance: $importance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoEmptyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.importance, importance) ||
                other.importance == importance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, done, deadline, importance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoEmptyImplCopyWith<_$ToDoEmptyImpl> get copyWith =>
      __$$ToDoEmptyImplCopyWithImpl<_$ToDoEmptyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)
        $default, {
    required TResult Function(int id, String description, bool done,
            DateTime? deadline, Importance? importance)
        empty,
  }) {
    return empty(id, description, done, deadline, importance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        $default, {
    TResult? Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        empty,
  }) {
    return empty?.call(id, description, done, deadline, importance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        $default, {
    TResult Function(int id, String description, bool done, DateTime? deadline,
            Importance? importance)?
        empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(id, description, done, deadline, importance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ToDo value) $default, {
    required TResult Function(_ToDoEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ToDo value)? $default, {
    TResult? Function(_ToDoEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ToDo value)? $default, {
    TResult Function(_ToDoEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _ToDoEmpty extends ToDo {
  const factory _ToDoEmpty(
      {final int id,
      final String description,
      final bool done,
      final DateTime? deadline,
      final Importance? importance}) = _$ToDoEmptyImpl;
  const _ToDoEmpty._() : super._();

  @override
  int get id;
  @override
  String get description;
  @override
  bool get done;
  @override
  DateTime? get deadline;
  @override
  Importance? get importance;
  @override
  @JsonKey(ignore: true)
  _$$ToDoEmptyImplCopyWith<_$ToDoEmptyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
