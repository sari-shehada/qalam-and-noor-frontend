import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'navigation_rail_card.dart';
import 'navigation_rail_widgets.dart';
import '../../../../tools/ui_tools/ui_tools.dart';

import '../../../dashboard/controllers/dashboard_controller.dart';

class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();
    return MouseRegion(
      onHover: (event) => dashboardController.expandContainer(),
      onExit: (event) => dashboardController.collapseContainer(),
      child: Obx(
        () => AnimatedContainer(
          duration: DashboardControllerConstants.railAnimationDuration,
          curve: Curves.linearToEaseOut,
          width: dashboardController.railWidth.value,
          decoration: BoxDecoration(color: const Color(0xFFFFFFFF), boxShadow: [
            BoxShadow(
                offset: Offset(-30.w, 0),
                color: const Color(0xff393939).withOpacity(.05),
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
                  const NavigationRailCollapsedCard(index: 0),
                  AddVerticalSpacing(value: 40.h),
                  SizedBox(
                    height: 560.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          dashboardController.dashboardDestinations.length - 2,
                      itemBuilder: (context, index) =>
                          NavigationRailCollapsedCard(
                        index: index + 1,
                      ),
                    ),
                  ),
                  const Spacer(),
                  NavigationRailCollapsedCard(
                      index:
                          dashboardController.dashboardDestinations.length - 1),
                ],
              )),
        ),
      ),
    );
  }
}
