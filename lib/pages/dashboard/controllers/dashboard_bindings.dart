import 'package:get/get.dart';
import '../../../controllers/account_controller.dart';
import '../../../models/employee.dart';
import 'dashboard_controller.dart';
import '../models/dashboard_destination_card.dart';

class DashboardBindings extends Bindings {
  final List<DashboardDestinationCard> dashboardDestinations;
  final Employee employee;
  @override
  void dependencies() {
    Get.put(
      DashboardController(dashboardDestinations: dashboardDestinations),
    );
    Get.put(
      AccountController(employee: employee),
    );
  }

  DashboardBindings(
      {required this.employee, required this.dashboardDestinations});
}
