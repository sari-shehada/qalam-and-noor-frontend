import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

class NewStudentRegistrationController extends GetxController {
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

  Rx<CallToActionButtonStatus> buttonStatus =
      CallToActionButtonStatus.enabled.obs;
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

        buttonStatus.value = CallToActionButtonStatus.processing;
        await Future.delayed(
          Duration(milliseconds: 800),
        );
      } finally {
        buttonStatus.value = CallToActionButtonStatus.enabled;
      }
      resetForm();
      SnackbarService.showSuccessSnackBar(
        title: 'تمت العملية بنجاح',
        message: 'تم تسجيل طالب جديد',
      );
    }
  }

  void resetForm() {
    isMale.value = true;
    firstNameController.text = '';
    placeOfBirthController.text = '';
    incidentNumberController.text = '';
    publicRecordIdController.text = '';
    phoneNumberController.text = '';
    whatsappNumberController.text = '';
    landlineController.text = '';

    dateOfBirth.value = null;
    dateOfIncident.value = null;
    joinDate.value = null;

    religion.value = Religion.undefined;

    addressId.value = null;
    medicalRecordId.value = null;
    familyId.value = null;
  }
}
