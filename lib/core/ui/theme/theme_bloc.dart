import 'dart:ui';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/core/logger.dart';
import 'package:yandex_summer_school/core/ui/theme/theme.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ToDoThemeEvent, ToDoTheme> {
  ThemeBloc({required FirebaseRemoteConfig remoteConfig})
      : super(
          _getTheme(
            PlatformDispatcher.instance.platformBrightness,
            const Color(0xffff0000),
          ),
        ) {
    final dispatcher = SchedulerBinding.instance.platformDispatcher;

    logger.d('Created dispatcher');

    dispatcher.onPlatformBrightnessChanged = () {
      logger.i('Platform brightness changed');
      _updateState(dispatcher, remoteConfig);
    };

    logger.d('onPlatformBrightnessChanged');

    remoteConfig
      ..activate()
      ..onConfigUpdated.listen((event) async {
        await remoteConfig.fetchAndActivate();
        logger.i('Got new value from remoteConfig: ${event.updatedKeys}');
        _updateState(dispatcher, remoteConfig);
      });

    logger.d('onConfigUpdated');

    on<ToDoThemeEvent>((event, emit) {
      emit(
        _getTheme(
          event.brightness,
          _importantColor(event.specialImportanceColor),
        ),
      );
    });
    logger.d('update state');
    _updateState(dispatcher, remoteConfig);
    logger.d('updated state');
  }

  Color _importantColor(bool specialImportanceColor) =>
      specialImportanceColor ? const Color(0xff793cd8) : state.definedColors.red;

  void _updateState(
    PlatformDispatcher dispatcher,
    FirebaseRemoteConfig remoteConfig,
  ) {
    final brightness = dispatcher.platformBrightness;
    final specialImportanceColor = remoteConfig.getBool('specialImportanceColor');
    add(_ThemeChanged(brightness, specialImportanceColor));
  }

  static ToDoTheme _getTheme(
    Brightness brightness,
    Color importantColor,
  ) =>
      switch (PlatformDispatcher.instance.platformBrightness) {
        Brightness.dark => DarkToDoTheme(importantColor: importantColor),
        Brightness.light => LightToDoTheme(importantColor: importantColor),
      };
}

@freezed
sealed class ToDoThemeEvent with _$ToDoThemeEvent {
  const factory ToDoThemeEvent.changeTheme(
    Brightness brightness,
    bool specialImportanceColor,
  ) = _ThemeChanged;
}
