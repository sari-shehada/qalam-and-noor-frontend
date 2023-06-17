import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../configs/fonts.dart';
import '../../../../../../../../../configs/styles.dart';

class SchoolYearStudentsEnrollmentSectionWidget extends StatelessWidget {
  const SchoolYearStudentsEnrollmentSectionWidget({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Get.theme.colorScheme;
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: 3.h),
      duration: 400.milliseconds,
      decoration: BoxDecoration(
        color: isSelected
            ? colorScheme.primaryContainer
            : colorScheme.primaryContainer.withOpacity(0),
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
            ),
            child: Center(
              child: TweenAnimationBuilder(
                tween: ColorTween(
                  begin: isSelected
                      ? colorScheme.onSurfaceVariant
                      : colorScheme.primary,
                  end: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                ),
                duration: 400.milliseconds,
                builder: (context, value, child) {
                  return Text(
                    title,
                    style: ProjectFonts.titleLarge().copyWith(
                      color: value,
                      fontWeight: FontWeight.normal,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
