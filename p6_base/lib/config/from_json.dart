import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:p6_base/config/directory.dart';
import 'package:p6_base/logger.dart';

class ConfigJsonFile {
  final String path;
  final bool mandatory;
  dynamic content;
  ConfigJsonFile({required this.path, required this.mandatory});
}

mixin ConfigFromJSON on ConfigDirectory {
  final Map<String, ConfigJsonFile> jsonFiles = {
    "app": ConfigJsonFile(path: 'config.json', mandatory: true),
    "grid": ConfigJsonFile(path: 'grid.json', mandatory: false),
    "hosts": ConfigJsonFile(path: 'hosts.json', mandatory: true),
    "layout": ConfigJsonFile(path: 'layout.json', mandatory: false),
    "themes": ConfigJsonFile(path: 'themes.json', mandatory: false),
    "dummy": ConfigJsonFile(path: 'dummy.json', mandatory: false),
  };
  bool get configFilesLoaded => jsonFiles.entries.where((e) => e.value.mandatory && e.value.content == null).isEmpty;

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

  loadConfigFiles() async {
    await locateSystemDirectories();
    Logger.debug('[config] Loading config files');
    await Future.forEach(jsonFiles.entries.where((e) => e.value.content == null), (element) async {
      Logger.debug('[config:${element.key}] Loading config (${element.value.path})');
      [
        directory_current,
        directory_temporary,
        directory_external,
        directory_library,
        directory_support,
        directory_documents,
        directory_download,
      ].where((element) => element != null).forEach((directory) {
        if (element.value.content == null) {
          try {
            File config = File('${directory?.path}/${element.value.path}');
            if (config.existsSync()) {
              element.value.content = jsonDecode(config.readAsStringSync());
              Logger.debug('[config:${element.key}] config loaded ${config.path}');
              return;
            }
            Logger.debug('[config:${element.key}] does not exist at ${config.path}');
          } catch (_) {
            Logger.debug('[config:${element.key}] unable to load from filesystem');
          }
        }
      });

      if (element.value.content == null) {
        try {
          await rootBundle.loadString('assets/debug/json/${element.value.path}').then((value) {
            Logger.debug('[config:${element.key}] loaded from assets_debug:${element.value.path}');
            Logger.trace('[config:${element.key}] $value');
            element.value.content = jsonDecode(value);
          });
        } catch (_) {
          Logger.debug('[config:${element.key}] unable to load from assets_debug');
        }
      }

      if (element.value.content == null) {
        try {
          await rootBundle.loadString('assets/json/${element.value.path}').then((value) {
            Logger.debug('[config:${element.key}] loaded from assets:${element.value.path}');
            Logger.trace('[config:${element.key}] $value');
            element.value.content = jsonDecode(value);
          });
        } catch (_) {
          Logger.debug('[config:${element.key}] unable to load from assets');
        }
      }
    });
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
