import 'package:flutter/widgets.dart';
import 'package:p6_base/logger.dart';

mixin ConfigFromContext {
  static num _screenWidth = 0;
  static num _screenHeight = 0;
  static double _screenRatio = 1;
  static set context(BuildContext c) {
    try {
      _screenWidth = MediaQuery.of(c).size.width;
      _screenHeight = MediaQuery.of(c).size.height;
      _screenRatio = MediaQuery.of(c).size.aspectRatio;
    } catch (e) {
      Logger.warn('$e');
    }
  }

  num get screenWidth => ConfigFromContext._screenWidth;
  num get screenHeight => ConfigFromContext._screenHeight;
  double get screenRatio => ConfigFromContext._screenRatio;
}
