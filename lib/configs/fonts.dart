import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'project_themes.dart';

class ProjectFonts {
  static String get fontFamily => 'Frutiger';

  static TextStyle get headlineLarge => TextStyle(
      fontFamily: fontFamily,
      fontSize: 50.sp,
      fontWeight: FontWeight.bold,
      color: lightColorScheme.primary);

  static TextStyle headlineMedium() {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 28.sp,
      fontWeight: FontWeight.bold,
      color: lightColorScheme.primary,
    );
  }

  static TextStyle get headlineSmall => TextStyle(
      fontFamily: fontFamily,
      fontSize: 40.sp,
      fontWeight: FontWeight.w300,
      color: lightColorScheme.primary);

  static TextStyle titleLarge() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 22.sp,
      color: lightColorScheme.primary,
      letterSpacing: 0.sp,
    );
  }

  static TextStyle get titleMedium => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w300,
        fontSize: 18.sp,
        color: lightColorScheme.inverseSurface,
      );

  static TextTheme get lightTextTheme => const TextTheme();
}
