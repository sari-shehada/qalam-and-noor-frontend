import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../ui_tools/ui_tools.dart';

class EmptyItemWidget extends StatelessWidget {
  const EmptyItemWidget({
    super.key,
    required this.itemName,
    required this.iconData,
    this.padding,
    this.spacing,
  });

  final String itemName;
  final IconData iconData;
  final EdgeInsetsGeometry? padding;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: 120.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 287.w,
            // weight: 10.h,
            color: themeData.colorScheme.outline,
          ),
          AddVerticalSpacing(
            value: spacing ?? 130.h,
          ),
          Text(
            "لم يتم العثور على $itemName",
            textAlign: TextAlign.center,
            style: textTheme.headlineLarge!.copyWith(
              color: themeData.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
