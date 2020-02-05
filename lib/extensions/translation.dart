import 'package:i18n_extension/i18n_extension.dart';

extension Translation on String {

  static var _t = Translations("en_us") +
      {
        "en_us": 'Hello %s',
        "ro_ro": "Salutare %s",
      } +
      {
        "en_us": 'Romanian',
        "ro_ro": 'Romana',
      } +
      {
        "en_us": 'English',
        "ro_ro": 'Engleza',
      } +
      {
        "en_us": 'Details',
        "ro_ro": 'Detali',
      } +
      {
        "en_us": 'Settings',
        "ro_ro": 'Setari',
      } +
      {
        "en_us": 'Back',
        "ro_ro": 'Inapoi',
      } +
      {
        "en_us": 'A nice menu with settings',
        "ro_ro": 'Meniul cu setari :)',
      } +
      {
        "en_us": 'Language',
        "ro_ro": 'Limba',
      } +
      {
        "en_us": 'Theme',
        "ro_ro": 'Tema',
      };

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

//  String gender(Gender gnd) => localizeVersion(gnd, this, _t);

}