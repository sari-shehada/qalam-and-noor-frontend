import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/models/validation_text_field.dart';

import '../../../../../models/agendas/mother.dart';
import '../../../../../models/enums.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../dialog_controllers/add_student_family_info_dialog_controller.dart';

class StudentMotherInfoSubWidgetController extends GetxController {
  final ValidationTextField firstNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          //TODO:
          return 'الرجاء ملئ حقل ...';
        }
        return null;
      });
  final ValidationTextField lastNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          //TODO:
          return 'الرجاء ملئ حقل ...';
        }
        return null;
      });
  final ValidationTextField fatherNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          //TODO:
          return 'الرجاء ملئ حقل ...';
        }
        return null;
      });
  final ValidationTextField motherNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          //TODO:
          return 'الرجاء ملئ حقل ...';
        }
        return null;
      });
  final ValidationTextField careerController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          //TODO:
          return 'الرجاء ملئ حقل ...';
        }
        return null;
      });
  final ValidationTextField tieNumberController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          //TODO:
          return 'الرجاء ملئ حقل ...';
        }
        return null;
      });
  final ValidationTextField tiePlaceController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          //TODO:
          return 'الرجاء ملئ حقل ...';
        }
        return null;
      });
  final ValidationTextField placeOfBirthController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          //TODO:
          return 'الرجاء ملئ حقل ...';
        }
        return null;
      });
  final ValidationTextField phoneNumberController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          //TODO:
          return 'الرجاء ملئ حقل ...';
        }
        if (controller.text.length != 10) {
          return 'رقم الهاتف لا يطابق البنية الصحيحة لأرقام الهواتف في سوريا';
        }
        return null;
      });

  RxBool doesLiveWithHusband = true.obs;
  Rx<DateTime?> dateOfBirth = Rx<DateTime?>(null);
  Rx<Religion> religion = Religion.undefined.obs;
  Rx<EducationalStatus> educationalStatus = EducationalStatus.none.obs;

  void changeReligion(Religion? newReligion) {
    if (newReligion != null) religion.value = newReligion;
  }

  void changeEducationalStatus(EducationalStatus? newEducationalStatus) {
    if (newEducationalStatus != null) {
      educationalStatus.value = newEducationalStatus;
    }
  }

  void changeDateOfBirth(DateTime? dateTime) {
    dateOfBirth.value = dateTime;
  }

  void toggleLivesWithHusband() {
    doesLiveWithHusband.value = !doesLiveWithHusband.value;
  }

  bool validateFields() {
    if (firstNameController.validate() &&
        lastNameController.validate() &&
        fatherNameController.validate() &&
        motherNameController.validate() &&
        careerController.validate() &&
        tieNumberController.validate() &&
        tiePlaceController.validate() &&
        placeOfBirthController.validate() &&
        phoneNumberController.validate()) {
      if (dateOfBirth.value == null) {
        SnackBarService.showErrorSnackBar(
          title: 'مدخلات فارغة',
          message: 'الرجاء إدخال تاريخ الميلاد',
        );
        return false;
      }
      return true;
    }
    return false;
  }

  Mother encapsulateObject() {
    return Mother(
      id: -1,
      firstName: firstNameController.getValue(),
      lastName: lastNameController.getValue(),
      fatherName: fatherNameController.getValue(),
      motherName: motherNameController.getValue(),
      doesLiveWithHasband: doesLiveWithHusband.value,
      career: careerController.getValue(),
      tieNumber: tieNumberController.getValue(),
      tiePlace: tiePlaceController.getValue(),
      placeOfBirth: placeOfBirthController.getValue(),
      dateOfBirth: dateOfBirth.value!,
      religion: religion.value,
      educationalStatus: educationalStatus.value,
      phoneNumber: phoneNumberController.getValue(),
    );
  }

  void toNextPage() {
    if (validateFields() == true) {
      Get.find<AddStudentFamilyInfoDialogController>().toNextPage();
    }
  }

  void toPreviousPage() {
    if (validateFields() == true) {
      Get.find<AddStudentFamilyInfoDialogController>().toPreviousPage();
    }
  }
}
