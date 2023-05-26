import 'package:p6_base/config/from_json.dart';

mixin ConfigDefaults on ConfigFromJSON {
  String get defaultRoute => getByPath(str: 'defaults, route', defaultValue: '/', config: jsonFiles['app']?.content);
  String get defaultLanguage => getByPath(str: 'defaults, language', defaultValue: 'de_DE', config: jsonFiles['app']?.content);
}
