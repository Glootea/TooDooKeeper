// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ToDoThemeEvent {
  Brightness get brightness => throw _privateConstructorUsedError;
  bool get specialImportanceColor => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Brightness brightness, bool specialImportanceColor)
        changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Brightness brightness, bool specialImportanceColor)?
        changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Brightness brightness, bool specialImportanceColor)?
        changeTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeChanged value) changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeChanged value)? changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeChanged value)? changeTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToDoThemeEventCopyWith<ToDoThemeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoThemeEventCopyWith<$Res> {
  factory $ToDoThemeEventCopyWith(
          ToDoThemeEvent value, $Res Function(ToDoThemeEvent) then) =
      _$ToDoThemeEventCopyWithImpl<$Res, ToDoThemeEvent>;
  @useResult
  $Res call({Brightness brightness, bool specialImportanceColor});
}

/// @nodoc
class _$ToDoThemeEventCopyWithImpl<$Res, $Val extends ToDoThemeEvent>
    implements $ToDoThemeEventCopyWith<$Res> {
  _$ToDoThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brightness = null,
    Object? specialImportanceColor = null,
  }) {
    return _then(_value.copyWith(
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
      specialImportanceColor: null == specialImportanceColor
          ? _value.specialImportanceColor
          : specialImportanceColor // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeChangedImplCopyWith<$Res>
    implements $ToDoThemeEventCopyWith<$Res> {
  factory _$$ThemeChangedImplCopyWith(
          _$ThemeChangedImpl value, $Res Function(_$ThemeChangedImpl) then) =
      __$$ThemeChangedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Brightness brightness, bool specialImportanceColor});
}

/// @nodoc
class __$$ThemeChangedImplCopyWithImpl<$Res>
    extends _$ToDoThemeEventCopyWithImpl<$Res, _$ThemeChangedImpl>
    implements _$$ThemeChangedImplCopyWith<$Res> {
  __$$ThemeChangedImplCopyWithImpl(
      _$ThemeChangedImpl _value, $Res Function(_$ThemeChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brightness = null,
    Object? specialImportanceColor = null,
  }) {
    return _then(_$ThemeChangedImpl(
      null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
      null == specialImportanceColor
          ? _value.specialImportanceColor
          : specialImportanceColor // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ThemeChangedImpl with DiagnosticableTreeMixin implements _ThemeChanged {
  const _$ThemeChangedImpl(this.brightness, this.specialImportanceColor);

  @override
  final Brightness brightness;
  @override
  final bool specialImportanceColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoThemeEvent.changeTheme(brightness: $brightness, specialImportanceColor: $specialImportanceColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoThemeEvent.changeTheme'))
      ..add(DiagnosticsProperty('brightness', brightness))
      ..add(DiagnosticsProperty(
          'specialImportanceColor', specialImportanceColor));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeChangedImpl &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness) &&
            (identical(other.specialImportanceColor, specialImportanceColor) ||
                other.specialImportanceColor == specialImportanceColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, brightness, specialImportanceColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeChangedImplCopyWith<_$ThemeChangedImpl> get copyWith =>
      __$$ThemeChangedImplCopyWithImpl<_$ThemeChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Brightness brightness, bool specialImportanceColor)
        changeTheme,
  }) {
    return changeTheme(brightness, specialImportanceColor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Brightness brightness, bool specialImportanceColor)?
        changeTheme,
  }) {
    return changeTheme?.call(brightness, specialImportanceColor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Brightness brightness, bool specialImportanceColor)?
        changeTheme,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(brightness, specialImportanceColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeChanged value) changeTheme,
  }) {
    return changeTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeChanged value)? changeTheme,
  }) {
    return changeTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeChanged value)? changeTheme,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(this);
    }
    return orElse();
  }
}

abstract class _ThemeChanged implements ToDoThemeEvent {
  const factory _ThemeChanged(
          final Brightness brightness, final bool specialImportanceColor) =
      _$ThemeChangedImpl;

  @override
  Brightness get brightness;
  @override
  bool get specialImportanceColor;
  @override
  @JsonKey(ignore: true)
  _$$ThemeChangedImplCopyWith<_$ThemeChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
