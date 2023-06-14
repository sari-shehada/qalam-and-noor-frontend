import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../configs/fonts.dart';
import '../../../../../../configs/styles.dart';

class SchoolInboxTabBarItem extends StatelessWidget {
  const SchoolInboxTabBarItem({
    super.key,
    required this.title,
    required this.currentIndex,
    required this.itemIndex,
  });

  final String title;
  final RxInt currentIndex;
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final Color foreColor = currentIndex.value == itemIndex
            ? Get.theme.colorScheme.onPrimary
            : Get.theme.colorScheme.onSurface;
        final Color backColor = currentIndex.value == itemIndex
            ? Get.theme.colorScheme.primary
            : Get.theme.colorScheme.onPrimary.withOpacity(0);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: AnimatedContainer(
            duration: 600.milliseconds,
            curve: Curves.linearToEaseOut,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 40.w),
            decoration: BoxDecoration(
              color: backColor,
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
            ),
            child: Text(
              title,
              style: ProjectFonts.headlineSmall().copyWith(color: foreColor),
            ),
          ),
        );
      },
    );
  }
}
