import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:p6_base/config/from_json.dart';
import 'package:p6_base/config/from_settings.dart';
import 'package:p6_base/logger.dart';

mixin ConfigTheme on ConfigFromJSON, ConfigFromSettings {
  List<dynamic> get themes {
    List<dynamic> ret = [];
    (getByPath(str: 'themes, list', defaultValue: [], config: jsonFiles['themes']?.content) as List<dynamic>).forEach((e) => ret.add({
          'key': e,
          'name': getByPath(str: 'themes, themes, $e, name', defaultValue: 'Unnamed $e theme', config: jsonFiles['themes']?.content),
        }));
    Logger.trace('[config] ${jsonEncode(ret)}');
    return ret;
  }

  dynamic getThemeProperty({String? str, dynamic defaultValue}) => getByPath(str: 'themes, themes, $theme, $str', defaultValue: defaultValue, config: jsonFiles['themes']?.content);

  MaterialColor getThemeColor(String name, MaterialColor defaultColor) {
    String? hexCode = getThemeProperty(str: 'color, $name');
    if (hexCode == null) {
      return defaultColor;
    }
    int intCode = int.parse(hexCode, radix: 16) | 0xff000000;
    Color color = Color(intCode);
    return MaterialColor(intCode, {
      50: Color.fromRGBO(color.red, color.green, color.blue, 1),
      100: Color.fromRGBO(color.red, color.green, color.blue, 1),
      200: Color.fromRGBO(color.red, color.green, color.blue, 1),
      300: Color.fromRGBO(color.red, color.green, color.blue, 1),
      400: Color.fromRGBO(color.red, color.green, color.blue, 1),
      500: Color.fromRGBO(color.red, color.green, color.blue, 1),
      600: Color.fromRGBO(color.red, color.green, color.blue, 1),
      700: Color.fromRGBO(color.red, color.green, color.blue, 1),
      800: Color.fromRGBO(color.red, color.green, color.blue, 1),
      900: Color.fromRGBO(color.red, color.green, color.blue, 1),
    });
  }

  String get theme => settings?.getString('THEME') ?? getByPath(str: 'themes, default', defaultValue: 'default', config: jsonFiles['themes']?.content);

  bool get theme_dark_mode {
    return ['true', 'yes', '1', true].contains(getThemeProperty(str: 'darkMode', defaultValue: false));
  }

  bool get theme_simple_mode {
    return ['true', 'yes', '1', true].contains(getThemeProperty(str: 'simple', defaultValue: false));
  }

  double get font_size => double.parse(getThemeProperty(str: 'font, size', defaultValue: '12'));
  double get padding_vertical => double.parse(getThemeProperty(str: 'padding, vertical', defaultValue: '2'));
  double get padding_horizontal => double.parse(getThemeProperty(str: 'padding, horizontal', defaultValue: '10'));
  int get min_floating_buttons => int.parse(getThemeProperty(str: 'floating_buttons, min', defaultValue: '1'));

  // Colors
  MaterialColor get color_white {
    return const MaterialColor(0xFFFFFFFF, {
      50: Color.fromRGBO(255, 255, 255, 1),
      100: Color.fromRGBO(255, 255, 255, 1),
      200: Color.fromRGBO(255, 255, 255, 1),
      300: Color.fromRGBO(255, 255, 255, 1),
      400: Color.fromRGBO(255, 255, 255, 1),
      500: Color.fromRGBO(255, 255, 255, 1),
      600: Color.fromRGBO(255, 255, 255, 1),
      700: Color.fromRGBO(255, 255, 255, 1),
      800: Color.fromRGBO(255, 255, 255, 1),
      900: Color.fromRGBO(255, 255, 255, 1),
    });
  }

  MaterialColor get color_black {
    return const MaterialColor(0xFF000000, {
      50: Color.fromRGBO(0, 0, 0, 1),
      100: Color.fromRGBO(0, 0, 0, 1),
      200: Color.fromRGBO(0, 0, 0, 1),
      300: Color.fromRGBO(0, 0, 0, 1),
      400: Color.fromRGBO(0, 0, 0, 1),
      500: Color.fromRGBO(0, 0, 0, 1),
      600: Color.fromRGBO(0, 0, 0, 1),
      700: Color.fromRGBO(0, 0, 0, 1),
      800: Color.fromRGBO(0, 0, 0, 1),
      900: Color.fromRGBO(0, 0, 0, 1),
    });
  }

  MaterialColor get color_primary => getThemeColor('primary', Colors.indigo);
  MaterialColor get color_secondary => getThemeColor('secondary', Colors.deepOrange);
  MaterialColor get color_tertiary => getThemeColor('secondary', Colors.cyan);
  MaterialColor get color_background => getThemeColor('background', getThemeColor('white', color_white));
  MaterialColor get color_foreground => getThemeColor('foreground', getThemeColor('black', color_black));
  MaterialColor get color_danger => getThemeColor('danger', Colors.red);
  MaterialColor get color_warning => getThemeColor('warning', Colors.yellow);
  MaterialColor get color_success => getThemeColor('success', Colors.green);
  MaterialColor get color_info => getThemeColor('info', Colors.indigo);
  MaterialColor get color_ok => getThemeColor('ok', Colors.green);
  MaterialColor get color_cancel => getThemeColor('cancel', Colors.red);
  MaterialColor get color_inactive => getThemeColor('inactive', Colors.grey);
  MaterialColor get color_done => getThemeColor('ok', Colors.blueGrey);
}
