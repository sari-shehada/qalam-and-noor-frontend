import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/main_page/views/widgets/register_students_in_school_year_section_widget.dart';

import '../../../../../../../../tools/ui_tools/buttons.dart';
import '../../controllers/register_new_students_in_school_year_tab_controller.dart';

class RegisterNewStudentsInSchoolYearTabViewRightWidget
    extends GetView<RegisterNewStudentsInSchoolYearTabController> {
  const RegisterNewStudentsInSchoolYearTabViewRightWidget({
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
                  () => RegisterStudentsInSchoolYearSectionTitleWidget(
                    title: e.title,
                    isSelected: controller.currentPage.value ==
                        controller.sections.indexOf(e),
                  ),
                ),
              )
              .toList()),
          const Spacer(),
          CustomFilledButton(
            onTap: () => controller.toNextPage(),
            // buttonStatus: controller.buttonStatus,
            child:
                controller.currentPage.value == controller.sections.length - 1
                    ? 'تسجيل الطلاب'
                    : 'التالي',
          ),
        ],
      ),
    );
  }
}
