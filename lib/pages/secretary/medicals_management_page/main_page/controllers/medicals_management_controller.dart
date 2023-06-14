import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../illnesses_management_subpage/controllers/illness_management_controller.dart';
import '../../psychological_statuses_management_subpage/controllers/psychological_statuses_management_controller.dart';
import '../../vaccines_management_subpage/controllers/vaccines_management_controller.dart';

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
