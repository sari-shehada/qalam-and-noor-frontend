import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
