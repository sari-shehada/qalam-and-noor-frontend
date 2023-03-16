import 'package:get/get.dart';
import 'package:kalam_noor/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:kalam_noor/pages/dashboard/models/dashboard_destination_card.dart';

class DashboardBindings extends Bindings {
  final List<DashboardDestinationCard> dashboardDestinations;
  @override
  void dependencies() {
    Get.put(
      DashboardController(dashboardDestinations: dashboardDestinations),
    );
  }

  DashboardBindings({required this.dashboardDestinations});
}
