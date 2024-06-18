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
mixin _$ToDoListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ToDo> todos, ToDoListQuery query) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ToDo> todos, ToDoListQuery query)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ToDo> todos, ToDoListQuery query)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(MainState value) $default, {
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoListStateCopyWith<$Res> {
  factory $ToDoListStateCopyWith(
          ToDoListState value, $Res Function(ToDoListState) then) =
      _$ToDoListStateCopyWithImpl<$Res, ToDoListState>;
}

/// @nodoc
class _$ToDoListStateCopyWithImpl<$Res, $Val extends ToDoListState>
    implements $ToDoListStateCopyWith<$Res> {
  _$ToDoListStateCopyWithImpl(this._value, this._then);

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
  $Res call({List<ToDo> todos, ToDoListQuery query});

  $ToDoListQueryCopyWith<$Res> get query;
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$ToDoListStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? query = null,
  }) {
    return _then(_$MainStateImpl(
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<ToDo>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as ToDoListQuery,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ToDoListQueryCopyWith<$Res> get query {
    return $ToDoListQueryCopyWith<$Res>(_value.query, (value) {
      return _then(_value.copyWith(query: value));
    });
  }
}

/// @nodoc

class _$MainStateImpl with DiagnosticableTreeMixin implements MainState {
  const _$MainStateImpl({required final List<ToDo> todos, required this.query})
      : _todos = todos;

  final List<ToDo> _todos;
  @override
  List<ToDo> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  final ToDoListQuery query;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoListState(todos: $todos, query: $query)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoListState'))
      ..add(DiagnosticsProperty('todos', todos))
      ..add(DiagnosticsProperty('query', query));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_todos), query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ToDo> todos, ToDoListQuery query) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return $default(todos, query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ToDo> todos, ToDoListQuery query)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return $default?.call(todos, query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ToDo> todos, ToDoListQuery query)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(todos, query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(MainState value) $default, {
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class MainState implements ToDoListState {
  const factory MainState(
      {required final List<ToDo> todos,
      required final ToDoListQuery query}) = _$MainStateImpl;

  List<ToDo> get todos;
  ToDoListQuery get query;
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
    extends _$ToDoListStateCopyWithImpl<$Res, _$LoadingStateImpl>
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
    return 'ToDoListState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoListState.loading'));
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
    TResult Function(List<ToDo> todos, ToDoListQuery query) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ToDo> todos, ToDoListQuery query)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ToDo> todos, ToDoListQuery query)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
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
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements ToDoListState {
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
    extends _$ToDoListStateCopyWithImpl<$Res, _$ErrorStateImpl>
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
    return 'ToDoListState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoListState.error'));
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
    TResult Function(List<ToDo> todos, ToDoListQuery query) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ToDo> todos, ToDoListQuery query)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ToDo> todos, ToDoListQuery query)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
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
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState implements ToDoListState {
  const factory ErrorState() = _$ErrorStateImpl;
}

/// @nodoc
mixin _$ToDoListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(int id) delete,
    required TResult Function(int id) toggleDone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? toggleDone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(int id)? delete,
    TResult Function(int id)? toggleDone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(DeleteEvent value) delete,
    required TResult Function(ToggleDoneEvent value) toggleDone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoListEventCopyWith<$Res> {
  factory $ToDoListEventCopyWith(
          ToDoListEvent value, $Res Function(ToDoListEvent) then) =
      _$ToDoListEventCopyWithImpl<$Res, ToDoListEvent>;
}

