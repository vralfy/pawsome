import 'package:p6_base/config/from_json.dart';

mixin ConfigDefaults on ConfigFromJSON {
  String get default_route => getByPath(str: 'defaults, route', defaultValue: '/', config: jsonFiles['app']?.content);
  String get default_language => getByPath(str: 'defaults, language', defaultValue: 'de_DE', config: jsonFiles['app']?.content);
}
