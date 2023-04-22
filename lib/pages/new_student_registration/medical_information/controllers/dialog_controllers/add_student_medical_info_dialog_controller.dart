// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddStudentMedicalInfoDialogController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt pageIndex = 0.obs;
  RxDouble dialogHeight =
      AddStudentMedicalInfoConstants.dialogInitialHeight.obs;
  final List<String> sections = [
    'المعلومات الأساسية',
    'الأمراض',
    'الللقاحات',
    'الحالات المزاجية',
  ];
  late final TabController tabController;
  AddStudentMedicalInfoDialogController() {
    tabController = TabController(length: sections.length, vsync: this);
  }

  void nextPage() async {
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
      //TODO: Finalize
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
