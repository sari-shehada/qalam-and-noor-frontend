import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../controllers/navigation_controller.dart';
import '../../../../configs/project_themes.dart';

import '../../../../tools/ui_tools/ui_tools.dart';

class NavigationRailCard extends StatelessWidget {
  const NavigationRailCard({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    NavigationController dashboardController = Get.find();
    return Obx(
      () => AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(),
        curve: Curves.linearToEaseOut,
        duration: DashboardControllerConstants.railAnimationDuration,
        height: 80.w,
        width: dashboardController.railWidth.value ==
                DashboardControllerConstants.navigationRailCollapsedWidth
            ? 80.w
            : 296.w,
        child: Obx(
          () => Material(
            borderRadius: BorderRadius.circular(14.r),
            color: dashboardController.selectedIndex.value == index
                ? const Color(0xFFF5F6F8)
                : Colors.transparent,
            child: InkWell(
              onTap: () => dashboardController.switchToPage(index),
              borderRadius: BorderRadius.circular(14.r),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 80.w,
                    width: 80.w,
                    child: Center(
                      child: FaIcon(
                        dashboardController
                            .dashboardDestinations[index].iconData,
                        color: dashboardController.selectedIndex.value == index
                            ? lightColorScheme.primary
                            : lightColorScheme.inverseSurface,
                        size: 33.sp,
                      ),
                    ),
                  ),
                  AddHorizontalSpacing(value: 5.w),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      dashboardController.dashboardDestinations[index].title,
                      style: TextStyle(
                          color:
                              dashboardController.selectedIndex.value == index
                                  ? Get.theme.colorScheme.primary
                                  : const Color(0xffC7C7C7),
                          fontSize: 22.sp),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
