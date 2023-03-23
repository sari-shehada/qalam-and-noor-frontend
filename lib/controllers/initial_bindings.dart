import 'package:get/get.dart';
import '../models/agendas/employee.dart';
import 'account_controller.dart';

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
