import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../configs/fonts.dart';
import '../../../../../../configs/styles.dart';

class EmployeeSectionTitleWidget extends StatelessWidget {
  const EmployeeSectionTitleWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.changeSectionCallback,
  });

  final String title;
  final RxBool isSelected;
  final VoidCallback changeSectionCallback;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Get.theme.colorScheme;
    return Obx(
      () {
        return AnimatedContainer(
          duration: 400.milliseconds,
          decoration: BoxDecoration(
            color: isSelected.value
                ? colorScheme.primaryContainer
                : colorScheme.primaryContainer.withOpacity(0),
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
            child: InkWell(
              onTap: changeSectionCallback,
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                  ),
                  child: Center(
                    child: TweenAnimationBuilder(
                      tween: ColorTween(
                        begin: isSelected.value
                            ? colorScheme.onSurfaceVariant
                            : colorScheme.primary,
                        end: isSelected.value
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
          ),
        );
      },
    );
  }
}
