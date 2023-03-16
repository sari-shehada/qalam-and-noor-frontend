import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';
import 'package:kalam_noor/models/employee.dart';

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
