import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';
import 'loader_controller.dart';

class LoaderBindings extends Bindings {
  /// Add dependencies here on demand
  @override
  void dependencies() {
    Get.put(LoaderController());

    Get.put(
      AccountController(),
    );
  }
}
