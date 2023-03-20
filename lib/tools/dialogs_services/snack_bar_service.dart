import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/project_themes.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class SnackbarService {
  static void showErrorSnackBar(
      {required String title, required String message}) {
    Get.showSnackbar(GetSnackBar(
      borderRadius: 15,
      margin: EdgeInsets.symmetric(
          horizontal: Get.mediaQuery.size.width / 4, vertical: 30),
      // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      icon: Row(
        children: const [
          AddHorizontalSpacing(value: 20),
          FaIcon(
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
}
