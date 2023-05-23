import 'package:flutter/widgets.dart';
import 'package:p6_base/logger.dart';

mixin ConfigFromContext {
  static num _screen_width = 0;
  static num _screen_height = 0;
  static double _screen_ratio = 1;
  static set context(BuildContext c) {
    try {
      _screen_width = MediaQuery.of(c).size.width;
      _screen_height = MediaQuery.of(c).size.height;
      _screen_ratio = MediaQuery.of(c).size.aspectRatio;
    } catch (e) {
      Logger.warn('$e');
    }
  }

  num get screen_width => ConfigFromContext._screen_width;
  num get screen_height => ConfigFromContext._screen_height;
  double get screen_ratio => ConfigFromContext._screen_ratio;
}
