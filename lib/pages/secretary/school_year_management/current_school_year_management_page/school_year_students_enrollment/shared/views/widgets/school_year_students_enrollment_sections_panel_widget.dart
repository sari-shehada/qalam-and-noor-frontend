import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/views/widgets/school_year_students_enrollment_section_widget.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../../../../../tools/ui_tools/buttons.dart';
import '../../controllers/school_year_students_enrollment_dialog_tab_controller.dart';

class SchoolYearStudentsEnrollmentSectionsPanelWidget
    extends GetView<SchoolYearStudentsEnrollmentDialogTabController> {
  const SchoolYearStudentsEnrollmentSectionsPanelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 25.h,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          ...(controller.sections
              .map<Widget>(
                (e) => Obx(
                  () => SchoolYearStudentsEnrollmentSectionWidget(
                    title: e.title,
                    isSelected: controller.currentPage.value ==
                        controller.sections.indexOf(e),
                  ),
                ),
              )
              .toList()),
          const Spacer(),
          CustomOutlinedButton(
            onTap: () => controller.toPreviousPage(),
            child: 'الصفحة السابقة',
            outlineColor: Get.theme.colorScheme.error,
          ),
          AddVerticalSpacing(value: 15.h),
          Obx(
            () => CustomFilledButton(
              onTap: () => controller.toNextPage(),
              buttonStatus: controller.buttonStatus,
              child:
                  controller.currentPage.value == controller.sections.length - 1
                      ? 'تسجيل الطلاب'
                      : 'التالي',
            ),
          ),
        ],
      ),
    );
  }
}
