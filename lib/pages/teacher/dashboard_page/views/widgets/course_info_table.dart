import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/teacher/dashboard_page/models/teacher_course_info.dart';
import 'package:kalam_noor/pages/teacher/dashboard_page/views/widgets/course_info_row.dart';
import '../../../../../../configs/fonts.dart';

class CourseInfoTable extends StatelessWidget {
  const CourseInfoTable({super.key, required this.coursesInfo});
  final List<TeacherCourseInfo> coursesInfo;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Scaffold(
      body: SizedBox.expand(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              border: Border.all(
                color: colorScheme.primary,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.r),
                topLeft: Radius.circular(15.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    child: Text(
                      'اسم المقرر',
                      style: ProjectFonts.titleLarge().copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    child: Text(
                      'الصف',
                      style: ProjectFonts.titleLarge().copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    child: Text(
                      'نوع المقرر',
                      style: ProjectFonts.titleLarge().copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    child: Text(
                      'العلامة الكاملة',
                      style: ProjectFonts.titleLarge().copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    child: Text(
                      "الإجرائات",
                      style: ProjectFonts.titleLarge().copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 100.h),
              itemCount: coursesInfo.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Color rowColor = index % 2 == 0
                    ? Colors.white
                    : Get.theme.colorScheme.primaryContainer.withOpacity(.2);
                return CourseInfoRow(
                  rowColor: rowColor,
                  course: coursesInfo[index].course,
                  schoolClass: coursesInfo[index].schoolClass,
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
