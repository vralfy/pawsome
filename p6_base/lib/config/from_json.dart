import 'package:flutter/foundation.dart';
import 'package:p6_base/config.dart';
import 'package:p6_base/logger.dart';

mixin ConfigFromJSON {
  dynamic fileConfigApp;
  dynamic fileConfigHost;

  List<List<String>> get configPrefixes {
    List<List<String>> defaultPrefixes = [
      [defaultTargetPlatform.name],
      [modeApplication],
    ];
    List<List<String>> prefixes = [...defaultPrefixes];

    String join = ',';
    for (int i = 1; i < 3; i++) {
      [...prefixes].forEach((prefix) {
        defaultPrefixes.forEach((dPrefix) {
          bool duplicate = dPrefix.where((element) => prefix.contains(element)).isNotEmpty;
          List<String> newPrefix = [...prefix, ...dPrefix];
          bool contains = prefixes.map((e) => e.join(join)).contains(newPrefix.join(join));
          if (!contains && !duplicate) {
            prefixes.add(newPrefix);
          }
        });
      });
    }
    return prefixes;
  }

  dynamic getByPath({List<String>? list, String? str, dynamic defaultValue, dynamic config}) {
    List<String> path = list ?? (str?.split(',').toList() ?? []);
    List<List<String>> paths = [path];
    List<List<String>> prefixes = configPrefixes;
    prefixes.forEach((prefix) => paths.add(['override', ...prefix, ...path]));

    List<String> log = [
      '',
      'path: ${list ?? str}',
      'prefixes: $prefixes',
    ];
    List<dynamic> values = paths.reversed
        .map((p) {
          dynamic v = getByPathOnObject(config, p);
          if (v != null) {
            log.add('resolved: $p => $v');
          }
          return v;
        })
        .where((v) => v != null)
        .toList();

    Logger.trace('[config] ${log.join('\n')}\n');
    if (values.isNotEmpty) {
      return values.first;
    }
    return defaultValue;
  }

  dynamic getByPathOnObject(dynamic c, List<String>? path) {
    if (c == null || path == null) {
      return null;
    }
    // if (!configLoaded) {
    //   load();
    // }

    Logger.trace('[config] Resolving config path: $path');
    Logger.trace('[config] Resolving in object  : $c');
    dynamic value = c[path.first.trim()];
    if (path.length == 1) {
      return value;
    }
    return getByPathOnObject(value, path.sublist(1));
  }

  bool get modeDebug => kDebugMode;
  bool get modeProfile => kProfileMode;
  bool get modeRelease => kReleaseMode;
  String get modeApplication {
    if (modeDebug) {
      return 'debug';
    }
    if (modeProfile) {
      return 'profile';
    }
    return 'release';
  }
}
