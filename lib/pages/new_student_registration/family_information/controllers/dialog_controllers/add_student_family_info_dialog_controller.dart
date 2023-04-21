import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentFamilyInfoDialogController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt pageIndex = 0.obs;
  late final TabController tabController;
  List<String> sections = [
    'معلومات الأب',
    'معلومات الأم',
    'معلومات ولي الأمر (اختياري)'
  ];

  AddStudentFamilyInfoDialogController() {
    tabController = TabController(length: 3, vsync: this);
  }

  void toNextPage() {
    if (pageIndex.value < sections.length - 1) {
      pageIndex.value++;
      tabController.animateTo(pageIndex.value);
    }
  }

  void toPreviousPage() {
    if (pageIndex.value > 0) {
      pageIndex.value--;
      tabController.animateTo(pageIndex.value);
    }
  }
}
