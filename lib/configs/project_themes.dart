import 'package:flutter/material.dart';

class ProjectThemes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light, seedColor: Colors.red),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: Colors.pink),
  );
}
