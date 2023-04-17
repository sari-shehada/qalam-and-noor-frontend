import 'package:get/get.dart';

import '../../../to_be_disposed/new_student_registration_page/views/main_view.dart';

class DashboardController extends GetxController {
  Future<void> registerNewStudent() async {
    await Get.dialog(
      const RegisterNewStudentDialog(),
      barrierDismissible: false,
    );
  }
}
