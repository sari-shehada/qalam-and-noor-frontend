import 'package:get/get.dart';
import 'loader_controller.dart';

class LoaderBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoaderController());
  }
}
