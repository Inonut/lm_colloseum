import 'package:flutter/material.dart';

enum LanguageEnum {
  RO,
  EN
}

extension LocaleMethods on LanguageEnum {

  Locale get locale {
    switch (this) {
      case LanguageEnum.EN: return const Locale('en', 'US');
      case LanguageEnum.RO: return const Locale('ro', 'RO');
      default: return null;
    }
  }
}