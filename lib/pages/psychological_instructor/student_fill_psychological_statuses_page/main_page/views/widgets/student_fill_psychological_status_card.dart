import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/pages/psychological_instructor/student_fill_psychological_statuses_page/main_page/controllers/student_fill_psychological_statuses_controller.dart';
import 'package:kalam_noor/tools/logic_tools/datetime_helper.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class StudentFillPsychologicalStatusCard extends StatelessWidget {
  const StudentFillPsychologicalStatusCard({
    super.key,
    required this.student,
    required this.backgroundColor,
  });
  final Student student;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    Rx<bool> isHovered = false.obs;
    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Get.find<StudentFillPsychologicalStatusesController>()
              .addStudentPsychologicalInfo(student),
          onHover: (value) => isHovered.value = value,
          child: Obx(
            () => AnimatedPadding(
              duration: 150.milliseconds,
              padding: isHovered.value
                  ? EdgeInsets.symmetric(horizontal: 40.w)
                  : EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      student.publicRecordId.toString(),
                      style: ProjectFonts.titleLarge().copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      student.firstName,
                      style: ProjectFonts.titleLarge().copyWith(
                        fontWeight: FontWeight.normal,
                        color: Get.theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          student.isMale ? Icons.male : Icons.female,
                          color: student.isMale
                              ? Get.theme.colorScheme.primary
                              : Colors.pink[300],
                          size: 30.sp,
                        ),
                        AddHorizontalSpacing(value: 10.w),
                        Text(
                          student.isMale ? 'ذكر' : 'أنثى',
                          style: ProjectFonts.titleMedium(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Tooltip(
                      message: 'تاريخ الانتساب',
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const FaIcon(FontAwesomeIcons.calendar),
                          AddHorizontalSpacing(value: 10.w),
                          Text(
                            DateTimeHelper.getDateWithoutTime(student.joinDate),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Tooltip(
                      message: 'تاريخ الميلاد',
                      child: Row(
                        children: [
                          const FaIcon(FontAwesomeIcons.cakeCandles),
                          AddHorizontalSpacing(value: 10.w),
                          Text(
                            DateTimeHelper.getDateWithoutTime(
                                student.dateOfBirth),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Tooltip(
                      message: 'الديانة',
                      child: Row(
                        children: [
                          Text(
                            religionAsString[student.religion]!,
                            style: ProjectFonts.titleMedium(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
