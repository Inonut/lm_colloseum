import 'package:flutter/material.dart';
import 'package:lm_colloseum/extensions/translation.dart';

enum LanguageEnum {
  RO,
  EN
}

extension LocaleMethods on LanguageEnum {

  Locale get asObject {
    switch (this) {
      case LanguageEnum.EN: return const Locale('en', 'US');
      case LanguageEnum.RO: return const Locale('ro', 'RO');
      default: return null;
    }
  }

  String get fullName {
    switch (this) {
      case LanguageEnum.EN: return 'English'.i18n;
      case LanguageEnum.RO: return 'Romanian'.i18n;
      default: return null;
    }
  }
}