import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';

import '../../controllers/school_year_students_enrollment_dialog_tab_controller.dart';

class SchoolYearStudentsEnrollmentSectionHelperWidget
    extends GetView<SchoolYearStudentsEnrollmentDialogTabController> {
  const SchoolYearStudentsEnrollmentSectionHelperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 45.h),
            blurRadius: 30,
            color: Get.theme.colorScheme.shadow.withOpacity(.05),
          ),
        ],
      ),
      child: Center(
        child: Obx(
          () => Text(
            controller.sections[controller.currentPage.value].helperMessage,
            style: ProjectFonts.titleLarge(),
          ),
        ),
      ),
    );
  }
}
