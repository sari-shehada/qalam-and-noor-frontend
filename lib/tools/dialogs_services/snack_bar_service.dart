import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../configs/project_themes.dart';
import '../ui_tools/ui_tools.dart';

class SnackBarService {
  static void showErrorSnackBar(
      {required String title, required String message}) {
    Get.showSnackbar(GetSnackBar(
      borderRadius: 15,
      margin: EdgeInsets.symmetric(
          horizontal: (Get.mediaQuery.size.width / 4 + 20.w), vertical: 30),
      // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      icon: Row(
        children: [
          AddHorizontalSpacing(value: 20.w),
          const FaIcon(
            FontAwesomeIcons.x,
            color: Colors.white,
          ),
        ],
      ),
      title: title,
      message: message,
      backgroundColor: lightColorScheme.error,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
    ));
  }

  static void showSuccessSnackBar(
      {required String title, required String message}) {
    Get.showSnackbar(GetSnackBar(
      borderRadius: 15,
      margin: EdgeInsets.symmetric(
          horizontal: (Get.mediaQuery.size.width / 4 + 20.w), vertical: 30),
      icon: Row(
        children: [
          AddHorizontalSpacing(value: 20.w),
          const FaIcon(
            FontAwesomeIcons.check,
            color: Colors.white,
          ),
        ],
      ),
      title: title,
      message: message,
      backgroundColor: Colors.green.shade400,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
    ));
  }

  static void showNeutralSnackBar(
      {required String title, required String message}) {
    Get.showSnackbar(GetSnackBar(
      borderRadius: 15,
      margin: EdgeInsets.symmetric(
          horizontal: (Get.mediaQuery.size.width / 4 + 20.w), vertical: 30),
      icon: Row(
        children: [
          AddHorizontalSpacing(value: 20.w),
          const FaIcon(
            FontAwesomeIcons.check,
            color: Colors.white,
          ),
        ],
      ),
      title: title,
      message: message,
      backgroundColor: Colors.blueGrey.shade600,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
    ));
  }
}
