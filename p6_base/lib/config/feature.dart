import 'package:p6_base/config/from_json.dart';
import 'package:p6_base/config/theme.dart';

mixin ConfigFeature on ConfigFromJSON, ConfigTheme {
  bool get feature_default => getByPath(str: 'features, default', defaultValue: true, config: jsonFiles['features']?.content);
  bool get feature_debug => getByPath(str: 'features, debug', defaultValue: feature_default, config: jsonFiles['features']?.content);

  bool get feature_expandable_navigation =>
      getByPath(str: 'features, expandable_navigation', defaultValue: feature_default, config: jsonFiles['features']?.content) && //
      getThemeProperty(str: 'features, expandable_navigation', defaultValue: feature_default);
  bool get feature_speed_dial =>
      getByPath(str: 'features, speed_dial', defaultValue: feature_default, config: jsonFiles['features']?.content) && //
      getThemeProperty(str: 'features, speed_dial', defaultValue: feature_default);
}
