import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/illnesses_db_helper.dart';
import 'package:kalam_noor/models/medical/illness.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import '../../../../../../tools/dialogs_services/snack_bar_service.dart';

class AddOrEditIllnessController extends GetxController {
  RxBool isEditMode = false.obs;
  Illness? illness;
  final TextEditingController illnessController = TextEditingController();
  Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;

  AddOrEditIllnessController({this.illness}) {
    if (illness != null) {
      isEditMode.value = true;
      illnessController.text = illness!.name;
    }
  }

  bool validateFields() {
    if (illnessController.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
          title: 'اسم مرض فارغ', message: 'الرجاء ملء حقل اسم المرض');
      return false;
    }
    return true;
  }

  Future<void> addIllness() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      Illness illness = Illness(id: -1, name: illnessController.text);
      await IllnessesDBHelper.instance.insert(illness);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  Future<void> updateIllnessInfo() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      illness = illness!.copyWith(name: illnessController.text);
      await IllnessesDBHelper.instance.update(illness!);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
