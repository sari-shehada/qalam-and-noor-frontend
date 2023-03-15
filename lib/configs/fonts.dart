import 'package:flutter/material.dart';
import 'package:kalam_noor/configs/project_themes.dart';

class ProjectFonts {
  static String get fontFamily => 'Frutiger';

  static TextStyle get headlineLarge => TextStyle(
      fontFamily: fontFamily,
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: lightColorScheme.primary);

  static TextStyle get headlineMedium => TextStyle(
      fontFamily: fontFamily,
      fontSize: 45,
      fontWeight: FontWeight.normal,
      color: lightColorScheme.primary);

  static TextStyle get headlineSmall => TextStyle(
      fontFamily: fontFamily,
      fontSize: 40,
      fontWeight: FontWeight.w300,
      color: lightColorScheme.primary);

  static TextTheme get lightTextTheme => const TextTheme();
}
