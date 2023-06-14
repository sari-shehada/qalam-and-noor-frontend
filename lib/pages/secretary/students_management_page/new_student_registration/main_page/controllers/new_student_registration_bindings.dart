import 'package:get/get.dart';
import '../../enrolled_class_information/controllers/student_enrolled_class_info_widget_controller.dart';
import '../../family_information/controllers/student_family_info_controller.dart';
import 'new_student_registration_controller.dart';
import '../../medical_information/controllers/student_medical_info_controller.dart';
import '../../personal_information/controllers/student_personal_info_controller.dart';

import '../../previous_school_information/controllers/add_student_previous_school_info_widget_controller.dart';

class NewStudentRegistrationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NewStudentRegistrationController());
    Get.put(StudentPersonalInfoController());
    Get.put(StudentFamilyInfoController());
    Get.put(StudentMedicalInfoController());
    Get.put(StudentPreviousSchoolInfoController());
    Get.put(StudentEnrolledClassInfoController());
  }
}
