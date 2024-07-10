// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_bloc.dart';

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
    TResult Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)
        $default, {
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)?
        $default, {
    TResult Function()? loading,
    TResult Function(String message)? error,
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
  $Res call(
      {List<ToDo> todos,
      bool networkConnectionPresent,
      ToDoListQuery query,
      bool showDone});

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
    Object? networkConnectionPresent = null,
    Object? query = null,
    Object? showDone = null,
  }) {
    return _then(_$MainStateImpl(
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<ToDo>,
      networkConnectionPresent: null == networkConnectionPresent
          ? _value.networkConnectionPresent
          : networkConnectionPresent // ignore: cast_nullable_to_non_nullable
              as bool,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as ToDoListQuery,
      showDone: null == showDone
          ? _value.showDone
          : showDone // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$MainStateImpl extends MainState with DiagnosticableTreeMixin {
  const _$MainStateImpl(
      {required final List<ToDo> todos,
      required this.networkConnectionPresent,
      required this.query,
      required this.showDone})
      : _todos = todos,
        super._();

  final List<ToDo> _todos;
  @override
  List<ToDo> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  final bool networkConnectionPresent;
  @override
  final ToDoListQuery query;
  @override
  final bool showDone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoListState(todos: $todos, networkConnectionPresent: $networkConnectionPresent, query: $query, showDone: $showDone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoListState'))
      ..add(DiagnosticsProperty('todos', todos))
      ..add(DiagnosticsProperty(
          'networkConnectionPresent', networkConnectionPresent))
      ..add(DiagnosticsProperty('query', query))
      ..add(DiagnosticsProperty('showDone', showDone));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(
                    other.networkConnectionPresent, networkConnectionPresent) ||
                other.networkConnectionPresent == networkConnectionPresent) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.showDone, showDone) ||
                other.showDone == showDone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_todos),
      networkConnectionPresent,
      query,
      showDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)
        $default, {
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return $default(todos, networkConnectionPresent, query, showDone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return $default?.call(todos, networkConnectionPresent, query, showDone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)?
        $default, {
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(todos, networkConnectionPresent, query, showDone);
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

abstract class MainState extends ToDoListState {
  const factory MainState(
      {required final List<ToDo> todos,
      required final bool networkConnectionPresent,
      required final ToDoListQuery query,
      required final bool showDone}) = _$MainStateImpl;
  const MainState._() : super._();

  List<ToDo> get todos;
  bool get networkConnectionPresent;
  ToDoListQuery get query;
  bool get showDone;
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

class _$LoadingStateImpl extends LoadingState with DiagnosticableTreeMixin {
  const _$LoadingStateImpl() : super._();

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
    TResult Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)
        $default, {
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)?
        $default, {
    TResult Function()? loading,
    TResult Function(String message)? error,
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

abstract class LoadingState extends ToDoListState {
  const factory LoadingState() = _$LoadingStateImpl;
  const LoadingState._() : super._();
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$ToDoListStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl extends ErrorState with DiagnosticableTreeMixin {
  const _$ErrorStateImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoListState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoListState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)
        $default, {
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ToDo> todos, bool networkConnectionPresent,
            ToDoListQuery query, bool showDone)?
        $default, {
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
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

abstract class ErrorState extends ToDoListState {
  const factory ErrorState({required final String message}) = _$ErrorStateImpl;
  const ErrorState._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ToDoListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(String id) delete,
    required TResult Function(String id) toggleDone,
    required TResult Function() logout,
    required TResult Function() create,
    required TResult Function(String description) saveJustCreated,
    required TResult Function() toggleVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? toggleDone,
    TResult? Function()? logout,
    TResult? Function()? create,
    TResult? Function(String description)? saveJustCreated,
    TResult? Function()? toggleVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(String id)? delete,
    TResult Function(String id)? toggleDone,
    TResult Function()? logout,
    TResult Function()? create,
    TResult Function(String description)? saveJustCreated,
    TResult Function()? toggleVisibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(DeleteEvent value) delete,
    required TResult Function(ToggleDoneEvent value) toggleDone,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(CreateEvent value) create,
    required TResult Function(SaveJustCreatedEvent value) saveJustCreated,
    required TResult Function(ToggleVisibilityEvent value) toggleVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult? Function(ToggleVisibilityEvent value)? toggleVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(CreateEvent value)? create,
    TResult Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult Function(ToggleVisibilityEvent value)? toggleVisibility,
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
    required TResult Function(String id) delete,
    required TResult Function(String id) toggleDone,
    required TResult Function() logout,
    required TResult Function() create,
    required TResult Function(String description) saveJustCreated,
    required TResult Function() toggleVisibility,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? toggleDone,
    TResult? Function()? logout,
    TResult? Function()? create,
    TResult? Function(String description)? saveJustCreated,
    TResult? Function()? toggleVisibility,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(String id)? delete,
    TResult Function(String id)? toggleDone,
    TResult Function()? logout,
    TResult Function()? create,
    TResult Function(String description)? saveJustCreated,
    TResult Function()? toggleVisibility,
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
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(CreateEvent value) create,
    required TResult Function(SaveJustCreatedEvent value) saveJustCreated,
    required TResult Function(ToggleVisibilityEvent value) toggleVisibility,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult? Function(ToggleVisibilityEvent value)? toggleVisibility,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(CreateEvent value)? create,
    TResult Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult Function(ToggleVisibilityEvent value)? toggleVisibility,
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
  $Res call({String id});
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
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteEventImpl with DiagnosticableTreeMixin implements DeleteEvent {
  const _$DeleteEventImpl(this.id);

  @override
  final String id;

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
    required TResult Function(String id) delete,
    required TResult Function(String id) toggleDone,
    required TResult Function() logout,
    required TResult Function() create,
    required TResult Function(String description) saveJustCreated,
    required TResult Function() toggleVisibility,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? toggleDone,
    TResult? Function()? logout,
    TResult? Function()? create,
    TResult? Function(String description)? saveJustCreated,
    TResult? Function()? toggleVisibility,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(String id)? delete,
    TResult Function(String id)? toggleDone,
    TResult Function()? logout,
    TResult Function()? create,
    TResult Function(String description)? saveJustCreated,
    TResult Function()? toggleVisibility,
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
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(CreateEvent value) create,
    required TResult Function(SaveJustCreatedEvent value) saveJustCreated,
    required TResult Function(ToggleVisibilityEvent value) toggleVisibility,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult? Function(ToggleVisibilityEvent value)? toggleVisibility,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(CreateEvent value)? create,
    TResult Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult Function(ToggleVisibilityEvent value)? toggleVisibility,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class DeleteEvent implements ToDoListEvent {
  const factory DeleteEvent(final String id) = _$DeleteEventImpl;

  String get id;
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
  $Res call({String id});
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
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleDoneEventImpl
    with DiagnosticableTreeMixin
    implements ToggleDoneEvent {
  const _$ToggleDoneEventImpl(this.id);

  @override
  final String id;

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
    required TResult Function(String id) delete,
    required TResult Function(String id) toggleDone,
    required TResult Function() logout,
    required TResult Function() create,
    required TResult Function(String description) saveJustCreated,
    required TResult Function() toggleVisibility,
  }) {
    return toggleDone(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? toggleDone,
    TResult? Function()? logout,
    TResult? Function()? create,
    TResult? Function(String description)? saveJustCreated,
    TResult? Function()? toggleVisibility,
  }) {
    return toggleDone?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(String id)? delete,
    TResult Function(String id)? toggleDone,
    TResult Function()? logout,
    TResult Function()? create,
    TResult Function(String description)? saveJustCreated,
    TResult Function()? toggleVisibility,
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
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(CreateEvent value) create,
    required TResult Function(SaveJustCreatedEvent value) saveJustCreated,
    required TResult Function(ToggleVisibilityEvent value) toggleVisibility,
  }) {
    return toggleDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult? Function(ToggleVisibilityEvent value)? toggleVisibility,
  }) {
    return toggleDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(CreateEvent value)? create,
    TResult Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult Function(ToggleVisibilityEvent value)? toggleVisibility,
    required TResult orElse(),
  }) {
    if (toggleDone != null) {
      return toggleDone(this);
    }
    return orElse();
  }
}

abstract class ToggleDoneEvent implements ToDoListEvent {
  const factory ToggleDoneEvent(final String id) = _$ToggleDoneEventImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$ToggleDoneEventImplCopyWith<_$ToggleDoneEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutEventImplCopyWith<$Res> {
  factory _$$LogoutEventImplCopyWith(
          _$LogoutEventImpl value, $Res Function(_$LogoutEventImpl) then) =
      __$$LogoutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutEventImplCopyWithImpl<$Res>
    extends _$ToDoListEventCopyWithImpl<$Res, _$LogoutEventImpl>
    implements _$$LogoutEventImplCopyWith<$Res> {
  __$$LogoutEventImplCopyWithImpl(
      _$LogoutEventImpl _value, $Res Function(_$LogoutEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutEventImpl with DiagnosticableTreeMixin implements LogoutEvent {
  const _$LogoutEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoListEvent.logout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoListEvent.logout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(String id) delete,
    required TResult Function(String id) toggleDone,
    required TResult Function() logout,
    required TResult Function() create,
    required TResult Function(String description) saveJustCreated,
    required TResult Function() toggleVisibility,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? toggleDone,
    TResult? Function()? logout,
    TResult? Function()? create,
    TResult? Function(String description)? saveJustCreated,
    TResult? Function()? toggleVisibility,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(String id)? delete,
    TResult Function(String id)? toggleDone,
    TResult Function()? logout,
    TResult Function()? create,
    TResult Function(String description)? saveJustCreated,
    TResult Function()? toggleVisibility,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(DeleteEvent value) delete,
    required TResult Function(ToggleDoneEvent value) toggleDone,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(CreateEvent value) create,
    required TResult Function(SaveJustCreatedEvent value) saveJustCreated,
    required TResult Function(ToggleVisibilityEvent value) toggleVisibility,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult? Function(ToggleVisibilityEvent value)? toggleVisibility,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(CreateEvent value)? create,
    TResult Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult Function(ToggleVisibilityEvent value)? toggleVisibility,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class LogoutEvent implements ToDoListEvent {
  const factory LogoutEvent() = _$LogoutEventImpl;
}

/// @nodoc
abstract class _$$CreateEventImplCopyWith<$Res> {
  factory _$$CreateEventImplCopyWith(
          _$CreateEventImpl value, $Res Function(_$CreateEventImpl) then) =
      __$$CreateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateEventImplCopyWithImpl<$Res>
    extends _$ToDoListEventCopyWithImpl<$Res, _$CreateEventImpl>
    implements _$$CreateEventImplCopyWith<$Res> {
  __$$CreateEventImplCopyWithImpl(
      _$CreateEventImpl _value, $Res Function(_$CreateEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateEventImpl with DiagnosticableTreeMixin implements CreateEvent {
  const _$CreateEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoListEvent.create()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoListEvent.create'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(String id) delete,
    required TResult Function(String id) toggleDone,
    required TResult Function() logout,
    required TResult Function() create,
    required TResult Function(String description) saveJustCreated,
    required TResult Function() toggleVisibility,
  }) {
    return create();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? toggleDone,
    TResult? Function()? logout,
    TResult? Function()? create,
    TResult? Function(String description)? saveJustCreated,
    TResult? Function()? toggleVisibility,
  }) {
    return create?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(String id)? delete,
    TResult Function(String id)? toggleDone,
    TResult Function()? logout,
    TResult Function()? create,
    TResult Function(String description)? saveJustCreated,
    TResult Function()? toggleVisibility,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(DeleteEvent value) delete,
    required TResult Function(ToggleDoneEvent value) toggleDone,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(CreateEvent value) create,
    required TResult Function(SaveJustCreatedEvent value) saveJustCreated,
    required TResult Function(ToggleVisibilityEvent value) toggleVisibility,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult? Function(ToggleVisibilityEvent value)? toggleVisibility,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(CreateEvent value)? create,
    TResult Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult Function(ToggleVisibilityEvent value)? toggleVisibility,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CreateEvent implements ToDoListEvent {
  const factory CreateEvent() = _$CreateEventImpl;
}

/// @nodoc
abstract class _$$SaveJustCreatedEventImplCopyWith<$Res> {
  factory _$$SaveJustCreatedEventImplCopyWith(_$SaveJustCreatedEventImpl value,
          $Res Function(_$SaveJustCreatedEventImpl) then) =
      __$$SaveJustCreatedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$SaveJustCreatedEventImplCopyWithImpl<$Res>
    extends _$ToDoListEventCopyWithImpl<$Res, _$SaveJustCreatedEventImpl>
    implements _$$SaveJustCreatedEventImplCopyWith<$Res> {
  __$$SaveJustCreatedEventImplCopyWithImpl(_$SaveJustCreatedEventImpl _value,
      $Res Function(_$SaveJustCreatedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$SaveJustCreatedEventImpl(
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveJustCreatedEventImpl
    with DiagnosticableTreeMixin
    implements SaveJustCreatedEvent {
  const _$SaveJustCreatedEventImpl(this.description);

  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoListEvent.saveJustCreated(description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoListEvent.saveJustCreated'))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveJustCreatedEventImpl &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveJustCreatedEventImplCopyWith<_$SaveJustCreatedEventImpl>
      get copyWith =>
          __$$SaveJustCreatedEventImplCopyWithImpl<_$SaveJustCreatedEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(String id) delete,
    required TResult Function(String id) toggleDone,
    required TResult Function() logout,
    required TResult Function() create,
    required TResult Function(String description) saveJustCreated,
    required TResult Function() toggleVisibility,
  }) {
    return saveJustCreated(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? toggleDone,
    TResult? Function()? logout,
    TResult? Function()? create,
    TResult? Function(String description)? saveJustCreated,
    TResult? Function()? toggleVisibility,
  }) {
    return saveJustCreated?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(String id)? delete,
    TResult Function(String id)? toggleDone,
    TResult Function()? logout,
    TResult Function()? create,
    TResult Function(String description)? saveJustCreated,
    TResult Function()? toggleVisibility,
    required TResult orElse(),
  }) {
    if (saveJustCreated != null) {
      return saveJustCreated(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(DeleteEvent value) delete,
    required TResult Function(ToggleDoneEvent value) toggleDone,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(CreateEvent value) create,
    required TResult Function(SaveJustCreatedEvent value) saveJustCreated,
    required TResult Function(ToggleVisibilityEvent value) toggleVisibility,
  }) {
    return saveJustCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult? Function(ToggleVisibilityEvent value)? toggleVisibility,
  }) {
    return saveJustCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(CreateEvent value)? create,
    TResult Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult Function(ToggleVisibilityEvent value)? toggleVisibility,
    required TResult orElse(),
  }) {
    if (saveJustCreated != null) {
      return saveJustCreated(this);
    }
    return orElse();
  }
}

abstract class SaveJustCreatedEvent implements ToDoListEvent {
  const factory SaveJustCreatedEvent(final String description) =
      _$SaveJustCreatedEventImpl;

  String get description;
  @JsonKey(ignore: true)
  _$$SaveJustCreatedEventImplCopyWith<_$SaveJustCreatedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleVisibilityEventImplCopyWith<$Res> {
  factory _$$ToggleVisibilityEventImplCopyWith(
          _$ToggleVisibilityEventImpl value,
          $Res Function(_$ToggleVisibilityEventImpl) then) =
      __$$ToggleVisibilityEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleVisibilityEventImplCopyWithImpl<$Res>
    extends _$ToDoListEventCopyWithImpl<$Res, _$ToggleVisibilityEventImpl>
    implements _$$ToggleVisibilityEventImplCopyWith<$Res> {
  __$$ToggleVisibilityEventImplCopyWithImpl(_$ToggleVisibilityEventImpl _value,
      $Res Function(_$ToggleVisibilityEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleVisibilityEventImpl
    with DiagnosticableTreeMixin
    implements ToggleVisibilityEvent {
  const _$ToggleVisibilityEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoListEvent.toggleVisibility()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ToDoListEvent.toggleVisibility'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleVisibilityEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(String id) delete,
    required TResult Function(String id) toggleDone,
    required TResult Function() logout,
    required TResult Function() create,
    required TResult Function(String description) saveJustCreated,
    required TResult Function() toggleVisibility,
  }) {
    return toggleVisibility();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? toggleDone,
    TResult? Function()? logout,
    TResult? Function()? create,
    TResult? Function(String description)? saveJustCreated,
    TResult? Function()? toggleVisibility,
  }) {
    return toggleVisibility?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(String id)? delete,
    TResult Function(String id)? toggleDone,
    TResult Function()? logout,
    TResult Function()? create,
    TResult Function(String description)? saveJustCreated,
    TResult Function()? toggleVisibility,
    required TResult orElse(),
  }) {
    if (toggleVisibility != null) {
      return toggleVisibility();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadEvent value) load,
    required TResult Function(DeleteEvent value) delete,
    required TResult Function(ToggleDoneEvent value) toggleDone,
    required TResult Function(LogoutEvent value) logout,
    required TResult Function(CreateEvent value) create,
    required TResult Function(SaveJustCreatedEvent value) saveJustCreated,
    required TResult Function(ToggleVisibilityEvent value) toggleVisibility,
  }) {
    return toggleVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadEvent value)? load,
    TResult? Function(DeleteEvent value)? delete,
    TResult? Function(ToggleDoneEvent value)? toggleDone,
    TResult? Function(LogoutEvent value)? logout,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult? Function(ToggleVisibilityEvent value)? toggleVisibility,
  }) {
    return toggleVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadEvent value)? load,
    TResult Function(DeleteEvent value)? delete,
    TResult Function(ToggleDoneEvent value)? toggleDone,
    TResult Function(LogoutEvent value)? logout,
    TResult Function(CreateEvent value)? create,
    TResult Function(SaveJustCreatedEvent value)? saveJustCreated,
    TResult Function(ToggleVisibilityEvent value)? toggleVisibility,
    required TResult orElse(),
  }) {
    if (toggleVisibility != null) {
      return toggleVisibility(this);
    }
    return orElse();
  }
}

abstract class ToggleVisibilityEvent implements ToDoListEvent {
  const factory ToggleVisibilityEvent() = _$ToggleVisibilityEventImpl;
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
