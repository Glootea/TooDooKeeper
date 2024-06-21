import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/common/ui/theme/theme.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ToDoThemeEvent, ToDoTheme> {
  ThemeBloc(Brightness brightness)
      : super(
          switch (brightness) {
            Brightness.dark => DarkToDoTheme(),
            Brightness.light => LightToDoTheme(),
          },
        );
}

@freezed
sealed class ToDoThemeEvent with _$ToDoThemeEvent {
  const factory ToDoThemeEvent.changeTheme(Brightness brightness) = _ThemeChanged;
}
