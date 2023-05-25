import 'package:p6_base/config.dart';
import 'package:p6_base/config/application.dart';
import 'package:p6_base/config/defaults.dart';
import 'package:p6_base/config/feature.dart';
import 'package:p6_base/config/from_context.dart';
import 'package:p6_base/config/from_json.dart';
import 'package:p6_base/config/from_package.dart';
import 'package:p6_base/config/from_settings.dart';
import 'package:p6_base/config/grid.dart';
import 'package:p6_base/config/i18n.dart';
import 'package:p6_base/config/navigation.dart';
import 'package:p6_base/config/remote_hosts.dart';
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
        ConfigGrid,
        ConfigI18n,
        ConfigNavigation,
        ConfigRemoteHosts,
        ConfigSettings,
        ConfigTheme,
        ConfigFeature {
  bool get loaded => configFilesLoaded && settings != null;

  load() async {
    Logger.debug('[config] Loading config.json');
    P6Config.configSettings = await SharedPreferences.getInstance();

    await loadConfigFiles();

    if (loaded) {
      Logger.debug('[config] Config loading complete');
      P6Config.onConfigLoaded();
    } else {
      Logger.debug('[config] Not all configs have been loaded');
    }
  }
}
