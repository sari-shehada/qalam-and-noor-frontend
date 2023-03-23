import 'package:get/get.dart';
import '../../../controllers/account_controller.dart';

import '../../../models/agendas/employee.dart';
import 'navigation_controller.dart';
import '../../dashboard/models/dashboard_destination_card.dart';

class NavigationBindings extends Bindings {
  final List<DashboardDestinationCard> dashboardDestinations;
  final Employee employee;
  @override
  void dependencies() {
    Get.put(
      NavigationController(dashboardDestinations: dashboardDestinations),
    );
    Get.put(
      AccountController(employee: employee),
    );
  }

  NavigationBindings(
      {required this.employee, required this.dashboardDestinations});
}
