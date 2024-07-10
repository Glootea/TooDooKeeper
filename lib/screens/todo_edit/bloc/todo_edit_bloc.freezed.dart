// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_edit_bloc.dart';

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
    required TResult Function(String id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
    required TResult Function(String data) parseData,
    required TResult Function() create,
    required TResult Function() shareExport,
    required TResult Function() shareCopy,
    required TResult Function() delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
    TResult? Function(String data)? parseData,
    TResult? Function()? create,
    TResult? Function()? shareExport,
    TResult? Function()? shareCopy,
    TResult? Function()? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    TResult Function(String data)? parseData,
    TResult Function()? create,
    TResult Function()? shareExport,
    TResult Function()? shareCopy,
    TResult Function()? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadByIdEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
    required TResult Function(ParseDataFromLinkEvent value) parseData,
    required TResult Function(CreateEvent value) create,
    required TResult Function(ShareExportEvent value) shareExport,
    required TResult Function(ShareCopyEvent value) shareCopy,
    required TResult Function(DeleteEvent value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadByIdEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
    TResult? Function(ParseDataFromLinkEvent value)? parseData,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(ShareExportEvent value)? shareExport,
    TResult? Function(ShareCopyEvent value)? shareCopy,
    TResult? Function(DeleteEvent value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadByIdEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    TResult Function(ParseDataFromLinkEvent value)? parseData,
    TResult Function(CreateEvent value)? create,
    TResult Function(ShareExportEvent value)? shareExport,
    TResult Function(ShareCopyEvent value)? shareCopy,
    TResult Function(DeleteEvent value)? delete,
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
abstract class _$$LoadByIdEventImplCopyWith<$Res> {
  factory _$$LoadByIdEventImplCopyWith(
          _$LoadByIdEventImpl value, $Res Function(_$LoadByIdEventImpl) then) =
      __$$LoadByIdEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$LoadByIdEventImplCopyWithImpl<$Res>
    extends _$ToDoEditEventCopyWithImpl<$Res, _$LoadByIdEventImpl>
    implements _$$LoadByIdEventImplCopyWith<$Res> {
  __$$LoadByIdEventImplCopyWithImpl(
      _$LoadByIdEventImpl _value, $Res Function(_$LoadByIdEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadByIdEventImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadByIdEventImpl extends LoadByIdEvent with DiagnosticableTreeMixin {
  const _$LoadByIdEventImpl(this.id) : super._();

  @override
  final String id;

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
            other is _$LoadByIdEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadByIdEventImplCopyWith<_$LoadByIdEventImpl> get copyWith =>
      __$$LoadByIdEventImplCopyWithImpl<_$LoadByIdEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
    required TResult Function(String data) parseData,
    required TResult Function() create,
    required TResult Function() shareExport,
    required TResult Function() shareCopy,
    required TResult Function() delete,
  }) {
    return load(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
    TResult? Function(String data)? parseData,
    TResult? Function()? create,
    TResult? Function()? shareExport,
    TResult? Function()? shareCopy,
    TResult? Function()? delete,
  }) {
    return load?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    TResult Function(String data)? parseData,
    TResult Function()? create,
    TResult Function()? shareExport,
    TResult Function()? shareCopy,
    TResult Function()? delete,
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
    required TResult Function(LoadByIdEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
    required TResult Function(ParseDataFromLinkEvent value) parseData,
    required TResult Function(CreateEvent value) create,
    required TResult Function(ShareExportEvent value) shareExport,
    required TResult Function(ShareCopyEvent value) shareCopy,
    required TResult Function(DeleteEvent value) delete,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadByIdEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
    TResult? Function(ParseDataFromLinkEvent value)? parseData,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(ShareExportEvent value)? shareExport,
    TResult? Function(ShareCopyEvent value)? shareCopy,
    TResult? Function(DeleteEvent value)? delete,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadByIdEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    TResult Function(ParseDataFromLinkEvent value)? parseData,
    TResult Function(CreateEvent value)? create,
    TResult Function(ShareExportEvent value)? shareExport,
    TResult Function(ShareCopyEvent value)? shareCopy,
    TResult Function(DeleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadByIdEvent extends ToDoEditEvent {
  const factory LoadByIdEvent(final String id) = _$LoadByIdEventImpl;
  const LoadByIdEvent._() : super._();

  String get id;
  @JsonKey(ignore: true)
  _$$LoadByIdEventImplCopyWith<_$LoadByIdEventImpl> get copyWith =>
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

class _$SaveEventImpl extends SaveEvent with DiagnosticableTreeMixin {
  const _$SaveEventImpl() : super._();

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
    required TResult Function(String id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
    required TResult Function(String data) parseData,
    required TResult Function() create,
    required TResult Function() shareExport,
    required TResult Function() shareCopy,
    required TResult Function() delete,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
    TResult? Function(String data)? parseData,
    TResult? Function()? create,
    TResult? Function()? shareExport,
    TResult? Function()? shareCopy,
    TResult? Function()? delete,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    TResult Function(String data)? parseData,
    TResult Function()? create,
    TResult Function()? shareExport,
    TResult Function()? shareCopy,
    TResult Function()? delete,
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
    required TResult Function(LoadByIdEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
    required TResult Function(ParseDataFromLinkEvent value) parseData,
    required TResult Function(CreateEvent value) create,
    required TResult Function(ShareExportEvent value) shareExport,
    required TResult Function(ShareCopyEvent value) shareCopy,
    required TResult Function(DeleteEvent value) delete,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadByIdEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
    TResult? Function(ParseDataFromLinkEvent value)? parseData,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(ShareExportEvent value)? shareExport,
    TResult? Function(ShareCopyEvent value)? shareCopy,
    TResult? Function(DeleteEvent value)? delete,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadByIdEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    TResult Function(ParseDataFromLinkEvent value)? parseData,
    TResult Function(CreateEvent value)? create,
    TResult Function(ShareExportEvent value)? shareExport,
    TResult Function(ShareCopyEvent value)? shareCopy,
    TResult Function(DeleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class SaveEvent extends ToDoEditEvent {
  const factory SaveEvent() = _$SaveEventImpl;
  const SaveEvent._() : super._();
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

class _$UpdateEventImpl extends UpdateEvent with DiagnosticableTreeMixin {
  const _$UpdateEventImpl({required this.todo}) : super._();

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
    required TResult Function(String id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
    required TResult Function(String data) parseData,
    required TResult Function() create,
    required TResult Function() shareExport,
    required TResult Function() shareCopy,
    required TResult Function() delete,
  }) {
    return update(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
    TResult? Function(String data)? parseData,
    TResult? Function()? create,
    TResult? Function()? shareExport,
    TResult? Function()? shareCopy,
    TResult? Function()? delete,
  }) {
    return update?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    TResult Function(String data)? parseData,
    TResult Function()? create,
    TResult Function()? shareExport,
    TResult Function()? shareCopy,
    TResult Function()? delete,
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
    required TResult Function(LoadByIdEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
    required TResult Function(ParseDataFromLinkEvent value) parseData,
    required TResult Function(CreateEvent value) create,
    required TResult Function(ShareExportEvent value) shareExport,
    required TResult Function(ShareCopyEvent value) shareCopy,
    required TResult Function(DeleteEvent value) delete,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadByIdEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
    TResult? Function(ParseDataFromLinkEvent value)? parseData,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(ShareExportEvent value)? shareExport,
    TResult? Function(ShareCopyEvent value)? shareCopy,
    TResult? Function(DeleteEvent value)? delete,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadByIdEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    TResult Function(ParseDataFromLinkEvent value)? parseData,
    TResult Function(CreateEvent value)? create,
    TResult Function(ShareExportEvent value)? shareExport,
    TResult Function(ShareCopyEvent value)? shareCopy,
    TResult Function(DeleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UpdateEvent extends ToDoEditEvent {
  const factory UpdateEvent({required final ToDo todo}) = _$UpdateEventImpl;
  const UpdateEvent._() : super._();

  ToDo get todo;
  @JsonKey(ignore: true)
  _$$UpdateEventImplCopyWith<_$UpdateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParseDataFromLinkEventImplCopyWith<$Res> {
  factory _$$ParseDataFromLinkEventImplCopyWith(
          _$ParseDataFromLinkEventImpl value,
          $Res Function(_$ParseDataFromLinkEventImpl) then) =
      __$$ParseDataFromLinkEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String data});
}

/// @nodoc
class __$$ParseDataFromLinkEventImplCopyWithImpl<$Res>
    extends _$ToDoEditEventCopyWithImpl<$Res, _$ParseDataFromLinkEventImpl>
    implements _$$ParseDataFromLinkEventImplCopyWith<$Res> {
  __$$ParseDataFromLinkEventImplCopyWithImpl(
      _$ParseDataFromLinkEventImpl _value,
      $Res Function(_$ParseDataFromLinkEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ParseDataFromLinkEventImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ParseDataFromLinkEventImpl extends ParseDataFromLinkEvent
    with DiagnosticableTreeMixin {
  const _$ParseDataFromLinkEventImpl({required this.data}) : super._();

  @override
  final String data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditEvent.parseData(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoEditEvent.parseData'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParseDataFromLinkEventImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParseDataFromLinkEventImplCopyWith<_$ParseDataFromLinkEventImpl>
      get copyWith => __$$ParseDataFromLinkEventImplCopyWithImpl<
          _$ParseDataFromLinkEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
    required TResult Function(String data) parseData,
    required TResult Function() create,
    required TResult Function() shareExport,
    required TResult Function() shareCopy,
    required TResult Function() delete,
  }) {
    return parseData(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
    TResult? Function(String data)? parseData,
    TResult? Function()? create,
    TResult? Function()? shareExport,
    TResult? Function()? shareCopy,
    TResult? Function()? delete,
  }) {
    return parseData?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    TResult Function(String data)? parseData,
    TResult Function()? create,
    TResult Function()? shareExport,
    TResult Function()? shareCopy,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (parseData != null) {
      return parseData(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadByIdEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
    required TResult Function(ParseDataFromLinkEvent value) parseData,
    required TResult Function(CreateEvent value) create,
    required TResult Function(ShareExportEvent value) shareExport,
    required TResult Function(ShareCopyEvent value) shareCopy,
    required TResult Function(DeleteEvent value) delete,
  }) {
    return parseData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadByIdEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
    TResult? Function(ParseDataFromLinkEvent value)? parseData,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(ShareExportEvent value)? shareExport,
    TResult? Function(ShareCopyEvent value)? shareCopy,
    TResult? Function(DeleteEvent value)? delete,
  }) {
    return parseData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadByIdEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    TResult Function(ParseDataFromLinkEvent value)? parseData,
    TResult Function(CreateEvent value)? create,
    TResult Function(ShareExportEvent value)? shareExport,
    TResult Function(ShareCopyEvent value)? shareCopy,
    TResult Function(DeleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (parseData != null) {
      return parseData(this);
    }
    return orElse();
  }
}

abstract class ParseDataFromLinkEvent extends ToDoEditEvent {
  const factory ParseDataFromLinkEvent({required final String data}) =
      _$ParseDataFromLinkEventImpl;
  const ParseDataFromLinkEvent._() : super._();

  String get data;
  @JsonKey(ignore: true)
  _$$ParseDataFromLinkEventImplCopyWith<_$ParseDataFromLinkEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateEventImplCopyWith<$Res> {
  factory _$$CreateEventImplCopyWith(
          _$CreateEventImpl value, $Res Function(_$CreateEventImpl) then) =
      __$$CreateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateEventImplCopyWithImpl<$Res>
    extends _$ToDoEditEventCopyWithImpl<$Res, _$CreateEventImpl>
    implements _$$CreateEventImplCopyWith<$Res> {
  __$$CreateEventImplCopyWithImpl(
      _$CreateEventImpl _value, $Res Function(_$CreateEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateEventImpl extends CreateEvent with DiagnosticableTreeMixin {
  const _$CreateEventImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditEvent.create()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoEditEvent.create'));
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
    required TResult Function(String id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
    required TResult Function(String data) parseData,
    required TResult Function() create,
    required TResult Function() shareExport,
    required TResult Function() shareCopy,
    required TResult Function() delete,
  }) {
    return create();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
    TResult? Function(String data)? parseData,
    TResult? Function()? create,
    TResult? Function()? shareExport,
    TResult? Function()? shareCopy,
    TResult? Function()? delete,
  }) {
    return create?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    TResult Function(String data)? parseData,
    TResult Function()? create,
    TResult Function()? shareExport,
    TResult Function()? shareCopy,
    TResult Function()? delete,
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
    required TResult Function(LoadByIdEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
    required TResult Function(ParseDataFromLinkEvent value) parseData,
    required TResult Function(CreateEvent value) create,
    required TResult Function(ShareExportEvent value) shareExport,
    required TResult Function(ShareCopyEvent value) shareCopy,
    required TResult Function(DeleteEvent value) delete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadByIdEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
    TResult? Function(ParseDataFromLinkEvent value)? parseData,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(ShareExportEvent value)? shareExport,
    TResult? Function(ShareCopyEvent value)? shareCopy,
    TResult? Function(DeleteEvent value)? delete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadByIdEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    TResult Function(ParseDataFromLinkEvent value)? parseData,
    TResult Function(CreateEvent value)? create,
    TResult Function(ShareExportEvent value)? shareExport,
    TResult Function(ShareCopyEvent value)? shareCopy,
    TResult Function(DeleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CreateEvent extends ToDoEditEvent {
  const factory CreateEvent() = _$CreateEventImpl;
  const CreateEvent._() : super._();
}

/// @nodoc
abstract class _$$ShareExportEventImplCopyWith<$Res> {
  factory _$$ShareExportEventImplCopyWith(_$ShareExportEventImpl value,
          $Res Function(_$ShareExportEventImpl) then) =
      __$$ShareExportEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShareExportEventImplCopyWithImpl<$Res>
    extends _$ToDoEditEventCopyWithImpl<$Res, _$ShareExportEventImpl>
    implements _$$ShareExportEventImplCopyWith<$Res> {
  __$$ShareExportEventImplCopyWithImpl(_$ShareExportEventImpl _value,
      $Res Function(_$ShareExportEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShareExportEventImpl extends ShareExportEvent
    with DiagnosticableTreeMixin {
  const _$ShareExportEventImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditEvent.shareExport()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoEditEvent.shareExport'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShareExportEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
    required TResult Function(String data) parseData,
    required TResult Function() create,
    required TResult Function() shareExport,
    required TResult Function() shareCopy,
    required TResult Function() delete,
  }) {
    return shareExport();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
    TResult? Function(String data)? parseData,
    TResult? Function()? create,
    TResult? Function()? shareExport,
    TResult? Function()? shareCopy,
    TResult? Function()? delete,
  }) {
    return shareExport?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    TResult Function(String data)? parseData,
    TResult Function()? create,
    TResult Function()? shareExport,
    TResult Function()? shareCopy,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (shareExport != null) {
      return shareExport();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadByIdEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
    required TResult Function(ParseDataFromLinkEvent value) parseData,
    required TResult Function(CreateEvent value) create,
    required TResult Function(ShareExportEvent value) shareExport,
    required TResult Function(ShareCopyEvent value) shareCopy,
    required TResult Function(DeleteEvent value) delete,
  }) {
    return shareExport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadByIdEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
    TResult? Function(ParseDataFromLinkEvent value)? parseData,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(ShareExportEvent value)? shareExport,
    TResult? Function(ShareCopyEvent value)? shareCopy,
    TResult? Function(DeleteEvent value)? delete,
  }) {
    return shareExport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadByIdEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    TResult Function(ParseDataFromLinkEvent value)? parseData,
    TResult Function(CreateEvent value)? create,
    TResult Function(ShareExportEvent value)? shareExport,
    TResult Function(ShareCopyEvent value)? shareCopy,
    TResult Function(DeleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (shareExport != null) {
      return shareExport(this);
    }
    return orElse();
  }
}

abstract class ShareExportEvent extends ToDoEditEvent {
  const factory ShareExportEvent() = _$ShareExportEventImpl;
  const ShareExportEvent._() : super._();
}

/// @nodoc
abstract class _$$ShareCopyEventImplCopyWith<$Res> {
  factory _$$ShareCopyEventImplCopyWith(_$ShareCopyEventImpl value,
          $Res Function(_$ShareCopyEventImpl) then) =
      __$$ShareCopyEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShareCopyEventImplCopyWithImpl<$Res>
    extends _$ToDoEditEventCopyWithImpl<$Res, _$ShareCopyEventImpl>
    implements _$$ShareCopyEventImplCopyWith<$Res> {
  __$$ShareCopyEventImplCopyWithImpl(
      _$ShareCopyEventImpl _value, $Res Function(_$ShareCopyEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShareCopyEventImpl extends ShareCopyEvent with DiagnosticableTreeMixin {
  const _$ShareCopyEventImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditEvent.shareCopy()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoEditEvent.shareCopy'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShareCopyEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
    required TResult Function(String data) parseData,
    required TResult Function() create,
    required TResult Function() shareExport,
    required TResult Function() shareCopy,
    required TResult Function() delete,
  }) {
    return shareCopy();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
    TResult? Function(String data)? parseData,
    TResult? Function()? create,
    TResult? Function()? shareExport,
    TResult? Function()? shareCopy,
    TResult? Function()? delete,
  }) {
    return shareCopy?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    TResult Function(String data)? parseData,
    TResult Function()? create,
    TResult Function()? shareExport,
    TResult Function()? shareCopy,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (shareCopy != null) {
      return shareCopy();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadByIdEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
    required TResult Function(ParseDataFromLinkEvent value) parseData,
    required TResult Function(CreateEvent value) create,
    required TResult Function(ShareExportEvent value) shareExport,
    required TResult Function(ShareCopyEvent value) shareCopy,
    required TResult Function(DeleteEvent value) delete,
  }) {
    return shareCopy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadByIdEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
    TResult? Function(ParseDataFromLinkEvent value)? parseData,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(ShareExportEvent value)? shareExport,
    TResult? Function(ShareCopyEvent value)? shareCopy,
    TResult? Function(DeleteEvent value)? delete,
  }) {
    return shareCopy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadByIdEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    TResult Function(ParseDataFromLinkEvent value)? parseData,
    TResult Function(CreateEvent value)? create,
    TResult Function(ShareExportEvent value)? shareExport,
    TResult Function(ShareCopyEvent value)? shareCopy,
    TResult Function(DeleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (shareCopy != null) {
      return shareCopy(this);
    }
    return orElse();
  }
}

abstract class ShareCopyEvent extends ToDoEditEvent {
  const factory ShareCopyEvent() = _$ShareCopyEventImpl;
  const ShareCopyEvent._() : super._();
}

/// @nodoc
abstract class _$$DeleteEventImplCopyWith<$Res> {
  factory _$$DeleteEventImplCopyWith(
          _$DeleteEventImpl value, $Res Function(_$DeleteEventImpl) then) =
      __$$DeleteEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteEventImplCopyWithImpl<$Res>
    extends _$ToDoEditEventCopyWithImpl<$Res, _$DeleteEventImpl>
    implements _$$DeleteEventImplCopyWith<$Res> {
  __$$DeleteEventImplCopyWithImpl(
      _$DeleteEventImpl _value, $Res Function(_$DeleteEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteEventImpl extends DeleteEvent with DiagnosticableTreeMixin {
  const _$DeleteEventImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditEvent.delete()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoEditEvent.delete'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function() save,
    required TResult Function(ToDo todo) update,
    required TResult Function(String data) parseData,
    required TResult Function() create,
    required TResult Function() shareExport,
    required TResult Function() shareCopy,
    required TResult Function() delete,
  }) {
    return delete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function()? save,
    TResult? Function(ToDo todo)? update,
    TResult? Function(String data)? parseData,
    TResult? Function()? create,
    TResult? Function()? shareExport,
    TResult? Function()? shareCopy,
    TResult? Function()? delete,
  }) {
    return delete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? save,
    TResult Function(ToDo todo)? update,
    TResult Function(String data)? parseData,
    TResult Function()? create,
    TResult Function()? shareExport,
    TResult Function()? shareCopy,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadByIdEvent value) load,
    required TResult Function(SaveEvent value) save,
    required TResult Function(UpdateEvent value) update,
    required TResult Function(ParseDataFromLinkEvent value) parseData,
    required TResult Function(CreateEvent value) create,
    required TResult Function(ShareExportEvent value) shareExport,
    required TResult Function(ShareCopyEvent value) shareCopy,
    required TResult Function(DeleteEvent value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadByIdEvent value)? load,
    TResult? Function(SaveEvent value)? save,
    TResult? Function(UpdateEvent value)? update,
    TResult? Function(ParseDataFromLinkEvent value)? parseData,
    TResult? Function(CreateEvent value)? create,
    TResult? Function(ShareExportEvent value)? shareExport,
    TResult? Function(ShareCopyEvent value)? shareCopy,
    TResult? Function(DeleteEvent value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadByIdEvent value)? load,
    TResult Function(SaveEvent value)? save,
    TResult Function(UpdateEvent value)? update,
    TResult Function(ParseDataFromLinkEvent value)? parseData,
    TResult Function(CreateEvent value)? create,
    TResult Function(ShareExportEvent value)? shareExport,
    TResult Function(ShareCopyEvent value)? shareCopy,
    TResult Function(DeleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class DeleteEvent extends ToDoEditEvent {
  const factory DeleteEvent() = _$DeleteEventImpl;
  const DeleteEvent._() : super._();
}

/// @nodoc
mixin _$ToDoEditState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ToDo todo, ToDoEditMessage? message) $default, {
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ToDo todo, ToDoEditMessage? message)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ToDo todo, ToDoEditMessage? message)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(MainState value) $default, {
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
    required TResult Function(SavedState value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SavedState value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    TResult Function(SavedState value)? saved,
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
  $Res call({ToDo todo, ToDoEditMessage? message});

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
    Object? message = freezed,
  }) {
    return _then(_$MainStateImpl(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as ToDo,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ToDoEditMessage?,
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

class _$MainStateImpl extends MainState with DiagnosticableTreeMixin {
  const _$MainStateImpl({required this.todo, this.message}) : super._();

  @override
  final ToDo todo;
  @override
  final ToDoEditMessage? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditState(todo: $todo, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoEditState'))
      ..add(DiagnosticsProperty('todo', todo))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.todo, todo) || other.todo == todo) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ToDo todo, ToDoEditMessage? message) $default, {
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() saved,
  }) {
    return $default(todo, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ToDo todo, ToDoEditMessage? message)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? saved,
  }) {
    return $default?.call(todo, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ToDo todo, ToDoEditMessage? message)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(todo, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(MainState value) $default, {
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
    required TResult Function(SavedState value) saved,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SavedState value)? saved,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    TResult Function(SavedState value)? saved,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class MainState extends ToDoEditState {
  const factory MainState(
      {required final ToDo todo,
      final ToDoEditMessage? message}) = _$MainStateImpl;
  const MainState._() : super._();

  ToDo get todo;
  ToDoEditMessage? get message;
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

class _$LoadingStateImpl extends LoadingState with DiagnosticableTreeMixin {
  const _$LoadingStateImpl() : super._();

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
    TResult Function(ToDo todo, ToDoEditMessage? message) $default, {
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() saved,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ToDo todo, ToDoEditMessage? message)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? saved,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ToDo todo, ToDoEditMessage? message)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? saved,
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
    required TResult Function(SavedState value) saved,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SavedState value)? saved,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    TResult Function(SavedState value)? saved,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState extends ToDoEditState {
  const factory LoadingState() = _$LoadingStateImpl;
  const LoadingState._() : super._();
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

class _$ErrorStateImpl extends ErrorState with DiagnosticableTreeMixin {
  const _$ErrorStateImpl() : super._();

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
    TResult Function(ToDo todo, ToDoEditMessage? message) $default, {
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() saved,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ToDo todo, ToDoEditMessage? message)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? saved,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ToDo todo, ToDoEditMessage? message)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? saved,
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
    required TResult Function(SavedState value) saved,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SavedState value)? saved,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    TResult Function(SavedState value)? saved,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState extends ToDoEditState {
  const factory ErrorState() = _$ErrorStateImpl;
  const ErrorState._() : super._();
}

/// @nodoc
abstract class _$$SavedStateImplCopyWith<$Res> {
  factory _$$SavedStateImplCopyWith(
          _$SavedStateImpl value, $Res Function(_$SavedStateImpl) then) =
      __$$SavedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavedStateImplCopyWithImpl<$Res>
    extends _$ToDoEditStateCopyWithImpl<$Res, _$SavedStateImpl>
    implements _$$SavedStateImplCopyWith<$Res> {
  __$$SavedStateImplCopyWithImpl(
      _$SavedStateImpl _value, $Res Function(_$SavedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SavedStateImpl extends SavedState with DiagnosticableTreeMixin {
  const _$SavedStateImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoEditState.saved()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ToDoEditState.saved'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SavedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ToDo todo, ToDoEditMessage? message) $default, {
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() saved,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ToDo todo, ToDoEditMessage? message)? $default, {
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? saved,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ToDo todo, ToDoEditMessage? message)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(MainState value) $default, {
    required TResult Function(LoadingState value) loading,
    required TResult Function(ErrorState value) error,
    required TResult Function(SavedState value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MainState value)? $default, {
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ErrorState value)? error,
    TResult? Function(SavedState value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MainState value)? $default, {
    TResult Function(LoadingState value)? loading,
    TResult Function(ErrorState value)? error,
    TResult Function(SavedState value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class SavedState extends ToDoEditState {
  const factory SavedState() = _$SavedStateImpl;
  const SavedState._() : super._();
}
