import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/cities_db_helper.dart';

import '../../../../../../models/address/city.dart';
import '../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../../tools/ui_tools/buttons.dart';

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
      SnackBarService.showErrorSnackBar(
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
      City city = City(id: -1, name: cityController.text);
      await CitiesDBHelper.instance.insert(city);
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
      await CitiesDBHelper.instance.update(city!);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
