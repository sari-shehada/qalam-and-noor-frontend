import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../models/helpers/database_helpers/previous_schools_helpers/previous_schools_db_helper.dart';
import '../../../../../models/previous_schools/previous_schools.dart';

import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../tools/ui_tools/buttons.dart';

class AddOrEditPreviousSchoolDialogController extends GetxController {
  RxBool isEditMode = false.obs;
  PreviousSchool? previousSchool;
  final TextEditingController previousSchoolController =
      TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;

  AddOrEditPreviousSchoolDialogController({
    this.previousSchool,
  }) {
    if (previousSchool != null) {
      isEditMode.value = true;
      previousSchoolController.text = previousSchool!.name;
    }
  }

  bool validateFields() {
    if (previousSchoolController.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
          title: 'اسم مدرسة فارغ', message: 'الرجاء ملء حقل اسم المدرسة');
      return false;
    }
    return true;
  }

  Future<void> addPreviousSchool() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      PreviousSchool previousSchool = PreviousSchool(
        id: -1,
        name: previousSchoolController.text,
        details: detailsController.text,
      );
      await PreviousSchoolsDBHelper.instance.insert(previousSchool);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  Future<void> updatePreviousSchoolInfo() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      previousSchool = previousSchool!.copyWith(
        name: previousSchoolController.text,
        details: detailsController.text,
      );
      await PreviousSchoolsDBHelper.instance.update(previousSchool!);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
