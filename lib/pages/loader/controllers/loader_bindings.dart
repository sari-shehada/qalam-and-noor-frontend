import 'package:get/get.dart';
import 'package:kalam_noor/pages/loader/controllers/loader_controller.dart';

class LoaderBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoaderController());
  }
}
