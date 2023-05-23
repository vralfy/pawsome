import 'package:flutter/material.dart';
import 'package:p6_base/config.dart';

class Themes with Configuration {
  static ThemeData get config => P6Config.instance.theme_simple_mode ? Themes().simpleTheme : Themes().theme;

  final MaterialColor? color_primary;
  final MaterialColor? color_secondary;
  final Color? color_background;
  final Color? color_foreground;
  final bool? darkMode;

  Themes({
    this.color_primary,
    this.color_secondary,
    this.color_background,
    this.color_foreground,
    this.darkMode,
  });

  /// Creates a new theme
  ThemeData get theme {
    TextTheme textTheme = TextTheme(
      bodyMedium: TextStyle(
        fontSize: configuration.font_size,
        color: color_foreground ?? configuration.color_foreground,
      ),
    );

    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: color_primary ?? configuration.color_primary,
        primaryColorDark: color_primary ?? configuration.color_primary,
        brightness: (darkMode ?? configuration.theme_dark_mode) ? Brightness.dark : Brightness.light,
      ),
      backgroundColor: color_background ?? configuration.color_background,
      buttonTheme: ButtonThemeData(
        buttonColor: color_background ?? configuration.color_background,
        disabledColor: color_foreground ?? configuration.color_foreground,
        textTheme: ButtonTextTheme.primary,
      ),
      cardColor: color_background ?? configuration.color_background,
      cardTheme: CardTheme(
        shadowColor: color_foreground ?? configuration.color_foreground,
        color: color_background ?? configuration.color_background,
      ),
      disabledColor: configuration.color_inactive,
      dividerColor: color_secondary ?? configuration.color_secondary,
      drawerTheme: DrawerThemeData(
        backgroundColor: color_background ?? configuration.color_background,
        elevation: 20,
        scrimColor: color_background ?? configuration.color_background,
        width: 0.8,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: configuration.color_background,
      ),
      primarySwatch: color_primary,
      primaryTextTheme: textTheme,
      scaffoldBackgroundColor: color_background ?? configuration.color_background,
      textTheme: textTheme,
    );
  }

  ThemeData get simpleTheme {
    ColorScheme colorScheme = ColorScheme.fromSwatch(
      primarySwatch: color_primary ?? configuration.color_primary,
      brightness: (darkMode ?? configuration.theme_dark_mode) ? Brightness.dark : Brightness.light,
    );
    // ColorScheme(
    //   background: color_background ?? Constants.color_background,
    //   error: Constants.color_danger,
    //   primary: Constants.color_primary,
    // )
    return ThemeData(colorScheme: colorScheme);
  }
}
