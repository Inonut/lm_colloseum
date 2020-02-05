import 'package:flutter/material.dart';

enum ThemeEnum {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
}

extension ThemeMethods on ThemeEnum {
  ThemeData get asObject {
    switch (this) {
      case ThemeEnum.GreenLight: return _greenLight;
      case ThemeEnum.GreenDark: return _greenDark;
      case ThemeEnum.BlueLight: return _blueLight;
      case ThemeEnum.BlueDark: return blueDark;
      default: return null;
    }
  }
}

final _greenLight = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
);

final _greenDark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.green,
);

final _blueLight = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
);

final blueDark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
);
