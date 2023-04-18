import 'package:get/get.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/controllers/student_family_info_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/main_page/controllers/new_student_registration_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/controllers/student_medical_info_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/controllers/student_personal_info_controller.dart';

class NewStudentRegistrationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NewStudentRegistrationController());
    Get.put(StudentPersonalInfoController());
    Get.put(StudentFamilyInfoController());
    Get.put(StudentMedicalInfoController());
  }
}
