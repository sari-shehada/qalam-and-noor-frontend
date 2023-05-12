import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/employees_db_helper.dart';
import 'package:kalam_noor/pages/employees_management_page/add_employee_page/controllers/widget_controllers/employee_registration_form_controller.dart';
import 'package:kalam_noor/pages/employees_management_page/add_employee_page/models/employee_registration_section.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

class AddEmployeeController extends GetxController {
  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;
  final ScrollController scrollController = ScrollController();
  late EmployeeRegistrationFormController formController;
  final List<EmployeeRegistrationSection> sections =
      _AddEmployeeControllerConstants.sections;
  @override
  void onInit() {
    formController = Get.put(EmployeeRegistrationFormController());
    super.onInit();
    scrollController.addListener(
      () {
        refreshSectionLabel();
      },
    );
  }

  void animateToSection(EmployeeRegistrationSection section) {
    scrollController.animateTo(
      section.beginOffset,
      duration: 600.milliseconds,
      curve: Curves.linearToEaseOut,
    );
  }

  void refreshSectionLabel() {
    print('ScrollController Offset: ${scrollController.offset}');
    for (int i = sections.length - 1; i >= 0; i--) {
      print('Inside for loop with index $i');
      if (scrollController.offset >= sections[i].beginOffset) {
        print('Made it across the if statement with index $i');
        changeSectionBasedOnIndex(i);
        return;
      }
    }
  }

  void changeSectionBasedOnIndex(int index) {
    print('Changing with index: $index');
    if (index == 0) {
      sections[index + 1].isCurrentOffset.value = false;
      markCurrentOffset(index);
    } else if (index == sections.length - 1) {
      sections[index - 1].isCurrentOffset.value = false;
      markCurrentOffset(index);
    } else {
      sections[index - 1].isCurrentOffset.value = false;
      sections[index + 1].isCurrentOffset.value = false;
      markCurrentOffset(index);
    }
  }

  markCurrentOffset(int index) {
    print('Marking Offset: $index');
    sections[index].isCurrentOffset.value = true;
  }

  void addEmployee() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (!formController.validateFields()) {
        return;
      }
      await EmployeesDBHelper.instance.insert(
        formController.encapsulateFields(),
      );
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}

abstract class _AddEmployeeControllerConstants {
  static final List<EmployeeRegistrationSection> sections = [
    EmployeeRegistrationSection(
      sectionName: 'المعلومات الشخصية',
      beginOffset: 0,
      isCurrentOffset: true.obs,
    ),
    EmployeeRegistrationSection(
      sectionName: 'المعلومات الأسرية',
      beginOffset: 324,
      isCurrentOffset: false.obs,
    ),
    EmployeeRegistrationSection(
      sectionName: 'معلومات التواصل',
      beginOffset: 545,
      isCurrentOffset: false.obs,
    ),
    EmployeeRegistrationSection(
      sectionName: 'الشؤون الوظيفية',
      beginOffset: 762,
      isCurrentOffset: false.obs,
    ),
    EmployeeRegistrationSection(
      sectionName: 'معلومات أخرى',
      beginOffset: 920,
      isCurrentOffset: false.obs,
    ),
  ];
}
