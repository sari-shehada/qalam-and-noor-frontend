import 'package:get/get.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/models/medical_info.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/views/dialogs/add_student_medical_info_dialog.dart';

import '../../family_information/views/dialogs/add_student_family_info_dialog.dart';

class StudentMedicalInfoController extends GetxController {
  Rx<MedicalInfo?> medicalInfo = Rx<MedicalInfo?>(null);

  Future<void> addMedicalInfo() async {
    Get.dialog(const AddStudentMedicalInfoDialog());
  }
}
