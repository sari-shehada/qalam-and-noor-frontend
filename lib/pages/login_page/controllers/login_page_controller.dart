import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';
import 'package:kalam_noor/dummy_methods.dart';
import 'package:kalam_noor/models/shared_prefs_helper.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

import '../../../controllers/account_controller.dart';
import '../../../models/employee.dart';

class LoginPageController extends GetxController {
  TextEditingController userNameField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  bool validateFields() {
    if (userNameField.text.isEmpty) {
      SnackbarService.showErrorSnackBar(
        title: 'اسم مستخدم فارغ',
        message: 'الرجاء ملئ جميع الحقول أدناه',
      );
      return false;
    }
    if (passwordField.text.isEmpty) {
      SnackbarService.showErrorSnackBar(
        title: 'كلمة سر فارغة',
        message: 'الرجاء ملئ جميع الحقول أدناه',
      );
      return false;
    }
    //TODO: Add futher validation
    return true;
  }

  Future<void> login() async {
    if (validateFields()) {
      await Future.delayed(const Duration(seconds: 2));
      Employee employee = await getEmployeeCredentials('11');
      NavigationController.toDashboard(employee);
      SharedPrefsHelper.instance.setLoginStatus(true);
    }
  }
}
