import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/agendas/father.dart';
import '../../../../../models/enums.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../models/validation_text_field.dart';
import '../dialog_controllers/add_student_family_info_dialog_controller.dart';

class StudentFatherInfoSubWidgetController extends GetxController {
  final ValidationTextField firstNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل الاسم الأول';
        }
        return null;
      });
  final ValidationTextField lastNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل اللقب';
        }
        return null;
      });
  final ValidationTextField fatherNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل اسم الأب';
        }
        return null;
      });
  final ValidationTextField motherNameController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل اسم الأم';
        }
        return null;
      });
  final ValidationTextField careerController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل المهنة';
        }
        return null;
      });
  final ValidationTextField placeOfResidenceController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل مكان الإقامة';
        }
        return null;
      });
  final ValidationTextField tieNumberController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل رقم القيد';
        }
        return null;
      });
  final ValidationTextField tiePlaceController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل مكان القيد';
        }
        return null;
      });
  final ValidationTextField placeOfBirthController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل مكان الولادة';
        }
        return null;
      });
  final ValidationTextField civilRegisterSecretaryController =
      ValidationTextField(
          controller: TextEditingController(),
          validator: (controller) {
            if (controller.text.isEmpty) {
              return 'الرجاء ملئ حقل امانة السجل المدني';
            }
            return null;
          });
  final ValidationTextField phoneNumberController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل رقم الهاتف';
        }
        // if (controller.text.length != 10) {
        //   return 'رقم الهاتف لا يطابق البنية الصحيحة لأرقام الهواتف في سوريا';
        // }
        return null;
      });
  final ValidationTextField permanentAddressController = ValidationTextField(
      controller: TextEditingController(),
      validator: (controller) {
        if (controller.text.isEmpty) {
          return 'الرجاء ملئ حقل العنوان الدائم';
        }
        return null;
      });

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

  Father encapsulateObject() {
    return Father(
      id: -1,
      firstName: firstNameController.getValue(),
      lastName: lastNameController.getValue(),
      fatherName: fatherNameController.getValue(),
      motherName: motherNameController.getValue(),
      career: careerController.getValue(),
      placeOfResidence: placeOfResidenceController.getValue(),
      tieNumber: tieNumberController.getValue(),
      tiePlace: tiePlaceController.getValue(),
      placeOfBirth: placeOfBirthController.getValue(),
      dateOfBirth: dateOfBirth.value!,
      civilRegisterSecretary: civilRegisterSecretaryController.getValue(),
      religion: religion.value,
      educationalStatus: educationalStatus.value,
      phoneNumber: phoneNumberController.getValue(),
      permenantAddress: permanentAddressController.getValue(),
    );
  }

  void changeDateOfBirth(DateTime? dateTime) {
    dateOfBirth.value = dateTime;
  }

  bool validateFields() {
    //TODO: Add Validation Here
    if (firstNameController.validate() &&
        lastNameController.validate() &&
        fatherNameController.validate() &&
        motherNameController.validate() &&
        careerController.validate() &&
        placeOfResidenceController.validate() &&
        tieNumberController.validate() &&
        tiePlaceController.validate() &&
        placeOfBirthController.validate() &&
        civilRegisterSecretaryController.validate() &&
        phoneNumberController.validate() &&
        permanentAddressController.validate()) {
      if (dateOfBirth.value == null) {
        SnackBarService.showErrorSnackBar(
          title: 'مدخلات فارغة',
          message: 'الرجاء إدخال تاريخ ميلاد الأب',
        );
        return false;
      }
      return true;
    }
    return false;
  }

  void toNextPage() {
    if (validateFields() == true) {
      Get.find<AddStudentFamilyInfoDialogController>().toNextPage();
    }
  }
}
