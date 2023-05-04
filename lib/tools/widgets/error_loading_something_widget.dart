import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../configs/fonts.dart';
import '../ui_tools/buttons.dart';
import '../ui_tools/ui_tools.dart';

class ErrorLoadingSomethingWidget extends StatelessWidget {
  const ErrorLoadingSomethingWidget({
    super.key,
    required this.somethingName,
    this.retryCallback,
    this.bottomPadding,
  });

  final String somethingName;
  final VoidCallback? retryCallback;
  final double? bottomPadding;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.info,
            size: 240.w,
            // weight: 10.h,
            color: Get.theme.colorScheme.outline,
          ),
          AddVerticalSpacing(
            value: 60.h,
          ),
          Text(
            "حدث خطأ إثناء تحميل $somethingName",
            style: ProjectFonts.headlineMedium().copyWith(
              color: Get.theme.colorScheme.outline,
            ),
          ),
          retryCallback != null
              ? Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: CustomFilledButton(
                    height: 50.h,
                    width: 400.w,
                    onTap: retryCallback!,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'إعادة المحاولة',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                            AddHorizontalSpacing(value: 50.w),
                            FaIcon(
                              FontAwesomeIcons.circleExclamation,
                              color: Colors.white,
                              size: 28.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          bottomPadding == null
              ? const SizedBox.shrink()
              : AddVerticalSpacing(value: bottomPadding!)
        ],
      ),
    );
  }
}
