import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';
import 'package:kalam_noor/models/employee.dart';
import 'package:kalam_noor/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:kalam_noor/pages/dashboard/models/dashboard_destination_card.dart';

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
