import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/new_students_selection/models/school_year_student_registration_model.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/new_students_selection/controllers/school_year_new_students_registration_sub_page_controller.dart';

import '../../../../../../../../../configs/fonts.dart';

class NewStudentSelectionCard
    extends GetView<SchoolYearNewStudentsRegistrationSubPageController> {
  const NewStudentSelectionCard({
    super.key,
    required this.student,
    required this.backgroundColor,
  });

  final SchoolYearNewStudentRegistrationModel student;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool isSelected = controller.selectedStudents.contains(student);
        return AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
            color: isSelected
                ? Get.theme.colorScheme.primaryContainer
                : backgroundColor,
          ),
          duration: 500.milliseconds,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => controller.toggleStudent(student),
              child: AnimatedPadding(
                duration: 500.milliseconds,
                curve: Curves.fastLinearToSlowEaseIn,
                padding: EdgeInsets.only(
                  top: 25.h,
                  bottom: 25.h,
                  right: isSelected ? 25.w : 15.w,
                  left: 25.w,
                ),
                child: Row(
                  children: [
                    Text(
                      student.student.firstName,
                      style: ProjectFonts.titleMedium().copyWith(
                        color: isSelected
                            ? Get.theme.colorScheme.primary
                            : Get.theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Spacer(),
                    AnimatedOpacity(
                      curve: Curves.fastLinearToSlowEaseIn,
                      opacity: isSelected ? 1 : 0,
                      duration: 300.milliseconds,
                      child: Icon(
                        Icons.check,
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
