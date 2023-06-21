import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../configs/fonts.dart';
import '../../../../../../../../tools/ui_tools/ui_tools.dart';

class CurrentSchoolYearNumericStatsWidget extends StatelessWidget {
  const CurrentSchoolYearNumericStatsWidget({
    super.key,
    required this.title,
    required this.count,
    this.titleColor,
  });

  final String title;
  final double count;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Countup(
                begin: 0,
                end: count,
                duration: 2000.milliseconds,
                curve: Curves.fastLinearToSlowEaseIn,
                style: TextStyle(
                  color: titleColor ?? Get.theme.colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
        AddVerticalSpacing(value: 20.h),
        Text(
          title,
          style: ProjectFonts.headlineMedium().copyWith(
            color: Get.theme.colorScheme.onSurfaceVariant,
          ),
        ),
        AddVerticalSpacing(value: 35.h),
      ],
    );
  }
}
