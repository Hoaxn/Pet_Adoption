import 'package:flutter/material.dart';

class ThemeConstant {
  ThemeConstant._();

  static const Color mainColor = Color.fromRGBO(70, 112, 112, 1.0);

  // static const Color secondaryColor = Color.fromRGBO(168, 135, 107, 1.0);

  static const Color secondaryColor = Color.fromARGB(126, 65, 70, 215);

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Colors.black,
      primary: ThemeConstant.mainColor,
      secondary: Color.fromRGBO(219, 10, 91, 1.0),
    ),
  );

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: ThemeConstant.mainColor,
      // secondary: ThemeConstant.mainColor,
    ),
  );
}
