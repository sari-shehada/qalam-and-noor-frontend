import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/navigation_controller.dart';
import '../../../to_be_disposed/methods/dummy_methods.dart';
import '../../../models/agendas/employee.dart';
import '../../../models/shared_prefs_helper.dart';
import '../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../tools/ui_tools/buttons.dart';

class LoginPageController extends GetxController {
  TextEditingController userNameField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  Rx<CustomButtonStatus> loginButtonStatus = CustomButtonStatus.enabled.obs;
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
    loginButtonStatus.value = CustomButtonStatus.processing;
    if (validateFields()) {
      await Future.delayed(const Duration(
        milliseconds: 500,
      ));
      Employee employee = await getEmployeeCredentials('11');
      NavigationController.toDashboard(employee);
      SharedPrefsHelper.instance.setLoginStatus(true);
    }
    loginButtonStatus.value = CustomButtonStatus.enabled;
  }
}
