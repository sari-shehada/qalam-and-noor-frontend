import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../models/educational/classroom.dart';
import '../../../../../../models/helpers/database_helpers/classrooms_db_helper.dart';
import '../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../../tools/ui_tools/buttons.dart';

class AddOrEditClassroomDialogController extends GetxController {
  RxBool isEditMode = false.obs;
  final TextEditingController classroomController = TextEditingController();
  final TextEditingController maxCapacityController =
      TextEditingController(text: 20.toString());
  final Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;
  final RxDouble maxCapacity = 20.0.obs;

  late final int classroomId;
  late Classroom classroom;
  AddOrEditClassroomDialogController({
    dynamic argument,
  }) {
    if (argument is Classroom) {
      classroom = argument;
      isEditMode.value = true;
      classroomController.text = classroom.name;
      changeMaxCapacity(argument.maxCapacity.toDouble());
    } else if (argument is int) {
      classroomId = argument;
    }
    maxCapacityController.addListener(
      () {
        double value = double.parse(maxCapacityController.text);
        if (value > 100) {
          value = 100;
        }
        if (value < 10) {
          value = 10;
        }
        maxCapacity.value = value;
      },
    );
  }

  bool validateFields() {
    if (classroomController.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
        title: 'اسم شعبة فارغ',
        message: 'الرجاء ملء حقل اسم الشعبة',
      );
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
      Classroom classroom = Classroom(
        id: -1,
        name: classroomController.text,
        classId: classroomId,
        maxCapacity: maxCapacity.value.toInt(),
      );
      await ClassroomDBHelper.instance.insert(classroom);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  void changeMaxCapacity(double value) {
    maxCapacityController.text = value.toString();
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
