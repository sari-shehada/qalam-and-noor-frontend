import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../tools/dialogs_services/snack_bar_service.dart';

class ValidationTextField<T> {
  final TextEditingController controller;
  late Rx<Color?> fillColor;
  final String? Function(TextEditingController controller) validator;

  ValidationTextField({required this.controller, required this.validator}) {
    this.fillColor = Rx<Color?>(null);
    controller.addListener(() {
      resetColor();
    });
  }

  bool validate() {
    String? message = validator(controller);
    if (message != null) {
      SnackBarService.showErrorSnackBar(
          title: 'خطأ في المدخلات', message: message);
      fillColor.value = Colors.red.withOpacity(.3);

      return false;
    }
    fillColor.value = null;

    return true;
  }

  resetColor() {
    if (fillColor.value != null) {
      fillColor.value = null;
      fillColor.refresh();
    }
  }

  String getValue() {
    return controller.text;
  }
}
