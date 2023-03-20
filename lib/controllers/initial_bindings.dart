import 'package:get/get.dart';
import 'account_controller.dart';
import '../models/employee.dart';

//TODO: You know what to do "wink wink"
class InitialBindings extends Bindings {
  final Employee employee;
  @override
  void dependencies() {
    Get.put(
      AccountController(employee: employee),
    );
  }

  InitialBindings({
    required this.employee,
  });
}
