import 'package:p6_base/config/from_json.dart';
import 'package:p6_base/config/theme.dart';

mixin ConfigFeature on ConfigFromJSON, ConfigTheme {
  bool get featureDefault => getByPath(str: 'features, default', defaultValue: true, config: jsonFiles['features']?.content);
  bool get featureDebug => getByPath(str: 'features, debug', defaultValue: featureDefault, config: jsonFiles['features']?.content);

  bool get featureExpandableNavigation =>
      getByPath(str: 'features, expandable_navigation', defaultValue: featureDefault, config: jsonFiles['features']?.content) && //
      getThemeProperty(str: 'features, expandable_navigation', defaultValue: featureDefault);
  bool get featureSpeedDial =>
      getByPath(str: 'features, speed_dial', defaultValue: featureDefault, config: jsonFiles['features']?.content) && //
      getThemeProperty(str: 'features, speed_dial', defaultValue: featureDefault);
}
