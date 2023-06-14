import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/school_classes_db_helper.dart';
import '../../../../../../models/educational/school_class.dart';
import '../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../../tools/ui_tools/buttons.dart';

class AddOrEditSchoolClassDialogController extends GetxController {
  RxBool isEditMode = false.obs;
  SchoolClass? schoolClass;
  final TextEditingController schoolClassController = TextEditingController();
  Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;

  AddOrEditSchoolClassDialogController({this.schoolClass}) {
    if (schoolClass != null) {
      isEditMode.value = true;
      schoolClassController.text = schoolClass!.name;
    }
  }

  bool validateFields() {
    if (schoolClassController.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
          title: 'اسم مرحلة فارغ',
          message: 'الرجاء ملء حقل اسم المرحلة الدراسية');
      return false;
    }
    return true;
  }

  Future<void> addSchoolClass() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      //TODO:previous Class Id
      SchoolClass schoolClass =
          SchoolClass(id: -1, name: schoolClassController.text);
      await SchoolClassesDBHelper.instance.insert(schoolClass);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

//TODO : update previous class id
  Future<void> updateSchoolClassInfo() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      schoolClass = schoolClass!.copyWith(name: schoolClassController.text);
      await SchoolClassesDBHelper.instance.update(schoolClass!);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
