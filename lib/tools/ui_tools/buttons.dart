import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../configs/fonts.dart';

import '../../configs/project_themes.dart';
import '../../configs/styles.dart';

class CallToActionButton extends StatelessWidget {
  const CallToActionButton({
    super.key,
    required this.label,
    this.labelColor,
    required this.onTap,
    this.backgroundColor,
    this.width = double.infinity,
    this.buttonStatus,
    //TODO:
    this.loadingColor = Colors.white,
  });

  final String label;
  final Color? labelColor;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final double width;
  final Rx<CallToActionButtonStatus>? buttonStatus;
  final Color loadingColor;
  @override
  Widget build(BuildContext context) {
    if (buttonStatus == null) {
      return Container(
        height: 58.h,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.w, 4.h),
              blurRadius: 12.r,
              color: Colors.black.withOpacity(.08),
            ),
          ],
        ),
        child: Material(
          color: backgroundColor ?? Get.theme.colorScheme.primary,
          elevation: 0,
          borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
          child: InkWell(
            onTap: onTap,
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
            child: Center(
                child: Text(
              label,
              style: TextStyle(
                fontFamily: ProjectFonts.fontFamily,
                fontSize: 17.sp,
                color: labelColor ?? lightColorScheme.primaryContainer,
              ),
            )),
          ),
        ),
      );
    }
    return Container(
      height: 58.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.w, 4.h),
            blurRadius: 12.r,
            color: Colors.black.withOpacity(.08),
          ),
        ],
      ),
      child: Material(
        color: backgroundColor ?? Get.theme.colorScheme.primary,
        elevation: 0,
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        child: Obx(
          () {
            switch (buttonStatus!.value) {
              case CallToActionButtonStatus.enabled:
                {
                  return InkWell(
                    onTap: onTap,
                    borderRadius:
                        BorderRadius.circular(GlobalStyles.globalBorderRadius),
                    child: Center(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontFamily: ProjectFonts.fontFamily,
                          fontSize: 17.sp,
                          color:
                              labelColor ?? lightColorScheme.primaryContainer,
                        ),
                      ),
                    ),
                  );
                }
              case CallToActionButtonStatus.disabled:
                {
                  return InkWell(
                    borderRadius:
                        BorderRadius.circular(GlobalStyles.globalBorderRadius),
                    child: Center(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontFamily: ProjectFonts.fontFamily,
                          fontSize: 17.sp,
                          color:
                              labelColor ?? lightColorScheme.primaryContainer,
                        ),
                      ),
                    ),
                  );
                }
              case CallToActionButtonStatus.processing:
                {
                  return Center(
                    child: SizedBox.square(
                      dimension: 30.h,
                      child: CircularProgressIndicator(
                        color: loadingColor,
                        strokeWidth: 4.sp,
                      ),
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}

enum CallToActionButtonStatus { enabled, disabled, processing }