/// @nodoc
class _$ToDoListEventCopyWithImpl<$Res, $Val extends ToDoListEvent>
    implements $ToDoListEventCopyWith<$Res> {
  _$ToDoListEventCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$LoadEventImplCopyWithImpl<$Res>
    extends _$ToDoListEventCopyWithImpl<$Res, _$LoadEventImpl>
    implements _$$LoadEventImplCopyWith<$Res> {
  __$$LoadEventImplCopyWithImpl(
      _$LoadEventImpl _value, $Res Function(_$LoadEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadEventImpl with DiagnosticableTreeMixin implements LoadEvent {
  const _$LoadEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoListEvent.load()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoListEvent.load'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(int id) delete,
    required TResult Function(int id) toggleDone,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? toggleDone,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(int id)? delete,
    TResult Function(int id)? toggleDone,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(DeleteEvent value) delete,
    required TResult Function(ToggleDoneEvent value) toggleDone,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadEvent implements ToDoListEvent {
  const factory LoadEvent() = _$LoadEventImpl;
}

/// @nodoc
abstract class _$$DeleteEventImplCopyWith<$Res> {
  factory _$$DeleteEventImplCopyWith(
          _$DeleteEventImpl value, $Res Function(_$DeleteEventImpl) then) =
      __$$DeleteEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteEventImplCopyWithImpl<$Res>
    extends _$ToDoListEventCopyWithImpl<$Res, _$DeleteEventImpl>
    implements _$$DeleteEventImplCopyWith<$Res> {
  __$$DeleteEventImplCopyWithImpl(
      _$DeleteEventImpl _value, $Res Function(_$DeleteEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteEventImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteEventImpl with DiagnosticableTreeMixin implements DeleteEvent {
  const _$DeleteEventImpl(this.id);

  @override
  final int id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoListEvent.delete(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoListEvent.delete'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteEventImplCopyWith<_$DeleteEventImpl> get copyWith =>
      __$$DeleteEventImplCopyWithImpl<_$DeleteEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(int id) delete,
    required TResult Function(int id) toggleDone,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? toggleDone,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(int id)? delete,
    TResult Function(int id)? toggleDone,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(DeleteEvent value) delete,
    required TResult Function(ToggleDoneEvent value) toggleDone,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class DeleteEvent implements ToDoListEvent {
  const factory DeleteEvent(final int id) = _$DeleteEventImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteEventImplCopyWith<_$DeleteEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleDoneEventImplCopyWith<$Res> {
  factory _$$ToggleDoneEventImplCopyWith(_$ToggleDoneEventImpl value,
          $Res Function(_$ToggleDoneEventImpl) then) =
      __$$ToggleDoneEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ToggleDoneEventImplCopyWithImpl<$Res>
    extends _$ToDoListEventCopyWithImpl<$Res, _$ToggleDoneEventImpl>
    implements _$$ToggleDoneEventImplCopyWith<$Res> {
  __$$ToggleDoneEventImplCopyWithImpl(
      _$ToggleDoneEventImpl _value, $Res Function(_$ToggleDoneEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ToggleDoneEventImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ToggleDoneEventImpl
    with DiagnosticableTreeMixin
    implements ToggleDoneEvent {
  const _$ToggleDoneEventImpl(this.id);

  @override
  final int id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoListEvent.toggleDone(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoListEvent.toggleDone'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleDoneEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleDoneEventImplCopyWith<_$ToggleDoneEventImpl> get copyWith =>
      __$$ToggleDoneEventImplCopyWithImpl<_$ToggleDoneEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(int id) delete,
    required TResult Function(int id) toggleDone,
  }) {
    return toggleDone(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? toggleDone,
  }) {
    return toggleDone?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(int id)? delete,
    TResult Function(int id)? toggleDone,
    required TResult orElse(),
  }) {
    if (toggleDone != null) {
      return toggleDone(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(DeleteEvent value) delete,
    required TResult Function(ToggleDoneEvent value) toggleDone,
  }) {
    return toggleDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
  }) {
    return toggleDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    required TResult orElse(),
  }) {
    if (toggleDone != null) {
      return toggleDone(this);
    }
    return orElse();
  }
}

abstract class ToggleDoneEvent implements ToDoListEvent {
  const factory ToggleDoneEvent(final int id) = _$ToggleDoneEventImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$ToggleDoneEventImplCopyWith<_$ToggleDoneEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ToDoListQuery {
  String? get search => throw _privateConstructorUsedError;
  List<SortOption>? get sortOptions => throw _privateConstructorUsedError;
  List<FilterOption>? get filterOptions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToDoListQueryCopyWith<ToDoListQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoListQueryCopyWith<$Res> {
  factory $ToDoListQueryCopyWith(
          ToDoListQuery value, $Res Function(ToDoListQuery) then) =
      _$ToDoListQueryCopyWithImpl<$Res, ToDoListQuery>;
  @useResult
  $Res call(
      {String? search,
      List<SortOption>? sortOptions,
      List<FilterOption>? filterOptions});
}

/// @nodoc
class _$ToDoListQueryCopyWithImpl<$Res, $Val extends ToDoListQuery>
    implements $ToDoListQueryCopyWith<$Res> {
  _$ToDoListQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? sortOptions = freezed,
    Object? filterOptions = freezed,
  }) {
    return _then(_value.copyWith(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOptions: freezed == sortOptions
          ? _value.sortOptions
          : sortOptions // ignore: cast_nullable_to_non_nullable
              as List<SortOption>?,
      filterOptions: freezed == filterOptions
          ? _value.filterOptions
          : filterOptions // ignore: cast_nullable_to_non_nullable
              as List<FilterOption>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDoListQueryImplCopyWith<$Res>
    implements $ToDoListQueryCopyWith<$Res> {
  factory _$$ToDoListQueryImplCopyWith(
          _$ToDoListQueryImpl value, $Res Function(_$ToDoListQueryImpl) then) =
      __$$ToDoListQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? search,
      List<SortOption>? sortOptions,
      List<FilterOption>? filterOptions});
}

/// @nodoc
class __$$ToDoListQueryImplCopyWithImpl<$Res>
    extends _$ToDoListQueryCopyWithImpl<$Res, _$ToDoListQueryImpl>
    implements _$$ToDoListQueryImplCopyWith<$Res> {
  __$$ToDoListQueryImplCopyWithImpl(
      _$ToDoListQueryImpl _value, $Res Function(_$ToDoListQueryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? sortOptions = freezed,
    Object? filterOptions = freezed,
  }) {
    return _then(_$ToDoListQueryImpl(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOptions: freezed == sortOptions
          ? _value._sortOptions
          : sortOptions // ignore: cast_nullable_to_non_nullable
              as List<SortOption>?,
      filterOptions: freezed == filterOptions
          ? _value._filterOptions
          : filterOptions // ignore: cast_nullable_to_non_nullable
              as List<FilterOption>?,
    ));
  }
}

/// @nodoc

class _$ToDoListQueryImpl
    with DiagnosticableTreeMixin
    implements _ToDoListQuery {
  const _$ToDoListQueryImpl(
      {this.search,
      final List<SortOption>? sortOptions,
      final List<FilterOption>? filterOptions})
      : _sortOptions = sortOptions,
        _filterOptions = filterOptions;

  @override
  final String? search;
  final List<SortOption>? _sortOptions;
  @override
  List<SortOption>? get sortOptions {
    final value = _sortOptions;
    if (value == null) return null;
    if (_sortOptions is EqualUnmodifiableListView) return _sortOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FilterOption>? _filterOptions;
  @override
  List<FilterOption>? get filterOptions {
    final value = _filterOptions;
    if (value == null) return null;
    if (_filterOptions is EqualUnmodifiableListView) return _filterOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoListQuery(search: $search, sortOptions: $sortOptions, filterOptions: $filterOptions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoListQuery'))
      ..add(DiagnosticsProperty('search', search))
      ..add(DiagnosticsProperty('sortOptions', sortOptions))
      ..add(DiagnosticsProperty('filterOptions', filterOptions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoListQueryImpl &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality()
                .equals(other._sortOptions, _sortOptions) &&
            const DeepCollectionEquality()
                .equals(other._filterOptions, _filterOptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      search,
      const DeepCollectionEquality().hash(_sortOptions),
      const DeepCollectionEquality().hash(_filterOptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoListQueryImplCopyWith<_$ToDoListQueryImpl> get copyWith =>
      __$$ToDoListQueryImplCopyWithImpl<_$ToDoListQueryImpl>(this, _$identity);
}

abstract class _ToDoListQuery implements ToDoListQuery {
  const factory _ToDoListQuery(
      {final String? search,
      final List<SortOption>? sortOptions,
      final List<FilterOption>? filterOptions}) = _$ToDoListQueryImpl;

  @override
  String? get search;
  @override
  List<SortOption>? get sortOptions;
  @override
  List<FilterOption>? get filterOptions;
  @override
  @JsonKey(ignore: true)
  _$$ToDoListQueryImplCopyWith<_$ToDoListQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
