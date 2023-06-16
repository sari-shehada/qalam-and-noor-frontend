import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/main_page/views/widgets/section_header_helper_widget.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/classroom_selection_sub_page/views/classroom_selection_sub_page.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/school_year_new_students_registration_sub_page/views/school_year_new_students_registration_sub_page.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/school_year_failing_students_registration_sub_page/views/school_year_failing_students_registration_sub_page.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/school_year_succeeding_students_registration_sub_page/views/school_year_succeeding_students_registration_sub_page.dart';

import '../../../sub_pages/class_selection_sub_page/views/class_selection_sub_page.dart';
import '../../controllers/register_new_students_in_school_year_tab_controller.dart';

class RegisterNewStudentsInSchoolYearTabViewBodyWidget
    extends GetView<RegisterNewStudentsInSchoolYearTabController> {
  const RegisterNewStudentsInSchoolYearTabViewBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 75.h),
          child: TabBarView(
            controller: controller.tabController,
            children: const [
              ClassSelectionPage(),
              ClassroomSelectionPage(),
              SchoolYearNewStudentsRegistrationSubPage(),
              SchoolYearSucceedingStudentsRegistrationSubPage(),
              SchoolYearFailingStudentsRegistrationSubPage(),
            ],
          ),
        ),
        const SectionHeaderHelperWidget(),
      ],
    );
  }
}
