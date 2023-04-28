import 'package:get/get.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';
import 'package:kalam_noor/models/helpers/database_helpers/student_db_helper.dart';

class DashboardController extends GetxController {
  late final Rx<Future<int>> studentCount;
  Future<void> registerNewStudent() async {
    NavigationController.toAddNewStudentPage();
  }

  DashboardController() {
    studentCount = StudentDBHelper.instance.getStudentsCount().obs;
  }
}
