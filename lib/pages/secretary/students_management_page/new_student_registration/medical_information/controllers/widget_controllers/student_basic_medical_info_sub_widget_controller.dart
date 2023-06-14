import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/medical_record.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/family_information/models/validation_text_field.dart';

class StudentBasicMedicalInfoSubWidgetController extends GetxController {
  final ValidationTextField studentHeightController = ValidationTextField(
    controller: TextEditingController(),
    validator: (controller) {
      if (controller.text.isEmpty) {
        return 'يرجى ملء حقل طول الطالب';
      }
      if (double.tryParse(controller.text) == null) {
        return 'بنية حقل طول الطالب غير صحيحة';
      }
      return null;
    },
  );
  final ValidationTextField studentWeightController = ValidationTextField(
    controller: TextEditingController(),
    validator: (controller) {
      if (controller.text.isEmpty) {
        return 'يرجى ملء حقل وزن الطالب';
      }
      if (double.tryParse(controller.text) == null) {
        return 'بنية حقل وزن الطالب غير صحيحة';
      }
      return null;
    },
  );

  MedicalRecord encapsulateFields() {
    if (validateFields()) {
      MedicalRecord medicalRecord = MedicalRecord(
          studentId: -1,
          studentHight: double.parse(studentHeightController.getValue()),
          studentWeight: double.parse(studentWeightController.getValue()));
      return medicalRecord;
    }
    throw Exception();
  }

  bool validateFields() {
    if (studentHeightController.validate() &&
        studentWeightController.validate()) {
      return true;
    }
    return false;
  }
}
