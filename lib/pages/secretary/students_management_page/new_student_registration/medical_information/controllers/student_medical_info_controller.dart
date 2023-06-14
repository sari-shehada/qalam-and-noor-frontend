import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/medical_information/models/medical_info.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/medical_information/views/dialogs/add_student_medical_info_dialog.dart';

class StudentMedicalInfoController extends GetxController {
  Rx<MedicalInfo?> medicalInfo = Rx<MedicalInfo?>(null);

  Future<void> addMedicalInfo() async {
    var result = await Get.dialog(const AddStudentMedicalInfoDialog());
    if (result is MedicalInfo) {
      medicalInfo.value = result;
      medicalInfo.refresh();
    }
  }
}
