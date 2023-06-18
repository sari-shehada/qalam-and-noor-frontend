import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/models/educational/exam.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/pages/teacher/dashboard_page/controllers/dialog_controllers/classroom_and_exam_selection_dialog_controller.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import '../../../../../../../configs/fonts.dart';
import '../../../../../models/enums.dart';

class ClassroomAndExamSelectionDialog extends StatelessWidget {
  const ClassroomAndExamSelectionDialog({
    super.key,
    required this.schoolClass,
    required this.course,
  });
  final Course course;
  final SchoolClass schoolClass;
  @override
  Widget build(BuildContext context) {
    ClassroomAndExamSelectionDialogController controller = Get.put(
      ClassroomAndExamSelectionDialogController(
        schoolClass: schoolClass,
        course: course,
      ),
    );
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          width: 600.w,
          height: 450.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.white,
          ),
          padding: EdgeInsetsDirectional.only(
              start: 30.w, end: 30.w, top: 20.h, bottom: 25.h),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: LoaderWidget(),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "إختيار معلومات الإمتحان",
                        style: ProjectFonts.headlineMedium(),
                      ),
                      AddVerticalSpacing(value: 30.h),
                      Text(
                        "إختر الشعبة",
                        style: ProjectFonts.headlineSmall(),
                      ),
                      AddVerticalSpacing(value: 20.h),
                      Obx(
                        () {
                          return Container(
                            height: 49.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              color: Get.theme.colorScheme.primaryContainer
                                  .withOpacity(.5),
                            ),
                            padding: EdgeInsetsDirectional.only(end: 20.w),
                            child: DropdownButton<Classroom>(
                              value: controller.selectedClassroom.value,
                              onChanged: (value) =>
                                  controller.selectedClassroom(value),
                              borderRadius: BorderRadius.circular(14.r),
                              elevation: 5,
                              dropdownColor:
                                  Get.theme.colorScheme.primaryContainer,
                              style: TextStyle(
                                fontFamily: ProjectFonts.fontFamily,
                                fontSize: 24.sp,
                                color: Get.theme.colorScheme.primary,
                              ),
                              isExpanded: true,
                              underline: const SizedBox.shrink(),
                              items: controller.classrooms
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          start: 30.w,
                                        ),
                                        child: Text(e.name),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
                      AddVerticalSpacing(value: 40.h),
                      Text(
                        "إختر نوع الإمتحان",
                        style: ProjectFonts.headlineSmall(),
                      ),
                      AddVerticalSpacing(value: 20.h),
                      Obx(
                        () {
                          return Container(
                            height: 49.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              color: Get.theme.colorScheme.primaryContainer
                                  .withOpacity(.5),
                            ),
                            padding: EdgeInsetsDirectional.only(end: 20.w),
                            child: DropdownButton<Exam>(
                              value: controller.selectedExam.value,
                              onChanged: (value) =>
                                  controller.changeExam(value),
                              borderRadius: BorderRadius.circular(14.r),
                              elevation: 5,
                              dropdownColor:
                                  Get.theme.colorScheme.primaryContainer,
                              style: TextStyle(
                                fontFamily: ProjectFonts.fontFamily,
                                fontSize: 24.sp,
                                color: Get.theme.colorScheme.primary,
                              ),
                              isExpanded: true,
                              underline: const SizedBox.shrink(),
                              items: controller.exams
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          start: 30.w,
                                        ),
                                        child: Text(
                                            "${examTypeAsString[e.type]}   ${e.percentage}%"),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
                      AddVerticalSpacing(value: 45.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: () => Get.back(),
                            child: const Text("إلغاء الإجراء"),
                          ),
                          AddHorizontalSpacing(value: 20.w),
                          FilledButton(
                            onPressed: () => controller.goToFillMarksPage(),
                            child: const Text("التالي"),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
