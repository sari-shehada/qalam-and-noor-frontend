import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/psychological_status.dart';
import 'package:kalam_noor/to_be_disposed/data/dummy_data.dart';
import '../../../../models/helpers/database_helper.dart';
import '../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../tools/ui_tools/buttons.dart';

class AddOrEditPsychologicalStatusDialogController extends GetxController {
  RxBool isEditMode = false.obs;
  PsychologicalStatus? psychologicalStatus;
  final TextEditingController psychologicalStatusController =
      TextEditingController();
  Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;

  AddOrEditPsychologicalStatusDialogController({
    this.psychologicalStatus,
  }) {
    if (psychologicalStatus != null) {
      isEditMode.value = true;
      psychologicalStatusController.text = psychologicalStatus!.name;
    }
  }

  bool validateFields() {
    if (psychologicalStatusController.text.isEmpty) {
      SnackbarService.showErrorSnackBar(
          title: 'اسم حالة فارغ',
          message: 'الرجاء ملء حقل اسم الحالة المزاجية');
      return false;
    }
    return true;
  }

  Future<void> addPsychologicalStatus() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      PsychologicalStatus psychologicalStatus = PsychologicalStatus(
          id: (dummyPsychologicalStatuses.length + 1),
          name: psychologicalStatusController.text);
      await DatabaseHelper.addPsychologicalStatus(psychologicalStatus);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  Future<void> updatePsychologicalStatusInfo() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      psychologicalStatus = psychologicalStatus!
          .copyWith(name: psychologicalStatusController.text);
      await DatabaseHelper.updatePsychologicalStatusById(
          psychologicalStatus: psychologicalStatus!);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
