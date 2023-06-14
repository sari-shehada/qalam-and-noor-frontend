import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

import '../views/dialogs/add_student_enrolled_class_info_dialog.dart';

class StudentEnrolledClassInfoController extends GetxController {
  Rx<SchoolClass?> enrolledClass = Rx<SchoolClass?>(null);

  Future<void> selectEnrolledClass() async {
    var result = await Get.dialog(const AddStudentEnrolledClassInfoDialog());
    if (result is SchoolClass) {
      enrolledClass.value = result;
      enrolledClass.refresh();
    }
  }

  bool validateFields() {
    if (enrolledClass.value == null) {
      SnackBarService.showErrorSnackBar(
          title: 'لم يتم اختيار صف للطالب',
          message: 'يرجى اختيار الصف الذي سينتسب اليه الطالب');
      return false;
    }
    return true;
  }
}
