import 'package:flutter/material.dart';

class MaterialLocalizationItDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  /// Here list supported country and language codes
  @override
  bool isSupported(Locale locale) => true;

  /// Here create an instance of your [MaterialLocalizations] subclass
  @override
  Future<MaterialLocalizations> load(Locale locale) async => DefaultMaterialLocalizations();

  @override
  bool shouldReload(_) => false;
}
