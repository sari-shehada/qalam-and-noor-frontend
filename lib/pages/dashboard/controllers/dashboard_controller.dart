import 'package:get/get.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';

import '../../../models/helpers/database_helpers/students_db_helper.dart';

class DashboardController extends GetxController {
  Rx<int?> studentsCount = Rx<int?>(null);
  Rx<DateTime?> serverTime = Rx<DateTime?>(null);
  Future<void> registerNewStudent() async {
    NavigationController.toAddNewStudentPage();
  }

  DashboardController() {
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    studentsCount.value = await StudentsDBHelper.instance.getStudentsCount();
    serverTime.value = DateTime.now();
  }
}
