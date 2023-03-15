import 'package:get/get.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';

class LoaderController extends GetxController {
  Future<void> loadApplication() async {
    await Future.delayed(const Duration(seconds: 1));
    NavigationController.toLoginPage();
  }
}
