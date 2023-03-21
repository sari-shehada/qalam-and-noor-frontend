import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/dashboard/views/dashboard_page.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../../settings/views/settings_page.dart';

import 'widgets/navigation_rail.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: DashboardControllerConstants
                      .navigationRailCollapsedWidth),
              child: Obx(
                () => IndexedStack(
                    index: dashboardController.selectedIndex.value,
                    children: <Widget>[
                      const DashboardPage(),
                      ...List.generate(
                        dashboardController.dashboardDestinations.length,
                        (index) => dashboardController
                            .dashboardDestinations[index].destination,
                      ),
                      const SettingsPage()
                    ]),
              ),
            ),
            CustomNavigationRail(dashboardController: dashboardController),
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





// class Dashboard extends StatelessWidget {
//   const Dashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     DashboardController dashboardController = Get.find();
//     return Scaffold(
//       body: Row(
//         children: [
//           Obx(
//             () => AnimatedContainer(
//               duration: const Duration(milliseconds: 600),
//               curve: Curves.linearToEaseOut,
//               width: dashboardController.railWidth.value,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 20,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     dashboardController.railWidth.value ==
//                             DashboardControllerConstants
//                                 .navigationRailExpandedWidth
//                         ? Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 7),
//                             child: DashboardExpandedRailCard(
//                               dashboardDestinationCard:
//                                   DashboardDestinationCard(
//                                 title: 'لوحة التحكم',
//                                 iconData: FontAwesomeIcons.house,
//                                 description: '',
//                                 destination: const DashboardContentPage(),
//                               ),
//                               isSelected: false,
//                               onTap: () =>
//                                   dashboardController.animateToDestination(-1),
//                             ),
//                           )
//                         : DashboardCollapsedRailCard(
//                             dashboardDestinationCard: DashboardDestinationCard(
//                               title: 'لوحة التحكم',
//                               iconData: FontAwesomeIcons.house,
//                               description: '',
//                               destination: const DashboardContentPage(),
//                             ),
//                             isSelected: true,
//                             onTap: () =>
//                                 dashboardController.animateToDestination(-1),
//                           ),
//                     const AddVerticalSpacing(value: 20),
//                     Column(
//                       children: List.generate(
//                           dashboardController.dashboardDestinations.length,
//                           (index) {
//                         if (dashboardController.railWidth.value ==
//                             DashboardControllerConstants
//                                 .navigationRailCollapsedWidth) {
//                           return DashboardCollapsedRailCard(
//                             dashboardDestinationCard: dashboardController
//                                 .dashboardDestinations[index],
//                             isSelected:
//                                 dashboardController.selectedIndex.value ==
//                                     index,
//                             onTap: () =>
//                                 dashboardController.animateToDestination(index),
//                           );
//                         }
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 15),
//                           child: DashboardExpandedRailCard(
//                             dashboardDestinationCard: dashboardController
//                                 .dashboardDestinations[index],
//                             isSelected:
//                                 dashboardController.selectedIndex.value ==
//                                     index,
//                             onTap: () =>
//                                 dashboardController.animateToDestination(index),
//                           ),
//                         );
//                       }),
//                     ),
//                     const Spacer(),
//                     dashboardController.railWidth.value ==
//                             DashboardControllerConstants
//                                 .navigationRailExpandedWidth
//                         ? Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 7),
//                             child: DashboardExpandedRailCard(
//                               dashboardDestinationCard:
//                                   DashboardDestinationCard(
//                                 //TODO:
//                                 title: 'settings',
//                                 iconData: FontAwesomeIcons.gear,
//                                 description: '',
//                                 destination: const SettingsPage(),
//                               ),
//                               isSelected:
//                                   dashboardController.selectedIndex.value ==
//                                       dashboardController
//                                               .dashboardDestinations.length +
//                                           1,
//                               onTap: () => dashboardController
//                                   .animateToDestination(dashboardController
//                                           .dashboardDestinations.length +
//                                       1),
//                             ),
//                           )
//                         : DashboardCollapsedRailCard(
//                             dashboardDestinationCard: DashboardDestinationCard(
//                               title: 'settings',
//                               iconData: FontAwesomeIcons.gear,
//                               description: '',
//                               destination: SettingsPage(),
//                             ),
//                             isSelected: false,
//                             onTap: () => dashboardController
//                                 .animateToDestination(dashboardController
//                                         .dashboardDestinations.length +
//                                     1),
//                           ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const VerticalDivider(
//             thickness: 1,
//             width: 2,
//           ),
//           Expanded(
//             flex: 84,
//             child: PageView(
//                 controller: dashboardController.pageController,
//                 physics: const NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.vertical,
//                 children: <Widget>[
//                   const DashboardContentPage(),
//                   ...List.generate(
//                     dashboardController.dashboardDestinations.length,
//                     (index) => dashboardController
//                         .dashboardDestinations[index].destination,
//                   ),
//                   SettingsPage()
//                 ]),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         dashboardController.railWidth.value ==
//                                 DashboardControllerConstants
//                                     .navigationRailExpandedWidth
//                             ? Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 7.w),
//                                 child: DashboardExpandedRailCard(
//                                   dashboardDestinationCard:
//                                       DashboardDestinationCard(
//                                     title: 'لوحة التحكم',
//                                     iconData: FontAwesomeIcons.house,
//                                     description: '',
//                                     destination: const DashboardContentPage(),
//                                   ),
//                                   isSelected: false,
//                                   onTap: () =>
//                                       dashboardController.switchToPage(0),
//                                 ),
//                               )
//                             : DashboardCollapsedRailCard(
//                                 dashboardDestinationCard:
//                                     DashboardDestinationCard(
//                                   title: 'لوحة التحكم',
//                                   iconData: FontAwesomeIcons.house,
//                                   description: '',
//                                   destination: const DashboardContentPage(),
//                                 ),
//                                 isSelected: true,
//                                 onTap: () =>
//                                     dashboardController.switchToPage(0),
//                               ),
//                         const AddVerticalSpacing(value: 20),
//                         Column(
//                           children: List.generate(
//                               dashboardController.dashboardDestinations.length,
//                               (index) {
//                             if (dashboardController.railWidth.value ==
//                                 DashboardControllerConstants
//                                     .navigationRailCollapsedWidth) {
//                               return DashboardCollapsedRailCard(
//                                 dashboardDestinationCard: dashboardController
//                                     .dashboardDestinations[index],
//                                 isSelected:
//                                     dashboardController.selectedIndex.value ==
//                                         index,
//                                 onTap: () =>
//                                     dashboardController.switchToPage(index),
//                               );
//                             }
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 10, horizontal: 15),
//                               child: DashboardExpandedRailCard(
//                                 dashboardDestinationCard: dashboardController
//                                     .dashboardDestinations[index],
//                                 isSelected:
//                                     dashboardController.selectedIndex.value ==
//                                         index,
//                                 onTap: () =>
//                                     dashboardController.switchToPage(index),
//                               ),
//                             );
//                           }),
//                         ),
//                         const Spacer(),
//                         dashboardController.railWidth.value ==
//                                 DashboardControllerConstants
//                                     .navigationRailExpandedWidth
//                             ? Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 7),
//                                 child: DashboardExpandedRailCard(
//                                   dashboardDestinationCard:
//                                       DashboardDestinationCard(
//                                     //TODO:
//                                     title: 'settings',
//                                     iconData: FontAwesomeIcons.gear,
//                                     description: '',
//                                     destination: const SettingsPage(),
//                                   ),
//                                   isSelected:
//                                       dashboardController.selectedIndex.value ==
//                                           dashboardController
//                                                   .dashboardDestinations
//                                                   .length +
//                                               1,
//                                   onTap: () => dashboardController.switchToPage(
//                                       dashboardController
//                                               .dashboardDestinations.length +
//                                           1),
//                                 ),
//                               )
//                             : DashboardCollapsedRailCard(
//                                 dashboardDestinationCard:
//                                     DashboardDestinationCard(
//                                   title: 'settings',
//                                   iconData: FontAwesomeIcons.gear,
//                                   description: '',
//                                   destination: SettingsPage(),
//                                 ),
//                                 isSelected: false,
//                                 onTap: () => dashboardController.switchToPage(
//                                     dashboardController
//                                         .dashboardDestinations.length),
//                               ),
//                       ],
//                     ),
