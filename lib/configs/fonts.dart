import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'project_themes.dart';

class ProjectFonts {
  static String get fontFamily => 'Frutiger';

  static TextStyle displayLarge() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 57.sp,
      color: lightColorScheme.primary,
      letterSpacing: 0.sp,
    );
  }

  static TextStyle displayMedium() {
    return TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 45.sp,
        color: lightColorScheme.primary,
        letterSpacing: 0.sp,
        height: (52 / 45));
  }

  static TextStyle displaySmall() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 36.sp,
      color: lightColorScheme.primary,
      letterSpacing: 0.sp,
    );
  }

  static TextStyle headlineLarge() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32.sp,
      color: lightColorScheme.primary,
      letterSpacing: 0.sp,
    );
  }

  static TextStyle headlineMedium() {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 28.sp,
      fontWeight: FontWeight.bold,
      color: lightColorScheme.primary,
    );
  }

  static TextStyle headlineSmall() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 24.sp,
      color: lightColorScheme.primary,
      letterSpacing: 0.sp,
    );
  }

  static TextStyle titleLarge() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 22.sp,
      color: lightColorScheme.primary,
      letterSpacing: 0.sp,
    );
  }

  static TextStyle titleMedium() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: lightColorScheme.onSurfaceVariant,
      letterSpacing: 0.15.sp,
    );
  }

  static TextStyle titleSmall() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      color: lightColorScheme.onSurfaceVariant,
      letterSpacing: 0.1.sp,
    );
  }

  static TextStyle labelLarge() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14.sp,
      color: lightColorScheme.onSurfaceVariant,
      letterSpacing: 0.1.sp,
    );
  }

  static TextStyle labelMedium() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 12.sp,
      color: lightColorScheme.onSurfaceVariant,
      letterSpacing: 0.5.sp,
    );
  }

  static TextStyle labelSmall() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 11.sp,
      color: lightColorScheme.onSurfaceVariant,
      letterSpacing: 0.5.sp,
    );
  }

  static TextStyle bodyLarge() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: lightColorScheme.onSurfaceVariant,
      letterSpacing: 0.15.sp,
    );
  }

  static TextStyle bodyMedium() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      color: lightColorScheme.onSurfaceVariant,
      letterSpacing: 0.25.sp,
    );
  }

  static TextStyle bodySmall() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
      color: lightColorScheme.onSurfaceVariant,
      letterSpacing: 0.4.sp,
    );
  }
}
