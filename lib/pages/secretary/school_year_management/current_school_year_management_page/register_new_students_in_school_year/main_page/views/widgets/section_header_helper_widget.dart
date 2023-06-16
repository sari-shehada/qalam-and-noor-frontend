import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';

import '../../controllers/register_new_students_in_school_year_tab_controller.dart';

class SectionHeaderHelperWidget
    extends GetView<RegisterNewStudentsInSchoolYearTabController> {
  const SectionHeaderHelperWidget({super.key});

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
