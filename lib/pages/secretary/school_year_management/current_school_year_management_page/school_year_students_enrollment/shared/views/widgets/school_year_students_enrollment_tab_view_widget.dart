import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/views/widgets/school_year_students_enrollment_section_helper_widget.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/classroom_selection/views/classroom_selection_sub_page.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/new_students_selection/views/school_year_new_students_enrollment_sub_page.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/failing_students_selection/views/school_year_failing_students_enrollment_sub_page.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/succeeding_students_selection/views/school_year_succeeding_students_enrollment_sub_page.dart';

import '../../../sub_pages/class_selection/views/school_class_selection_sub_page.dart';
import '../../controllers/school_year_students_enrollment_dialog_tab_controller.dart';

class SchoolYearStudentsEnrollmentTabViewWidget
    extends GetView<SchoolYearStudentsEnrollmentDialogTabController> {
  const SchoolYearStudentsEnrollmentTabViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 150.h),
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.tabController,
            children: const [
              SchoolClassSelectionPage(),
              ClassroomSelectionPage(),
              SchoolYearNewStudentsEnrollmentSubPage(),
              SchoolYearSucceedingStudentsEnrollmentSubPage(),
              SchoolYearFailingStudentsEnrollmentSubPage(),
            ],
          ),
        ),
        const SchoolYearStudentsEnrollmentSectionHelperWidget(),
      ],
    );
  }
}
