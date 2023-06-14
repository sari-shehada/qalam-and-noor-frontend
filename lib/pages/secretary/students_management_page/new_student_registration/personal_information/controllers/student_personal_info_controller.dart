import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/family_information/models/validation_text_field.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/personal_information/models/student_personal_info.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

import '../../../../../../models/enums.dart';
import '../../../../../../tools/ui_tools/buttons.dart';

class StudentPersonalInfoController extends GetxController {
  RxBool isMale = true.obs;
  ValidationTextField firstNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'يرجى ملء حقل الاسم الأول';
        }
        return null;
      });
  ValidationTextField placeOfBirthController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'يرجى ملء حقل مكان الولادة';
        }
        return null;
      });
  ValidationTextField incidentNumberController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'يرجى ملء حقل رقم الواقعة';
        }
        return null;
      });
  ValidationTextField publicRecordIdController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'يرجى ملء حقل رقم السجل العام';
        }
        return null;
      });
  ValidationTextField phoneNumberController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'يرجى ملء حقل رقم الهاتف';
        }
        if (controller.text.length != 10) {
          return 'رقم الهاتف لا يطابق البنية الصحيحة لأرقام الهواتف في سوريا';
        }
        return null;
      });
  ValidationTextField whatsappNumberController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'يرجى ملء حقل رقم الواتساب';
        }
        return null;
      });
  ValidationTextField landlineController = ValidationTextField(
    controller: TextEditingController(),
    validator: (controller) {
      if (controller.text.isEmpty) {
        return 'يرجى ملء حقل الهاتف الأرضي';
      }
      return null;
    },
  );

  Rx<DateTime?> dateOfBirth = Rx<DateTime?>(null);
  Rx<DateTime?> dateOfIncident = Rx<DateTime?>(null);
  Rx<DateTime?> joinDate = Rx<DateTime?>(null);

  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;
  Rx<Religion> religion = Religion.undefined.obs;

  //Methods
  void toggleGender() {
    isMale.value = !isMale.value;
  }

  void changeReligion(Religion? newReligion) {
    if (newReligion != null) religion.value = newReligion;
  }

  void changeDateOfBirth(DateTime? dateTime) {
    dateOfBirth.value = dateTime;
  }

  void changeDateOfIncident(DateTime? dateTime) {
    dateOfIncident.value = dateTime;
  }

  void changeJoinDate(DateTime? dateTime) {
    joinDate.value = dateTime;
  }

  bool validateFields() {
    if (publicRecordIdController.validate() &&
        firstNameController.validate() &&
        placeOfBirthController.validate() &&
        incidentNumberController.validate() &&
        phoneNumberController.validate() &&
        whatsappNumberController.validate() &&
        landlineController.validate()) {
      if (dateOfBirth.value == null) {
        SnackBarService.showErrorSnackBar(
          title: 'لم يتم تحديد تاريخ الميلاد',
          message: 'يرجى تحديد تاريخ ميلاد الطالب',
        );
        return false;
      }
      if (dateOfIncident.value == null) {
        SnackBarService.showErrorSnackBar(
          title: 'لم يتم تحديد تاريخ الواقعة',
          message: 'يرجى تحديد تاريخ الواقعة',
        );
        return false;
      }
      if (joinDate.value == null) {
        SnackBarService.showErrorSnackBar(
          title: 'لم يتم تحديد تاريخ الانضمام',
          message: 'يرجى تحديد تاريخ انضمام الطالب الى المدرسة',
        );
        return false;
      }
      return true;
    }
    return false;
  }

  StudentPersonalInfo encapsulateData() {
    return StudentPersonalInfo(
      publicRecordId: int.parse(publicRecordIdController.getValue()),
      firstName: firstNameController.getValue(),
      isMale: isMale.value,
      dateOfBirth: dateOfBirth.value!,
      placeOfBirth: placeOfBirthController.getValue(),
      phoneNumber: phoneNumberController.getValue(),
      religion: religion.value,
      whatsappPhoneNumber: whatsappNumberController.getValue(),
      incidentNumber: incidentNumberController.getValue(),
      incidentDate: dateOfIncident.value!,
      landLine: landlineController.getValue(),
      joinDate: joinDate.value!,
    );
  }
}
