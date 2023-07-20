import 'package:flutter/material.dart';
import 'package:pet_adoption_app/config/constants/theme_constant.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme(bool isDark) {
    return ThemeData(
      // change the theme according to the user choice
      colorScheme: isDark
          ? const ColorScheme.dark(
              primary: ThemeConstant.mainColor,
            )
          : const ColorScheme.light(
              primary: ThemeConstant.mainColor,
            ),
      brightness: isDark ? Brightness.dark : Brightness.light,
    );
  }
}
