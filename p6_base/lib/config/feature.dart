import 'package:p6_base/config/from_json.dart';
import 'package:p6_base/config/theme.dart';

mixin ConfigFeature on ConfigFromJSON, ConfigTheme {
  bool get feature_default => getByPath(str: 'feature, default', defaultValue: true);
  bool get feature_debug => getByPath(str: 'feature, debug', defaultValue: feature_default);

  bool get feature_expandable_navigation =>
      getByPath(str: 'feature, expandable_navigation', defaultValue: feature_default) && getThemeProperty(str: 'feature, expandable_navigation', defaultValue: feature_default);
  bool get feature_speed_dial => getByPath(str: 'feature, speed_dial', defaultValue: feature_default) && getThemeProperty(str: 'feature, speed_dial', defaultValue: feature_default);
}
