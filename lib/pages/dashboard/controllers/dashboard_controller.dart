import 'package:get/get.dart';

import '../../reg_stu/views/main_view.dart';

class DashboardController extends GetxController {
  Future<void> registerNewStudent() async {
    await Get.dialog(
      const RegisterNewStudentDialog(),
      barrierDismissible: false,
    );
  }
}
