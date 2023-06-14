import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/addresses_db_helper.dart';

import '../../../../../../models/address/address.dart';
import '../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../../tools/ui_tools/buttons.dart';

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
      SnackBarService.showErrorSnackBar(
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
      await AddressesDBHelper.instance.insert(address);

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
      await AddressesDBHelper.instance.update(address);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
