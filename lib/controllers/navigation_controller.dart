import 'package:get/get.dart';
import 'package:kalam_noor/pages/home_page/views/home_page.dart';
import 'package:kalam_noor/pages/login_page/views/login_page.dart';

import '../pages/login_page/controllers/login_page_bindings.dart';

class NavigationController {
  static void toLoginPage() {
    Get.offAll(() => const LoginPage(), binding: LoginPageBindings());
  }

  static void toHomePage() {
    Get.offAll(
      () => const HomePage(),
    );
  }
}
