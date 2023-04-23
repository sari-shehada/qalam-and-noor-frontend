import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/address/address.dart';
import '../../../../../models/helpers/database_helper.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../tools/ui_tools/buttons.dart';
import '../../../main_page/controllers/addresses_management_stats_controller.dart';

class AddOrEditAddressDialogController extends GetxController {
  RxBool isEditMode = false.obs;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;

  late final int areaId;
  late Address address;
  AddOrEditAddressDialogController({
    required dynamic argument,
  }) {
    if (argument is Address) {
      address = argument;
      isEditMode.value = true;
      addressController.text = address.name;
      detailsController.text = address.details ?? '';
    } else if (argument is int) {
      areaId = argument;
    }
  }

  bool validateFields() {
    if (addressController.text.isEmpty) {
      SnackbarService.showErrorSnackBar(
          title: 'اسم عنوان فارغ', message: 'الرجاء ملء حقل اسم العنوان');
      return false;
    }
    return true;
  }

  Future<void> addAddress() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      Address address = Address(
          id: -1,
          name: addressController.text,
          details: detailsController.text == '' ? null : detailsController.text,
          areaId: areaId);
      await DatabaseHelper.addNewAddress(address);

      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  Future<void> updateAddressInfo() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      address = address.copyWith(
          name: addressController.text, details: detailsController.text);
      await DatabaseHelper.updateAddressById(address: address);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
