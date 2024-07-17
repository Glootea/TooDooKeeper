import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/core/logger.dart';
import 'package:yandex_summer_school/core/ui/theme/theme.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ToDoThemeEvent, ToDoTheme> {
  ThemeBloc()
      : super(_getTheme(PlatformDispatcher.instance.platformBrightness)) {
    final dispatcher = SchedulerBinding.instance.platformDispatcher;
    dispatcher.onPlatformBrightnessChanged = () {
      final brightness = dispatcher.platformBrightness;
      logger.d('New brightness: $brightness');
      add(_ThemeChanged(brightness));
    };
    on<ToDoThemeEvent>((event, emit) {
      emit(_getTheme(event.brightness));
    });
  }

  static ToDoTheme _getTheme(Brightness brightness) =>
      switch (PlatformDispatcher.instance.platformBrightness) {
        Brightness.dark => DarkToDoTheme(),
        Brightness.light => LightToDoTheme(),
      };
}

@freezed
sealed class ToDoThemeEvent with _$ToDoThemeEvent {
  const factory ToDoThemeEvent.changeTheme(Brightness brightness) =
      _ThemeChanged;
}
