import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

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
      };

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

//  String gender(Gender gnd) => localizeVersion(gnd, this, _t);

}