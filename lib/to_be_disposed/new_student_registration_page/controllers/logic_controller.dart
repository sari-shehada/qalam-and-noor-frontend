import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/enums.dart';
import '../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../tools/ui_tools/buttons.dart';

class RegisterNewStudentLogicController extends GetxController {
  RxBool isMale = true.obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController incidentNumberController = TextEditingController();
  TextEditingController publicRecordIdController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController whatsappNumberController = TextEditingController();
  TextEditingController landlineController = TextEditingController();

  Rx<DateTime?> dateOfBirth = Rx<DateTime?>(null);
  Rx<DateTime?> dateOfIncident = Rx<DateTime?>(null);
  Rx<DateTime?> joinDate = Rx<DateTime?>(null);

  Rx<CustomButtonStatus> registerButtonStatus = CustomButtonStatus.enabled.obs;
  Rx<Religion> religion = Religion.undefined.obs;

  Rx<int?> addressId = Rx<int?>(null);
  Rx<int?> medicalRecordId = Rx<int?>(null);
  Rx<int?> familyId = Rx<int?>(null);

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
    return true;
  }

  Future<void> registerStudent() async {
    if (validateFields()) {
      try {
        //TODO: Add registeration here

        registerButtonStatus.value = CustomButtonStatus.processing;
        await Future.delayed(
          Duration(milliseconds: 800),
        );
      } finally {
        registerButtonStatus.value = CustomButtonStatus.enabled;
      }
      Get.back();
      // resetForm();
      SnackbarService.showSuccessSnackBar(
        title: 'تمت العملية بنجاح',
        message: 'تم تسجيل طالب جديد',
      );
    }
  }
}
