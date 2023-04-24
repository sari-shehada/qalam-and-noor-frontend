import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/class.dart';
import 'package:kalam_noor/models/helpers/database_helpers/student_db_helper.dart';
import 'package:kalam_noor/pages/new_student_registration/address_information/controllers/student_address_info_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/controllers/student_family_info_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/controllers/student_medical_info_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/controllers/student_personal_info_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/models/student_registration_info.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

class NewStudentRegistrationController extends GetxController {
  //Section Validity Status Indicators
  Rx<NewStudentRegistrationSectionStatus> personalInfoSectionStatus =
      NewStudentRegistrationSectionStatus.neutral.obs;
  Rx<NewStudentRegistrationSectionStatus> familyInfoSectionStatus =
      NewStudentRegistrationSectionStatus.neutral.obs;
  Rx<NewStudentRegistrationSectionStatus> medicalInfoSectionStatus =
      NewStudentRegistrationSectionStatus.neutral.obs;
  Rx<NewStudentRegistrationSectionStatus> addressInfoSectionStatus =
      NewStudentRegistrationSectionStatus.neutral.obs;
  Rx<NewStudentRegistrationSectionStatus> previousSchoolInfoSectionStatus =
      NewStudentRegistrationSectionStatus.neutral.obs;
  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;

  //Section Decoration Methods
  Color getSectionStatusColor(NewStudentRegistrationSectionStatus status) {
    switch (status) {
      case NewStudentRegistrationSectionStatus.neutral:
        return NewStudentRegistrationControllerConstants
            .neutralSectionBackgroundColor;

      case NewStudentRegistrationSectionStatus.hasError:
        return NewStudentRegistrationControllerConstants
            .errorSectionBackgroundColor;
      case NewStudentRegistrationSectionStatus.valid:
        return NewStudentRegistrationControllerConstants
            .validSectionBackgroundColor;
    }
  }

  Future<void> registerStudent() async {
    buttonStatus.value = CustomButtonStatus.processing;
    try {
      if (!Get.find<StudentPersonalInfoController>().validateFields()) {
        return;
      }
      final StudentRegistrationInfo registrationInfo = StudentRegistrationInfo(
        personalInfo:
            Get.find<StudentPersonalInfoController>().encapsulateData(),
        familyInfo: Get.find<StudentFamilyInfoController>().familyInfo.value!,
        medicalInfo:
            Get.find<StudentMedicalInfoController>().medicalInfo.value!,
        address:
            Get.find<StudentAddressInfoController>().addressInfo.value!.address,
        //TODO:
        enrolledClass: Class(id: -1, name: 'First Class'),
      );
      await StudentDBHelper.registerNewStudent(
          registrationInfo: registrationInfo);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}

class NewStudentRegistrationControllerConstants {
  //TODO: Tweek these colors
  static Color get validSectionBackgroundColor => Colors.green.shade100;
  static Color get errorSectionBackgroundColor => Colors.red.shade100;
  static Color get neutralSectionBackgroundColor => Colors.white;

  static Duration get animationDuration => const Duration(milliseconds: 600);
  static Curve get animationCurve => Curves.fastLinearToSlowEaseIn;
}

enum NewStudentRegistrationSectionStatus { neutral, hasError, valid }
