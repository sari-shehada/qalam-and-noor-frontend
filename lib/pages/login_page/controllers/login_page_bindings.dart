import 'package:get/get.dart';
import 'package:kalam_noor/pages/login_page/controllers/login_page_controller.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageController());
  }
}
