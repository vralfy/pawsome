library ffwric_package_base;

import 'dart:io';
import 'package:flutter/foundation.dart';

class Logger {
  static const int LOGLEVEL_OFF = 9;
  static const int LOGLEVEL_TRACE = 5;
  static const int LOGLEVEL_DEBUG = 4;
  static const int LOGLEVEL_INFO = 3;
  static const int LOGLEVEL_WARN = 2;
  static const int LOGLEVEL_ERROR = 1;
  static const int LOGLEVEL_ALL = 0;

  static int get loglevel {
    return 4;
  }

  static bool get debugMode {
    return false;
  }

  static log(String level, String msg) {
    if (kIsWeb) {
      debugPrint('[$level] $msg');
    } else {
      stdout.writeln('[$level] $msg');
    }
  }

  static trace(String msg, {bool force = false}) {
    if ((loglevel >= LOGLEVEL_TRACE && debugMode) || force) {
      log('TRACE', msg);
    }
  }

  static debug(String msg, {bool force = false}) {
    if (loglevel >= LOGLEVEL_DEBUG || debugMode || force) {
      log('DEBUG', msg);
    }
  }

  static info(String msg, {bool force = false}) {
    if (loglevel >= LOGLEVEL_INFO || debugMode || force) {
      log('INFO', msg);
    }
  }

  static warn(String msg, {bool force = false}) {
    if (loglevel >= LOGLEVEL_WARN || debugMode || force) {
      log('WARN', msg);
    }
  }

  static error(String msg, {bool force = false}) {
    if (loglevel >= LOGLEVEL_ERROR || debugMode || force) {
      log('ERROR', msg);
    }
  }
}
