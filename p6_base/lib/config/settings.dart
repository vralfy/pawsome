import 'package:p6_base/config/defaults.dart';
import 'package:p6_base/config/from_json.dart';
import 'package:p6_base/config/from_settings.dart';

mixin ConfigSettings on ConfigFromJSON, ConfigFromSettings, ConfigDefaults {
  String get language => (settings?.getString('LANGUAGE') ?? defaultLanguage).trim();
}
