import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';
import 'package:kalam_noor/models/agendas/employee.dart';
import 'package:kalam_noor/models/agendas/job_title.dart';

class TeacherDashboardControllerController extends GetxController {
  TeacherDashboardControllerController();

  late Employee teacher;
  late JobTitle jobTitle;

  @override
  void onInit() {
    teacher = Get.find<AccountController>().employee;
    jobTitle = Get.find<AccountController>().jobTitle;
    super.onInit();
  }
}
