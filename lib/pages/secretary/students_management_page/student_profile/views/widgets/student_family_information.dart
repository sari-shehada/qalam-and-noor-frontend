import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../controllers/student_profile_controller.dart';

class FamilyInfo extends GetView<StudentProfileController> {
  const FamilyInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Container(
      width: 650.w,
      height: 385.h,
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.w, bottom: 10.w),
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 20.h),
            blurRadius: 12,
            color: colorScheme.primary.withOpacity(.09),
          ),
        ],
      ),
      child: SizedBox.shrink(),
    );
  }
}
