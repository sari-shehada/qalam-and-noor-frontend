import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../models/educational/course.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';

import 'course_row.dart';

class CoursesTable extends StatelessWidget {
  const CoursesTable({super.key, required this.courses});
  final List<Course> courses;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    return SizedBox.expand(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              border: Border.all(color: colorScheme.primary),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.r),
                topLeft: Radius.circular(15.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    child: Text(
                      'إسم المقرر ',
                      style: textTheme.titleLarge,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    child: Text(
                      'الدرجة الكلية',
                      style: textTheme.titleLarge,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    child: Text(
                      'نوع المقرر',
                      style: textTheme.titleLarge,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    child: Text(
                      'الاجراءات',
                      textAlign: TextAlign.center,
                      style: textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ...List.generate(
                  courses.length,
                  (index) {
                    Color rowColor = index % 2 == 0
                        ? Colors.white
                        : Get.theme.colorScheme.primaryContainer
                            .withOpacity(.2);
                    return CourseRow(
                      course: courses[index],
                      rowColor: rowColor,
                    );
                  },
                )
                    .animate(
                      interval: const Duration(milliseconds: 15),
                    )
                    .fade(
                      duration: const Duration(milliseconds: 200),
                    ),
                AddVerticalSpacing(value: 110.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
