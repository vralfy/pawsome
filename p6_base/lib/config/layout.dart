import 'package:p6_base/config/from_json.dart';

mixin ConfigLayout on ConfigFromJSON {
  int get listMaxItems => int.parse(getByPath(str: 'layout, list, maxItems', defaultValue: '200', config: jsonFiles['layout']?.content));
}
