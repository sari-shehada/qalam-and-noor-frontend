import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../dashboard/controllers/dashboard_controller.dart';
import '../../../../configs/project_themes.dart';
import '../../../dashboard/models/dashboard_destination_card.dart';

import '../../../../tools/ui_tools/ui_tools.dart';

class NavigationRailExpandedCard extends StatelessWidget {
  const NavigationRailExpandedCard(
      {super.key,
      required this.dashboardDestinationCard,
      required this.isSelected,
      required this.onTap});

  final DashboardDestinationCard dashboardDestinationCard;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          isSelected ? lightColorScheme.secondaryContainer : Colors.transparent,
      borderRadius: BorderRadius.circular(15.sp),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15.sp),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 25.w),
          child: Row(
            children: [
              Icon(
                dashboardDestinationCard.iconData,
                color: isSelected
                    ? lightColorScheme.secondary
                    : lightColorScheme.inverseSurface,
              ),
              AddHorizontalSpacing(value: 14.sp),
              Text(
                dashboardDestinationCard.title,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: isSelected
                        ? lightColorScheme.secondary
                        : lightColorScheme.inverseSurface),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Solve the renderflex overflow exception and rename this to 'NavigationRailCard' and also remove the above widget
class NavigationRailCollapsedCard extends StatelessWidget {
  const NavigationRailCollapsedCard({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
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
              child: Row(
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
                  Text(
                    dashboardController.dashboardDestinations[index].title,
                    style: TextStyle(
                        color: dashboardController.selectedIndex.value == index
                            ? Get.theme.colorScheme.primary
                            : const Color(0xffC7C7C7),
                        fontSize: 22.sp),
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



// Center(
//               child: FaIcon(
//                 dashboardDestinationCard.iconData,
//                 color: isSelected
//                     ? lightColorScheme.primary
//                     : lightColorScheme.inverseSurface,
//                 size: 33.sp,
//               ),
//             ),