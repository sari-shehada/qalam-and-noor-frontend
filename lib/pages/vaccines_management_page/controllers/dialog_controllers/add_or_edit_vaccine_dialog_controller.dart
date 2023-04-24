import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/vaccine.dart';
import 'package:kalam_noor/to_be_disposed/data/dummy_data.dart';
import '../../../../models/helpers/database_helper.dart';
import '../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../tools/ui_tools/buttons.dart';

class AddOrEditVaccineDialogController extends GetxController {
  RxBool isEditMode = false.obs;
  Vaccine? vaccine;
  final TextEditingController vaccineController = TextEditingController();
  Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;

  AddOrEditVaccineDialogController({
    this.vaccine,
  }) {
    if (vaccine != null) {
      isEditMode.value = true;
      vaccineController.text = vaccine!.name;
    }
  }

  bool validateFields() {
    if (vaccineController.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
          title: 'اسم لقاح فارغ', message: 'الرجاء ملء حقل اسم اللقاح');
      return false;
    }
    return true;
  }

  Future<void> addVaccine() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      Vaccine vaccine =
          Vaccine(id: (dummyVaccines.length + 1), name: vaccineController.text);
      await DatabaseHelper.addVaccine(vaccine);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  Future<void> updateVaccineInfo() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      vaccine = vaccine!.copyWith(name: vaccineController.text);
      await DatabaseHelper.updateVaccineById(vaccine: vaccine!);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
