import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/psychological_statuses_db_helper.dart';
import 'package:kalam_noor/models/medical/psychological_status.dart';
import '../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../../tools/ui_tools/buttons.dart';

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
      SnackBarService.showErrorSnackBar(
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
      PsychologicalStatus psychologicalStatus =
          PsychologicalStatus(id: -1, name: psychologicalStatusController.text);
      await PsychologicalStatusesDBHelper.instance.insert(psychologicalStatus);
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
      await PsychologicalStatusesDBHelper.instance.update(psychologicalStatus!);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
