// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/illness.dart';
import 'package:kalam_noor/models/medical/medical_record.dart';
import 'package:kalam_noor/models/medical/taken_vaccine.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/medical_information/controllers/widget_controllers/student_basic_medical_info_sub_widget_controller.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/medical_information/controllers/widget_controllers/student_illnesses_info_sub_widget_controller.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/medical_information/controllers/widget_controllers/student_vaccines_info_sub_widget_controller.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/medical_information/models/medical_info.dart';

class AddStudentMedicalInfoDialogController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt pageIndex = 0.obs;
  RxDouble dialogHeight =
      AddStudentMedicalInfoConstants.dialogInitialHeight.obs;
  final List<String> sections = [
    'المعلومات الأساسية',
    'الأمراض',
    'الللقاحات',
    // 'الحالات المزاجية',
  ];
  late final TabController tabController;
  AddStudentMedicalInfoDialogController() {
    tabController = TabController(length: sections.length, vsync: this);
  }

  void nextPage() async {
    switch (pageIndex.value) {
      case 0:
        {
          if (!Get.find<StudentBasicMedicalInfoSubWidgetController>()
              .validateFields()) {
            return;
          }
          break;
        }
      // case 1:
      //   {
      //     if (!Get.find<StudentIllnessesInfoSubWidgetController>()
      //         .validateFields()) {
      //       return;
      //     }
      //     break;
      //   }
      // case 2:
      //   {
      //     if (!Get.find<StudentIllnessesInfoSubWidgetController>()
      //         .validateFields()) {
      //       return;
      //     }
      //     break;
      //   }
    }
    if (pageIndex < sections.length - 1) {
      pageIndex.value++;
      tabController.animateTo(pageIndex.value);
      if (pageIndex.value > 0) {
        dialogHeight.value =
            AddStudentMedicalInfoConstants.dialogExtendedHeight;
      } else {
        dialogHeight.value = AddStudentMedicalInfoConstants.dialogInitialHeight;
      }
    }
    if (pageIndex.value == sections.length - 1) {
      final MedicalRecord studentMedicalRecord =
          Get.find<StudentBasicMedicalInfoSubWidgetController>()
              .encapsulateFields();
      final List<Illness> studentIllnesses =
          Get.find<StudentIllnessesInfoSubWidgetController>().selectedIllnesses;
      final List<TakenVaccine> studentTakenVaccines =
          Get.find<StudentVaccinesInfoSubWidgetController>()
              .returnTakenVaccines();
      Get.back(
        result: MedicalInfo(
          record: studentMedicalRecord,
          illnesses: studentIllnesses,
          takenVaccines: studentTakenVaccines,
        ),
      );
    }
  }

  void previousPage() {
    if (pageIndex.value == 0) {
      Get.back();
      return;
    }
    if (pageIndex.value > 0) {
      pageIndex.value--;
      tabController.animateTo(pageIndex.value);
      if (pageIndex.value == 0) {
        dialogHeight.value = AddStudentMedicalInfoConstants.dialogInitialHeight;
      }
    }
  }
}

class AddStudentMedicalInfoConstants {
  static double get dialogInitialHeight => 500.h;
  static double get dialogExtendedHeight => 900.h;
}
