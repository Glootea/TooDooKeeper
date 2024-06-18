// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ToDoEditEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoEditEventCopyWith<$Res> {
  factory $ToDoEditEventCopyWith(
          ToDoEditEvent value, $Res Function(ToDoEditEvent) then) =
      _$ToDoEditEventCopyWithImpl<$Res, ToDoEditEvent>;
}

/// @nodoc
class _$ToDoEditEventCopyWithImpl<$Res, $Val extends ToDoEditEvent>
    implements $ToDoEditEventCopyWith<$Res> {
  _$ToDoEditEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadEventImplCopyWith<$Res> {
  factory _$$LoadEventImplCopyWith(
          _$LoadEventImpl value, $Res Function(_$LoadEventImpl) then) =
      __$$LoadEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LoadEventImplCopyWithImpl<$Res>
    extends _$ToDoEditEventCopyWithImpl<$Res, _$LoadEventImpl>
    implements _$$LoadEventImplCopyWith<$Res> {
  __$$LoadEventImplCopyWithImpl(
      _$LoadEventImpl _value, $Res Function(_$LoadEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadEventImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadEventImpl with DiagnosticableTreeMixin implements LoadEvent {
  const _$LoadEventImpl(this.id);

  @override
  final int id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditEvent.load(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoEditEvent.load'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadEventImplCopyWith<_$LoadEventImpl> get copyWith =>
      __$$LoadEventImplCopyWithImpl<_$LoadEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
  }) {
    return load(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
  }) {
    return load?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadEvent implements ToDoEditEvent {
  const factory LoadEvent(final int id) = _$LoadEventImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$LoadEventImplCopyWith<_$LoadEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveEventImplCopyWith<$Res> {
  factory _$$SaveEventImplCopyWith(
          _$SaveEventImpl value, $Res Function(_$SaveEventImpl) then) =
      __$$SaveEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveEventImplCopyWithImpl<$Res>
    extends _$ToDoEditEventCopyWithImpl<$Res, _$SaveEventImpl>
    implements _$$SaveEventImplCopyWith<$Res> {
  __$$SaveEventImplCopyWithImpl(
      _$SaveEventImpl _value, $Res Function(_$SaveEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SaveEventImpl with DiagnosticableTreeMixin implements SaveEvent {
  const _$SaveEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditEvent.save()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoEditEvent.save'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SaveEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class SaveEvent implements ToDoEditEvent {
  const factory SaveEvent() = _$SaveEventImpl;
}

/// @nodoc
abstract class _$$UpdateEventImplCopyWith<$Res> {
  factory _$$UpdateEventImplCopyWith(
          _$UpdateEventImpl value, $Res Function(_$UpdateEventImpl) then) =
      __$$UpdateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ToDo todo});

  $ToDoCopyWith<$Res> get todo;
}

/// @nodoc
class __$$UpdateEventImplCopyWithImpl<$Res>
    extends _$ToDoEditEventCopyWithImpl<$Res, _$UpdateEventImpl>
    implements _$$UpdateEventImplCopyWith<$Res> {
  __$$UpdateEventImplCopyWithImpl(
      _$UpdateEventImpl _value, $Res Function(_$UpdateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
  }) {
    return _then(_$UpdateEventImpl(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as ToDo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ToDoCopyWith<$Res> get todo {
    return $ToDoCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$UpdateEventImpl with DiagnosticableTreeMixin implements UpdateEvent {
  const _$UpdateEventImpl({required this.todo});

  @override
  final ToDo todo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditEvent.update(todo: $todo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoEditEvent.update'))
      ..add(DiagnosticsProperty('todo', todo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEventImpl &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEventImplCopyWith<_$UpdateEventImpl> get copyWith =>
      __$$UpdateEventImplCopyWithImpl<_$UpdateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
  }) {
    return update(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
  }) {
    return update?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UpdateEvent implements ToDoEditEvent {
  const factory UpdateEvent({required final ToDo todo}) = _$UpdateEventImpl;

  ToDo get todo;
  @JsonKey(ignore: true)
  _$$UpdateEventImplCopyWith<_$UpdateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ToDoEditState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ToDo todo) $default, {
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(String data) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ToDo todo)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(String data)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ToDo todo)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(String data)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(MainState value) $default, {
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
    required TResult Function(SaveState value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SaveState value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    TResult Function(SaveState value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoEditStateCopyWith<$Res> {
  factory $ToDoEditStateCopyWith(
          ToDoEditState value, $Res Function(ToDoEditState) then) =
      _$ToDoEditStateCopyWithImpl<$Res, ToDoEditState>;
}

/// @nodoc
class _$ToDoEditStateCopyWithImpl<$Res, $Val extends ToDoEditState>
    implements $ToDoEditStateCopyWith<$Res> {
  _$ToDoEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ToDo todo});

  $ToDoCopyWith<$Res> get todo;
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$ToDoEditStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
  }) {
    return _then(_$MainStateImpl(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as ToDo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ToDoCopyWith<$Res> get todo {
    return $ToDoCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$MainStateImpl with DiagnosticableTreeMixin implements MainState {
  const _$MainStateImpl({required this.todo});

  @override
  final ToDo todo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditState(todo: $todo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoEditState'))
      ..add(DiagnosticsProperty('todo', todo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ToDo todo) $default, {
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(String data) save,
  }) {
    return $default(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ToDo todo)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(String data)? save,
  }) {
    return $default?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ToDo todo)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(String data)? save,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(MainState value) $default, {
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
    required TResult Function(SaveState value) save,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SaveState value)? save,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    TResult Function(SaveState value)? save,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class MainState implements ToDoEditState {
  const factory MainState({required final ToDo todo}) = _$MainStateImpl;

  ToDo get todo;
  @JsonKey(ignore: true)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$ToDoEditStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateImpl with DiagnosticableTreeMixin implements LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoEditState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ToDo todo) $default, {
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(String data) save,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ToDo todo)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(String data)? save,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ToDo todo)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(String data)? save,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(MainState value) $default, {
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
    required TResult Function(SaveState value) save,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SaveState value)? save,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    TResult Function(SaveState value)? save,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements ToDoEditState {
  const factory LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$ToDoEditStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorStateImpl with DiagnosticableTreeMixin implements ErrorState {
  const _$ErrorStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoEditState.error'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ToDo todo) $default, {
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(String data) save,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ToDo todo)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(String data)? save,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ToDo todo)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(String data)? save,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(MainState value) $default, {
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
    required TResult Function(SaveState value) save,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SaveState value)? save,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    TResult Function(SaveState value)? save,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState implements ToDoEditState {
  const factory ErrorState() = _$ErrorStateImpl;
}

/// @nodoc
abstract class _$$SaveStateImplCopyWith<$Res> {
  factory _$$SaveStateImplCopyWith(
          _$SaveStateImpl value, $Res Function(_$SaveStateImpl) then) =
      __$$SaveStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String data});
}

/// @nodoc
class __$$SaveStateImplCopyWithImpl<$Res>
    extends _$ToDoEditStateCopyWithImpl<$Res, _$SaveStateImpl>
    implements _$$SaveStateImplCopyWith<$Res> {
  __$$SaveStateImplCopyWithImpl(
      _$SaveStateImpl _value, $Res Function(_$SaveStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SaveStateImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveStateImpl with DiagnosticableTreeMixin implements SaveState {
  const _$SaveStateImpl({required this.data});

  @override
  final String data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditState.save(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoEditState.save'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveStateImplCopyWith<_$SaveStateImpl> get copyWith =>
      __$$SaveStateImplCopyWithImpl<_$SaveStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ToDo todo) $default, {
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(String data) save,
  }) {
    return save(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ToDo todo)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(String data)? save,
  }) {
    return save?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ToDo todo)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(String data)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(MainState value) $default, {
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
    required TResult Function(SaveState value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SaveState value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    TResult Function(SaveState value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class SaveState implements ToDoEditState {
  const factory SaveState({required final String data}) = _$SaveStateImpl;

  String get data;
  @JsonKey(ignore: true)
  _$$SaveStateImplCopyWith<_$SaveStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
