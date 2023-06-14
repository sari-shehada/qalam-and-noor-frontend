import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/medicals_management_page/illnesses_management_subpage/controllers/illness_management_controller.dart';
import 'package:kalam_noor/pages/secretary/medicals_management_page/psychological_statuses_management_subpage/controllers/psychological_statuses_management_controller.dart';
import 'package:kalam_noor/pages/secretary/medicals_management_page/vaccines_management_subpage/controllers/vaccines_management_controller.dart';

class MedicalsManagementController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt currentIndex = 0.obs;
  late TabController tabController;
  late IllnessesManagementController illnessesManagementController;
  late VaccinesManagementController vaccinesManagementController;
  late PsychologicalStatusesManagementController
      psychologicalStatusesManagementController;
  MedicalsManagementController() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      currentIndex.value = tabController.index;
    });
    illnessesManagementController = Get.put(
      IllnessesManagementController(),
    );
    vaccinesManagementController = Get.put(
      VaccinesManagementController(),
    );
    psychologicalStatusesManagementController = Get.put(
      PsychologicalStatusesManagementController(),
    );
  }
}
