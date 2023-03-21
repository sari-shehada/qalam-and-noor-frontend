import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/dashboard/models/dashboard_destination_card.dart';
import 'package:kalam_noor/pages/dashboard/views/dashboard_page.dart';
import 'package:kalam_noor/pages/navigation_page/views/widgets/navigation_rail_card.dart';
import 'package:kalam_noor/pages/navigation_page/views/widgets/navigation_rail_widgets.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../dashboard/controllers/dashboard_controller.dart';

class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({
    super.key,
    required this.dashboardController,
  });

  final DashboardController dashboardController;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => dashboardController.expandContainer(),
      onExit: (event) => dashboardController.collapseContainer(),
      child: Obx(
        () => AnimatedContainer(
          duration: DashboardControllerConstants.railAnimationDuration,
          curve: Curves.linearToEaseOut,
          width: dashboardController.railWidth.value,
          decoration: BoxDecoration(color: Color(0xFFFFFFFF), boxShadow: [
            BoxShadow(
                offset: Offset(-30.w, 0),
                color: Color(0xff393939).withOpacity(.05),
                blurRadius: 60)
          ]),
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RailHeader(dashboardController: dashboardController),
                  AddVerticalSpacing(value: 45.h),
                  NavigationRailCollapsedCard(
                    dashboardDestinationCard: DashboardDestinationCard(
                        title: 'Dashboard',
                        iconData: FontAwesomeIcons.house,
                        description: '',
                        destination: DashboardPage()),
                    onTap: () => dashboardController.switchToPage(0),
                  ),
                  AddVerticalSpacing(value: 50.h),
                  SizedBox(
                    height: 560.h,
                    child: Expanded(
                        child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          dashboardController.dashboardDestinations.length,
                      itemBuilder: (context, index) =>
                          NavigationRailCollapsedCard(
                        dashboardDestinationCard:
                            dashboardController.dashboardDestinations[index],
                        onTap: () =>
                            dashboardController.switchToPage(index + 1),
                      ),
                    )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
