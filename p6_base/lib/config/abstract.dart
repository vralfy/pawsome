import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:p6_base/config.dart';
import 'package:p6_base/config/application.dart';
import 'package:p6_base/config/defaults.dart';
import 'package:p6_base/config/feature.dart';
import 'package:p6_base/config/from_context.dart';
import 'package:p6_base/config/from_json.dart';
import 'package:p6_base/config/from_package.dart';
import 'package:p6_base/config/from_settings.dart';
import 'package:p6_base/config/i18n.dart';
import 'package:p6_base/config/navigation.dart';
import 'package:p6_base/config/settings.dart';
import 'package:p6_base/config/theme.dart';
import 'package:p6_base/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AbstractConfig
    with //
        ConfigFromContext,
        ConfigFromJSON,
        ConfigFromPackage,
        ConfigFromSettings,
        ConfigDefaults,
        ConfigApplication,
        ConfigI18n,
        ConfigNavigation,
        ConfigSettings,
        ConfigTheme,
        ConfigFeature {
  bool get loaded => fileConfigApp != null && fileConfigHost != null && settings != null;

  load() async {
    Logger.debug('[config] Loading config.json');
    P6Config.configSettings = await SharedPreferences.getInstance();

    await rootBundle.loadString('assets/json/config.json').then((value) {
      Logger.debug('[config] Loaded config.json');
      Logger.trace('[config] $value');
      fileConfigApp = jsonDecode(value);
    });

    await rootBundle.loadString('assets/json/hosts.json').then((value) {
      Logger.debug('[config] Loaded hosts.json');
      Logger.trace('[config] $value');
      fileConfigHost = jsonDecode(value);
    });

    if (loaded) {
      P6Config.onConfigLoaded();
    }
  }
}
