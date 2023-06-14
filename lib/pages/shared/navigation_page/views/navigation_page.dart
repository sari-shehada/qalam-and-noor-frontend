import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/navigation_page_controller.dart';
import 'widgets/cross_switcher.dart';
import 'widgets/navigation_rail.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationPageController navigationController = Get.find();
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right:
                    DashboardControllerConstants.navigationRailCollapsedWidth,
              ),
              child: Obx(
                () {
                  return FadeIndexedStack(
                    duration: 600.milliseconds,
                    index: navigationController.selectedIndex.value,
                    children: List.generate(
                      navigationController.dashboardDestinations.length,
                      (index) => navigationController
                          .dashboardDestinations[index].destination,
                    ),
                  );
                },
              ),
            ),
            const CustomNavigationRail(),
            const VerticalDivider(
              thickness: 1,
              width: 2,
            ),
          ],
        ),
      ),
    );
  }
}
