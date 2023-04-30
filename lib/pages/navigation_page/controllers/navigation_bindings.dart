import 'package:get/get.dart';
import 'package:kalam_noor/pages/dashboard/controllers/dashboard_controller.dart';

import '../../../controllers/account_controller.dart';
import '../../dashboard/models/navigation_rail_destination_card.dart';
import 'navigation_page_controller.dart';

class NavigationBindings extends Bindings {
  final List<NavigationRailDestinationCard> railDestinations;
  @override
  void dependencies() {
    Get.put(
      NavigationPageController(dashboardDestinations: railDestinations),
    );
    Get.put(AccountController());
    Get.put(DashboardController());
  }

  NavigationBindings({required this.railDestinations});
}
