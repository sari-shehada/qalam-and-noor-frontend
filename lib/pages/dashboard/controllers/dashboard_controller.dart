import 'package:get/get.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';

import '../../../models/helpers/database_helpers/students_db_helper.dart';

class DashboardController extends GetxController {
  late final Rx<Future<int>> studentCount;
  Future<void> registerNewStudent() async {
    NavigationController.toAddNewStudentPage();
  }

  DashboardController() {
    studentCount = StudentsDBHelper.instance.getStudentsCount().obs;
  }
}
