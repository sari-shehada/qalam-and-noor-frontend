import 'package:get/get.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';

class LoginPageController extends GetxController {
  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
    NavigationController.toHomePage();
  }
}
