import 'package:flutter/material.dart';

class Themes {
  static Color lightBg = Color(0xFFB9B9B9);
  static Color darkBg = Color(0xFF171717);

  static Color white = Color(0xFFFFFFFF);
  static Color black = Color(0xFF000000);

  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
      ),
      bodySmall: TextStyle(
        fontSize: 14.0,
      ),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: black,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: black,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        color: white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        color: lightBg,
      ),
      bodySmall: TextStyle(
        fontSize: 14.0,
        color: lightBg,
      ),
    ),
  );
}
