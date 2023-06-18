import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/pages/teacher/dashboard_page/controllers/teacher_dashboard_controller.dart';

class CourseInfoRow extends GetView<TeacherDashboardController> {
  const CourseInfoRow(
      {super.key,
      required this.rowColor,
      required this.course,
      required this.schoolClass});
  final Course course;
  final SchoolClass schoolClass;
  final Color rowColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
    return SizedBox(
      height: 70.h,
      child: Container(
        color: rowColor,
        child: Material(
          color: Colors.transparent,
          child: SizedBox(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      course.name,
                      style: textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      schoolClass.name,
                      style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22.sp),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      course.isEnriching ? 'إثرائي' : 'إلزامي',
                      style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22.sp),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      course.totalGrade.toString(),
                      style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22.sp),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    child: OutlinedButton(
                      onPressed: () => controller.assignGradesInCourse(
                        schoolClass: schoolClass,
                        course: course,
                      ),
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                            vertical: 20.h,
                            horizontal: 25.w,
                          ),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("تسجيل علامات المقرر"),
                          Spacer(),
                          Icon(Icons.edit),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
