import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../configs/assets.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/navigation_page_controller.dart';

class RailHeader extends StatelessWidget {
  const RailHeader({
    super.key,
    required this.dashboardController,
  });

  final NavigationPageController dashboardController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AddHorizontalSpacing(value: 11.w),
        Image.asset(
          GlobalAssets.appLogoPath,
          height: 58.w,
          width: 58.w,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedOpacity(
              duration: DashboardControllerConstants.railAnimationDuration,
              opacity: dashboardController.elementsOpacity.value,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AddHorizontalSpacing(value: 20.w),
                    Text(
                      'قلم و نور',
                      style: TextStyle(
                          color: Get.theme.colorScheme.primary,
                          fontSize: 28.0.sp,
                          overflow: TextOverflow.fade),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
