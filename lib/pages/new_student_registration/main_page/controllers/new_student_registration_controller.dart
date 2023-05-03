import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/student_db_helper.dart';
import 'package:kalam_noor/pages/new_student_registration/address_information/controllers/student_address_info_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/enrolled_class_information/controllers/student_enrolled_class_info_widget_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/controllers/student_family_info_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/controllers/student_medical_info_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/controllers/student_personal_info_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/models/student_registration_info.dart';
import 'package:kalam_noor/pages/new_student_registration/previous_school_information/controllers/add_student_previous_school_info_widget_controller.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
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
      if (!Get.find<StudentPersonalInfoController>().validateFields() ||
          !Get.find<StudentEnrolledClassInfoController>().validateFields()) {
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
        studentPreviousSchool:
            Get.find<StudentPreviousSchoolInfoController>().encapsulateData(),
        enrolledClass:
            Get.find<StudentEnrolledClassInfoController>().enrolledClass.value!,
      );
      await StudentDBHelper.instance
          .registerNewStudent(registrationInfo: registrationInfo);
      Get.back(result: true);
    } catch (e) {
      log(e.toString());
      SnackBarService.showErrorSnackBar(
        title: 'حدث خطأ',
        message: e.toString(),
      );
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
