import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/controllers/student_profile_controller.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../configs/styles.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';
import '../../../student_score_page/controllers/student_score_controller.dart';
import '../../../student_score_page/views/student_score_page.dart';

class StudentProfileYearRecordList extends GetView<StudentProfileController> {
  const StudentProfileYearRecordList({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Builder(
      builder: (context) {
        if (controller.studentYearRecords.isEmpty) {
          return Column(
            children: [
              const Spacer(),
              Text(
                "الطالب جديد ولم يتم تسجيله في سنة دراسية سابقا",
                style: ProjectFonts.titleMedium().copyWith(
                  color: Colors.grey,
                ),
              ),
              AddVerticalSpacing(value: 30.h),
              FaIcon(
                FontAwesomeIcons.schoolCircleXmark,
                size: 70.sp,
                color: Colors.grey,
              ),
              const Spacer(),
            ],
          );
        }
        return ListView.separated(
          itemCount: controller.studentYearRecords.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(
                  () => const StudentScorePage(),
                  binding: BindingsBuilder(
                    () {
                      Get.put(
                        StudentScoreController(
                          student: controller.student.value,
                          schoolYear: controller.studentYearRecords[index],
                        ),
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: 60.w,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                height: 60.h,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: controller.studentYearRecords[index].isFinished
                      ? Colors.grey
                      : colorScheme.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(GlobalStyles.globalBorderRadius),
                  ),
                ),
                child: Center(
                  child: Text(
                    "السنة الدراسية: ${controller.studentYearRecords[index].name}",
                    style: ProjectFonts.headlineSmall().copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10.h,
            );
          },
        );
      },
    );
  }
}
