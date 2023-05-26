import 'package:flutter/material.dart';
import 'package:p6_base/config.dart';
import 'package:p6_base/logger.dart';

class Themes with Configuration {
  static ThemeData get config => P6Config.instance.themeSimpleMode ? Themes().simpleTheme : Themes().theme;

  final MaterialColor? colorPrimary;
  final MaterialColor? colorSecondary;
  final Color? colorBackground;
  final Color? colorForeground;
  final bool? darkMode;

  Themes({
    this.colorPrimary,
    this.colorSecondary,
    this.colorBackground,
    this.colorForeground,
    this.darkMode,
  });

  /// Creates a new theme
  ThemeData get theme {
    Logger.info('Loading theme ${configuration.theme} (${configuration.themeDarkMode ? 'dark' : 'light'}|${configuration.themeSimpleMode ? 'simple' : 'normal'})');
    TextTheme textTheme = TextTheme(
      bodyMedium: TextStyle(
        fontSize: configuration.fontSize,
        color: colorForeground ?? configuration.colorForeground,
      ),
    );

    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: colorPrimary ?? configuration.colorPrimary,
        primaryColorDark: colorPrimary ?? configuration.colorPrimary,
        brightness: (darkMode ?? configuration.themeDarkMode) ? Brightness.dark : Brightness.light,
        backgroundColor: colorBackground ?? configuration.colorBackground,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: colorBackground ?? configuration.colorBackground,
        disabledColor: colorForeground ?? configuration.colorForeground,
        textTheme: ButtonTextTheme.primary,
      ),
      cardColor: colorBackground ?? configuration.colorBackground,
      cardTheme: CardTheme(
        shadowColor: colorForeground ?? configuration.colorForeground,
        color: colorBackground ?? configuration.colorBackground,
      ),
      disabledColor: configuration.colorInactive,
      dividerColor: colorSecondary ?? configuration.colorSecondary,
      drawerTheme: DrawerThemeData(
        backgroundColor: colorBackground ?? configuration.colorBackground,
        elevation: 20,
        scrimColor: colorBackground ?? configuration.colorBackground,
        width: 0.8,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: configuration.colorBackground,
      ),
      primarySwatch: colorPrimary,
      primaryTextTheme: textTheme,
      scaffoldBackgroundColor: colorBackground ?? configuration.colorBackground,
      textTheme: textTheme,
    );
  }

  ThemeData get simpleTheme {
    ColorScheme colorScheme = ColorScheme.fromSwatch(
      primarySwatch: colorPrimary ?? configuration.colorPrimary,
      brightness: (darkMode ?? configuration.themeDarkMode) ? Brightness.dark : Brightness.light,
    );
    // ColorScheme(
    //   background: color_background ?? Constants.color_background,
    //   error: Constants.color_danger,
    //   primary: Constants.color_primary,
    // )
    return ThemeData(colorScheme: colorScheme);
  }
}
