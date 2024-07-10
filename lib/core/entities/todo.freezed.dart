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
  String? get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Importance get importance => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get changedAt => throw _privateConstructorUsedError;
  String? get lastUpdatedBy => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime createdAt,
            DateTime changedAt,
            String lastUpdatedBy)
        $default, {
    required TResult Function(
            String? id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime? createdAt,
            DateTime? changedAt,
            String? lastUpdatedBy)
        justCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime createdAt,
            DateTime changedAt,
            String lastUpdatedBy)?
        $default, {
    TResult? Function(
            String? id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime? createdAt,
            DateTime? changedAt,
            String? lastUpdatedBy)?
        justCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime createdAt,
            DateTime changedAt,
            String lastUpdatedBy)?
        $default, {
    TResult Function(
            String? id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime? createdAt,
            DateTime? changedAt,
            String? lastUpdatedBy)?
        justCreated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ToDo value) $default, {
    required TResult Function(_ToDoEmpty value) justCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ToDo value)? $default, {
    TResult? Function(_ToDoEmpty value)? justCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ToDo value)? $default, {
    TResult Function(_ToDoEmpty value)? justCreated,
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
      {String id,
      String description,
      Importance importance,
      DateTime? deadline,
      bool done,
      int? color,
      DateTime createdAt,
      DateTime changedAt,
      String lastUpdatedBy});
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
    Object? importance = null,
    Object? deadline = freezed,
    Object? done = null,
    Object? color = freezed,
    Object? createdAt = null,
    Object? changedAt = null,
    Object? lastUpdatedBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id!
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Importance,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt!
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: null == changedAt
          ? _value.changedAt!
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy!
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String id,
      String description,
      Importance importance,
      DateTime? deadline,
      bool done,
      int? color,
      DateTime createdAt,
      DateTime changedAt,
      String lastUpdatedBy});
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
    Object? importance = null,
    Object? deadline = freezed,
    Object? done = null,
    Object? color = freezed,
    Object? createdAt = null,
    Object? changedAt = null,
    Object? lastUpdatedBy = null,
  }) {
    return _then(_$ToDoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Importance,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToDoImpl extends _ToDo {
  const _$ToDoImpl(
      {required this.id,
      required this.description,
      this.importance = Importance.basic,
      this.deadline,
      this.done = false,
      this.color,
      required this.createdAt,
      required this.changedAt,
      required this.lastUpdatedBy})
      : super._();

  @override
  final String id;
  @override
  final String description;
  @override
  @JsonKey()
  final Importance importance;
  @override
  final DateTime? deadline;
  @override
  @JsonKey()
  final bool done;
  @override
  final int? color;
  @override
  final DateTime createdAt;
  @override
  final DateTime changedAt;
  @override
  final String lastUpdatedBy;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoImplCopyWith<_$ToDoImpl> get copyWith =>
      __$$ToDoImplCopyWithImpl<_$ToDoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime createdAt,
            DateTime changedAt,
            String lastUpdatedBy)
        $default, {
    required TResult Function(
            String? id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime? createdAt,
            DateTime? changedAt,
            String? lastUpdatedBy)
        justCreated,
  }) {
    return $default(id, description, importance, deadline, done, color,
        createdAt, changedAt, lastUpdatedBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime createdAt,
            DateTime changedAt,
            String lastUpdatedBy)?
        $default, {
    TResult? Function(
            String? id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime? createdAt,
            DateTime? changedAt,
            String? lastUpdatedBy)?
        justCreated,
  }) {
    return $default?.call(id, description, importance, deadline, done, color,
        createdAt, changedAt, lastUpdatedBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime createdAt,
            DateTime changedAt,
            String lastUpdatedBy)?
        $default, {
    TResult Function(
            String? id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime? createdAt,
            DateTime? changedAt,
            String? lastUpdatedBy)?
        justCreated,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, description, importance, deadline, done, color,
          createdAt, changedAt, lastUpdatedBy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ToDo value) $default, {
    required TResult Function(_ToDoEmpty value) justCreated,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ToDo value)? $default, {
    TResult? Function(_ToDoEmpty value)? justCreated,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ToDo value)? $default, {
    TResult Function(_ToDoEmpty value)? justCreated,
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
      {required final String id,
      required final String description,
      final Importance importance,
      final DateTime? deadline,
      final bool done,
      final int? color,
      required final DateTime createdAt,
      required final DateTime changedAt,
      required final String lastUpdatedBy}) = _$ToDoImpl;
  const _ToDo._() : super._();

  @override
  String get id;
  @override
  String get description;
  @override
  Importance get importance;
  @override
  DateTime? get deadline;
  @override
  bool get done;
  @override
  int? get color;
  @override
  DateTime get createdAt;
  @override
  DateTime get changedAt;
  @override
  String get lastUpdatedBy;
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
      {String? id,
      String description,
      Importance importance,
      DateTime? deadline,
      bool done,
      int? color,
      DateTime? createdAt,
      DateTime? changedAt,
      String? lastUpdatedBy});
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
    Object? id = freezed,
    Object? description = null,
    Object? importance = null,
    Object? deadline = freezed,
    Object? done = null,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? changedAt = freezed,
    Object? lastUpdatedBy = freezed,
  }) {
    return _then(_$ToDoEmptyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Importance,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      changedAt: freezed == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ToDoEmptyImpl extends _ToDoEmpty {
  const _$ToDoEmptyImpl(
      {this.id,
      this.description = '',
      this.importance = Importance.basic,
      this.deadline,
      this.done = false,
      this.color,
      this.createdAt,
      this.changedAt,
      this.lastUpdatedBy})
      : super._();

  @override
  final String? id;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final Importance importance;
  @override
  final DateTime? deadline;
  @override
  @JsonKey()
  final bool done;
  @override
  final int? color;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? changedAt;
  @override
  final String? lastUpdatedBy;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoEmptyImplCopyWith<_$ToDoEmptyImpl> get copyWith =>
      __$$ToDoEmptyImplCopyWithImpl<_$ToDoEmptyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime createdAt,
            DateTime changedAt,
            String lastUpdatedBy)
        $default, {
    required TResult Function(
            String? id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime? createdAt,
            DateTime? changedAt,
            String? lastUpdatedBy)
        justCreated,
  }) {
    return justCreated(id, description, importance, deadline, done, color,
        createdAt, changedAt, lastUpdatedBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime createdAt,
            DateTime changedAt,
            String lastUpdatedBy)?
        $default, {
    TResult? Function(
            String? id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime? createdAt,
            DateTime? changedAt,
            String? lastUpdatedBy)?
        justCreated,
  }) {
    return justCreated?.call(id, description, importance, deadline, done, color,
        createdAt, changedAt, lastUpdatedBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime createdAt,
            DateTime changedAt,
            String lastUpdatedBy)?
        $default, {
    TResult Function(
            String? id,
            String description,
            Importance importance,
            DateTime? deadline,
            bool done,
            int? color,
            DateTime? createdAt,
            DateTime? changedAt,
            String? lastUpdatedBy)?
        justCreated,
    required TResult orElse(),
  }) {
    if (justCreated != null) {
      return justCreated(id, description, importance, deadline, done, color,
          createdAt, changedAt, lastUpdatedBy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ToDo value) $default, {
    required TResult Function(_ToDoEmpty value) justCreated,
  }) {
    return justCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ToDo value)? $default, {
    TResult? Function(_ToDoEmpty value)? justCreated,
  }) {
    return justCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ToDo value)? $default, {
    TResult Function(_ToDoEmpty value)? justCreated,
    required TResult orElse(),
  }) {
    if (justCreated != null) {
      return justCreated(this);
    }
    return orElse();
  }
}

abstract class _ToDoEmpty extends ToDo {
  const factory _ToDoEmpty(
      {final String? id,
      final String description,
      final Importance importance,
      final DateTime? deadline,
      final bool done,
      final int? color,
      final DateTime? createdAt,
      final DateTime? changedAt,
      final String? lastUpdatedBy}) = _$ToDoEmptyImpl;
  const _ToDoEmpty._() : super._();

  @override
  String? get id;
  @override
  String get description;
  @override
  Importance get importance;
  @override
  DateTime? get deadline;
  @override
  bool get done;
  @override
  int? get color;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get changedAt;
  @override
  String? get lastUpdatedBy;
  @override
  @JsonKey(ignore: true)
  _$$ToDoEmptyImplCopyWith<_$ToDoEmptyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
