import 'package:flutter/material.dart';

abstract class ToDoTheme {
  const ToDoTheme({
    required this.textTheme,
    required this.supportColors,
    required this.labelTheme,
    required this.definedColors,
    required this.backColors,
  });

  final DefinedTextTheme textTheme;
  final SupportColors supportColors;
  final LabelColors labelTheme;
  final DefinedColors definedColors;
  final BackColors backColors;
}

class DefinedTextTheme {
  const DefinedTextTheme({required this.labelTheme});

  @protected
  final LabelColors labelTheme;

  TextStyle get largeTitle => TextStyle(
        fontSize: 32,
        height: 38 / 32,
        color: labelTheme.primary,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      );

  TextStyle get title => TextStyle(
        fontSize: 20,
        height: 32 / 20,
        color: labelTheme.primary,
        wordSpacing: 0.5,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      );

  TextStyle get button => TextStyle(
        fontSize: 14,
        height: 24 / 14,
        color: labelTheme.primary,
        wordSpacing: 0.16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      );

  TextStyle get body => TextStyle(
        fontSize: 16,
        height: 20 / 16,
        color: labelTheme.primary,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      );

  TextStyle get subhead => TextStyle(
        fontSize: 14,
        height: 20 / 14,
        color: labelTheme.primary,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      );
}

class LightToDoTheme extends ToDoTheme {
  LightToDoTheme()
      : super(
          textTheme: const DefinedTextTheme(labelTheme: LightLabelColors()),
          supportColors: const LightSupportColors(),
          labelTheme: const LightLabelColors(),
          definedColors: const LightDefinedColors(),
          backColors: const LightBackColors(),
        );
}

class DarkToDoTheme extends ToDoTheme {
  DarkToDoTheme()
      : super(
          textTheme: const DefinedTextTheme(labelTheme: DarkLabelColors()),
          supportColors: const DarkSupportColors(),
          labelTheme: const DarkLabelColors(),
          definedColors: const DarkDefinedColors(),
          backColors: const DarkBackColors(),
        );
}

abstract class SupportColors {
  const SupportColors({required this.separator, required this.overlay});

  final Color separator;
  final Color overlay;
}

class LightSupportColors extends SupportColors {
  const LightSupportColors()
      : super(
          separator: const Color(0xffb7b7b7),
          overlay: const Color(0xffd7d7d7),
        );
}

class DarkSupportColors extends SupportColors {
  const DarkSupportColors()
      : super(
          separator: const Color(0xffeaeaea),
          overlay: const Color(0xff9b9b9b),
        );
}

abstract class LabelColors {
  const LabelColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.disable,
  });
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color disable;
}

class LightLabelColors extends LabelColors {
  const LightLabelColors()
      : super(
          primary: const Color(0xff000000),
          secondary: const Color(0x99000000),
          tertiary: const Color(0x4d000000),
          disable: const Color(0x26000000),
        );
}

class DarkLabelColors extends LabelColors {
  const DarkLabelColors()
      : super(
          primary: const Color(0xffffffff),
          secondary: const Color(0x99ffffff),
          tertiary: const Color(0x66ffffff),
          disable: const Color(0x26ffffff),
        );
}

abstract class DefinedColors {
  const DefinedColors({
    required this.red,
    required this.green,
    required this.blue,
    required this.gray,
    required this.grayLight,
    required this.white,
  });
  final Color red;
  final Color green;
  final Color blue;
  final Color gray;
  final Color grayLight;
  final Color white;
}

class LightDefinedColors extends DefinedColors {
  const LightDefinedColors()
      : super(
          red: const Color(0xffff3b30),
          green: const Color(0xff34c759),
          blue: const Color(0xff007aff),
          gray: const Color(0xff8e8e93),
          grayLight: const Color(0xffd1d1d6),
          white: const Color(0xffffffff),
        );
}

class DarkDefinedColors extends DefinedColors {
  const DarkDefinedColors()
      : super(
          red: const Color(0xffff453a),
          green: const Color(0xff32d74b),
          blue: const Color(0xff0a84ff),
          gray: const Color(0xff8e8e93),
          grayLight: const Color(0xff48484a),
          white: const Color(0xffffffff),
        );
}

abstract class BackColors {
  const BackColors({
    required this.primary,
    required this.secondary,
    required this.elevated,
  });

  final Color primary;
  final Color secondary;
  final Color elevated;
}

class LightBackColors extends BackColors {
  const LightBackColors()
      : super(
          primary: const Color(0xfff7f6f2),
          secondary: const Color(0xffffffff),
          elevated: const Color(0xffffffff),
        );
}

class DarkBackColors extends BackColors {
  const DarkBackColors()
      : super(
          primary: const Color(0xff161618),
          secondary: const Color(0xff252528),
          elevated: const Color(0xff3c3c3f),
        );
}
