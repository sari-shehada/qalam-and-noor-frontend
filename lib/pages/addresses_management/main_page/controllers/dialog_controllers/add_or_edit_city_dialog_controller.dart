import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/address/city.dart';
import '../../../../../models/helpers/database_helper.dart';
import '../../../../../to_be_disposed/data/dummy_data.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../tools/ui_tools/buttons.dart';
import '../addresses_management_stats_controller.dart';

class AddOrEditCityDialogController extends GetxController {
  RxBool isEditMode = false.obs;
  City? city;
  final TextEditingController cityController = TextEditingController();
  Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;

  AddOrEditCityDialogController({
    this.city,
  }) {
    if (city != null) {
      isEditMode.value = true;
      cityController.text = city!.name;
    }
  }

  bool validateFields() {
    if (cityController.text.isEmpty) {
      SnackbarService.showErrorSnackBar(
          title: 'اسم مدينة فارغ', message: 'الرجاء ملء حقل اسم المدينة');
      return false;
    }
    return true;
  }

  Future<void> addCity() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      City city = City(id: (dummyCities.length + 1), name: cityController.text);
      await DatabaseHelper.addCity(city);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  Future<void> updateCityInfo() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      city = city!.copyWith(name: cityController.text);
      await DatabaseHelper.updateCityById(city: city!);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
