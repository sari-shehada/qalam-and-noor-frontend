import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:kalam_noor/pages/dashboard/models/dashboard_destination_card.dart';
import 'package:kalam_noor/pages/dashboard/views/dashboard_content_page.dart';
import 'package:kalam_noor/pages/dashboard/views/widgets/dashboard_rail_card.dart';
import 'package:kalam_noor/pages/settings/views/settings_page.dart';

import '../../../tools/ui_tools/ui_tools.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    return Scaffold(
      body: Row(
        children: [
          Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.linearToEaseOut,
              width: dashboardController.railWidth.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    dashboardController.railWidth.value ==
                            DashboardControllerConstants
                                .navigationRailExpandedWidth
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: DashboardExpandedRailCard(
                              dashboardDestinationCard:
                                  DashboardDestinationCard(
                                title: 'لوحة التحكم',
                                iconData: FontAwesomeIcons.house,
                                description: '',
                                destination: const DashboardContentPage(),
                              ),
                              isSelected: false,
                              onTap: () =>
                                  dashboardController.animateToDestination(-1),
                            ),
                          )
                        : DashboardCollapsedRailCard(
                            dashboardDestinationCard: DashboardDestinationCard(
                              title: 'لوحة التحكم',
                              iconData: FontAwesomeIcons.house,
                              description: '',
                              destination: const DashboardContentPage(),
                            ),
                            isSelected: true,
                            onTap: () =>
                                dashboardController.animateToDestination(-1),
                          ),
                    const AddVerticalSpacing(value: 20),
                    Column(
                      children: List.generate(
                          dashboardController.dashboardDestinations.length,
                          (index) {
                        if (dashboardController.railWidth.value ==
                            DashboardControllerConstants
                                .navigationRailCollapsedWidth) {
                          return DashboardCollapsedRailCard(
                            dashboardDestinationCard: dashboardController
                                .dashboardDestinations[index],
                            isSelected:
                                dashboardController.selectedIndex.value ==
                                    index,
                            onTap: () =>
                                dashboardController.animateToDestination(index),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: DashboardExpandedRailCard(
                            dashboardDestinationCard: dashboardController
                                .dashboardDestinations[index],
                            isSelected:
                                dashboardController.selectedIndex.value ==
                                    index,
                            onTap: () =>
                                dashboardController.animateToDestination(index),
                          ),
                        );
                      }),
                    ),
                    const Spacer(),
                    dashboardController.railWidth.value ==
                            DashboardControllerConstants
                                .navigationRailExpandedWidth
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: DashboardExpandedRailCard(
                              dashboardDestinationCard:
                                  DashboardDestinationCard(
                                //TODO:
                                title: 'settings',
                                iconData: FontAwesomeIcons.gear,
                                description: '',
                                destination: const SettingsPage(),
                              ),
                              isSelected:
                                  dashboardController.selectedIndex.value ==
                                      dashboardController
                                              .dashboardDestinations.length +
                                          1,
                              onTap: () => dashboardController
                                  .animateToDestination(dashboardController
                                          .dashboardDestinations.length +
                                      1),
                            ),
                          )
                        : DashboardCollapsedRailCard(
                            dashboardDestinationCard: DashboardDestinationCard(
                              title: 'settings',
                              iconData: FontAwesomeIcons.gear,
                              description: '',
                              destination: SettingsPage(),
                            ),
                            isSelected: false,
                            onTap: () => dashboardController
                                .animateToDestination(dashboardController
                                        .dashboardDestinations.length +
                                    1),
                          ),
                  ],
                ),
              ),
            ),
          ),
          const VerticalDivider(
            thickness: 1,
            width: 2,
          ),
          Expanded(
            flex: 84,
            child: PageView(
                controller: dashboardController.pageController,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  const DashboardContentPage(),
                  ...List.generate(
                    dashboardController.dashboardDestinations.length,
                    (index) => dashboardController
                        .dashboardDestinations[index].destination,
                  ),
                  SettingsPage()
                ]),
          ),
        ],
      ),
    );
  }
}
