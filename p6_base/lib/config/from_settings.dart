import 'package:p6_base/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin ConfigFromSettings {
  SharedPreferences? get settings => P6Config.configSettings;
}
