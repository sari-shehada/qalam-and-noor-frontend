import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import '../../../../../models/helpers/database_helpers/classrooms_db_helper.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../tools/ui_tools/buttons.dart';

class AddOrEditClassroomDialogController extends GetxController {
  RxBool isEditMode = false.obs;
  final TextEditingController classroomController = TextEditingController();
  final Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;

  late final int classroomId;
  late Classroom classroom;
  AddOrEditClassroomDialogController({
    dynamic argument,
  }) {
    if (argument is Classroom) {
      classroom = argument;
      isEditMode.value = true;
      classroomController.text = classroom.name;
    } else if (argument is int) {
      classroomId = argument;
    }
  }

  bool validateFields() {
    if (classroomController.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
          title: 'اسم شعبة فارغ', message: 'الرجاء ملء حقل اسم الشعبة');
      return false;
    }
    return true;
  }

  Future<void> addClassroom() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      //TODO:change dialog to accept max capacity
      Classroom classroom = Classroom(
          id: -1,
          name: classroomController.text,
          classId: classroomId,
          maxCapacity: 20);
      await ClassroomDBHelper.instance.insert(classroom);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  Future<void> updateClassroomInfo() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      classroom = classroom.copyWith(name: classroomController.text);
      await ClassroomDBHelper.instance.update(classroom);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
