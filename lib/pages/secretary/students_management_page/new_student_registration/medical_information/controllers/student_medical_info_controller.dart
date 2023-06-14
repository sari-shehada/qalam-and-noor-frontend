import 'package:get/get.dart';
import '../models/medical_info.dart';
import '../views/dialogs/add_student_medical_info_dialog.dart';

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
