import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/models/student_personal_info.dart';

import '../../../../models/enums.dart';
import '../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../tools/ui_tools/buttons.dart';

class StudentPersonalInfoController extends GetxController {
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

  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;
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
    //TODO: Add validation here
    return true;
  }

  StudentPersonalInfo encapsulateData() {
    return StudentPersonalInfo(
      publicRecordId: int.parse(publicRecordIdController.text),
      firstName: firstNameController.text,
      isMale: isMale.value,
      dateOfBirth: dateOfBirth.value!,
      placeOfBirth: placeOfBirthController.text,
      phoneNumber: phoneNumberController.text,
      religion: religion.value,
      whatsappNumber: whatsappNumberController.text,
      incidentNumber: int.parse(incidentNumberController.text),
      dateOfIncident: dateOfIncident.value!,
      landline: landlineController.text,
      joinDate: joinDate.value!,
    );
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
