import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/address/area.dart';
import '../../../../../models/helpers/database_helper.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../tools/ui_tools/buttons.dart';
import '../../../main_page/controllers/addresses_management_stats_controller.dart';

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
      SnackbarService.showErrorSnackBar(
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
      await DatabaseHelper.addNewArea(area);
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
      await DatabaseHelper.updateAreaById(area: area);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
