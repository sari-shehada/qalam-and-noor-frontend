import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/area_db_helper.dart';

import '../../../../../models/address/area.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../tools/ui_tools/buttons.dart';

class AddOrEditAreaController extends GetxController {
  RxBool isEditMode = false.obs;
  final TextEditingController areaController = TextEditingController();
  final Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;

  late final int cityId;
  late Area area;
  AddOrEditAreaController({
    dynamic argument,
  }) {
    if (argument is Area) {
      area = argument;
      isEditMode.value = true;
      areaController.text = area.name;
    } else if (argument is int) {
      cityId = argument;
    }
  }

  bool validateFields() {
    if (areaController.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
          title: 'اسم منطقة فارغ', message: 'الرجاء ملء حقل اسم المنطقة');
      return false;
    }
    return true;
  }

  Future<void> addArea() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      Area area = Area(id: -1, name: areaController.text, cityId: cityId);
      await AreasDBHelper.instance.insert(area);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  Future<void> updateAreaInfo() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      area = area.copyWith(name: areaController.text);
      await AreasDBHelper.instance.update(area);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
