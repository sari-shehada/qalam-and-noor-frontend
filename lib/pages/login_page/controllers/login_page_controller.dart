import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';

import '../../../controllers/navigation_controller.dart';
import '../../../models/shared_prefs_helper.dart';
import '../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../tools/ui_tools/buttons.dart';

class LoginPageController extends GetxController {
  RxBool obscureText = true.obs;
  TextEditingController userNameField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  Rx<CustomButtonStatus> loginButtonStatus = CustomButtonStatus.enabled.obs;
  bool validateFields() {
    if (userNameField.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
        title: 'اسم مستخدم فارغ',
        message: 'الرجاء ملئ جميع الحقول أدناه',
      );
      return false;
    }
    if (passwordField.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
        title: 'كلمة سر فارغة',
        message: 'الرجاء ملئ جميع الحقول أدناه',
      );
      return false;
    }
    //TODO: Add futher validation
    return true;
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  Future<void> login() async {
    loginButtonStatus.value = CustomButtonStatus.processing;
    if (validateFields()) {
      final AccountController controller = Get.find<AccountController>();
      final bool loginResult = await controller.login(
        userName: userNameField.text,
        password: passwordField.text,
      );
      if (loginResult == true) {
        NavigationController.toDashboard();
        SharedPrefsHelper.instance.saveLoginData(controller.employee.id);
      }
    }
    loginButtonStatus.value = CustomButtonStatus.enabled;
  }
}
