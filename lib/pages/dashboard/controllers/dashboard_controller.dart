import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/dashboard_destination_card.dart';

class DashboardController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  RxDouble railWidth =
      DashboardControllerConstants.navigationRailCollapsedWidth.obs;
  RxInt selectedIndex = (-1).obs;
  final List<DashboardDestinationCard> dashboardDestinations;

  DashboardController({required this.dashboardDestinations});

  void animateToDestination(int pageIndex) {
    pageController.animateToPage((pageIndex + 1),
        duration:
            DashboardControllerConstants.pageViewControllerAnimationDuration,
        curve: Curves.linearToEaseOut);
    selectedIndex.value = pageIndex;
    if (pageIndex == -1) {
      railWidth.value =
          DashboardControllerConstants.navigationRailCollapsedWidth;
      return;
    }
    railWidth.value = DashboardControllerConstants.navigationRailExpandedWidth;
    return;
  }
}

class DashboardControllerConstants {
  static double get navigationRailCollapsedWidth => 80.0;
  static double get navigationRailExpandedWidth => 260.0;
  static Duration get pageViewControllerAnimationDuration =>
      const Duration(milliseconds: 600);
}
