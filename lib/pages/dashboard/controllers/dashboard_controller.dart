import 'package:get/get.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';

class DashboardController extends GetxController {
  Future<void> registerNewStudent() async {
    NavigationController.toAddNewStudentPage();
  }
}
