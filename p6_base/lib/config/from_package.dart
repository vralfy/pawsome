import 'package:p6_base/logger.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

mixin ConfigFromPackage {
  static PackageInfo? _packageInfo;
  static load() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      ConfigFromPackage._packageInfo = await PackageInfo.fromPlatform();
    } catch (e) {
      Logger.warn('$e');
    }
  }

  PackageInfo? get packageInfo {
    if (ConfigFromPackage._packageInfo == null) {
      ConfigFromPackage.load();
    }
    return ConfigFromPackage._packageInfo;
  }
}
