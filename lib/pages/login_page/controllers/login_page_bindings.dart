import 'package:get/get.dart';

import 'login_page_controller.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageController());
  }
}
