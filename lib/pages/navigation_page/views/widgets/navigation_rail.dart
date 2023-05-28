import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/navigation_page_controller.dart';
import 'navigation_rail_card.dart';
import 'navigation_rail_widgets.dart';

class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final NavigationPageController navigationController = Get.find();
    return MouseRegion(
      onHover: (event) => navigationController.expandContainer(),
      onExit: (event) => navigationController.collapseContainer(),
      child: Obx(
        () => AnimatedContainer(
          duration: DashboardControllerConstants.railAnimationDuration,
          curve: Curves.linearToEaseOut,
          width: navigationController.railWidth.value,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                  offset: Offset(-30.w, 0),
                  color: const Color(0xff393939).withOpacity(.05),
                  blurRadius: 60)
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 25.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RailHeader(dashboardController: navigationController),
                AddVerticalSpacing(value: 45.h),
                const NavigationRailCard(index: 0),
                AddVerticalSpacing(value: 40.h),
                navigationController.hasMiddleSection
                    ? SizedBox(
                        height: 580.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: navigationController.hasBottomSection
                              ? navigationController
                                      .dashboardDestinations.length -
                                  2
                              : navigationController
                                      .dashboardDestinations.length -
                                  1,
                          itemBuilder: (context, index) => NavigationRailCard(
                            index: index + 1,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                const Spacer(),
                navigationController.hasBottomSection
                    ? NavigationRailCard(
                        index:
                            navigationController.dashboardDestinations.length -
                                1,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
