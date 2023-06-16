import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../../../configs/fonts.dart';
import '../../../../../../../../../models/agendas/student.dart';
import '../../controllers/school_year_failing_students_registration_sub_page_controller.dart';

class FailingStudentSelectionCard
    extends GetView<SchoolYearFailingStudentsRegistrationSubPageController> {
  const FailingStudentSelectionCard({
    super.key,
    required this.student,
  });

  final Student student;

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
                : Get.theme.colorScheme.primaryContainer.withOpacity(0),
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
                      student.firstName,
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
