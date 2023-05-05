import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/illnesses_management_page/controllers/illness_management_controller.dart';
import 'package:kalam_noor/pages/psychological_statuses_management_page/controllers/psychological_statuses_management_controller.dart';
import 'package:kalam_noor/pages/vaccines_management_page/controllers/vaccines_management_controller.dart';

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
