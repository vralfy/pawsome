import 'package:flutter/material.dart';
import 'package:p6_base/config/abstract.dart';
import 'package:p6_base/config/from_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

class P6Config extends AbstractConfig {
  static P6Config? _instance;
  static P6Config get instance {
    _instance = _instance ?? P6Config();
    return _instance ?? P6Config();
  }

  static SharedPreferences? configSettings;

  static Function refreshApp = () {};
  static Function onConfigLoaded = () {};

  static set context(BuildContext c) {
    ConfigFromContext.context = c;
  }
}

mixin Configuration {
  P6Config get configuration => P6Config.instance;
}
