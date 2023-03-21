import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../models/dashboard_destination_card.dart';

class DashboardController extends GetxController {
  RxDouble railWidth =
      DashboardControllerConstants.navigationRailCollapsedWidth.obs;
  RxInt selectedIndex = (0).obs;
  RxDouble elementsOpacity = 0.0.obs;
  final List<DashboardDestinationCard> dashboardDestinations;

  DashboardController({required this.dashboardDestinations});

  void expandContainer() {
    railWidth.value = DashboardControllerConstants.navigationRailExpandedWidth;
    elementsOpacity.value = 1;
  }

  void collapseContainer() {
    railWidth.value = DashboardControllerConstants.navigationRailCollapsedWidth;
    elementsOpacity.value = 0;
  }

  void switchToPage(int pageIndex) {
    selectedIndex.value = pageIndex;
  }
}

class DashboardControllerConstants {
  static double get navigationRailCollapsedWidth => 130.0.w;
  static double get navigationRailExpandedWidth => 346.0.w;
  static Duration get railAnimationDuration =>
      const Duration(milliseconds: 600);
}
