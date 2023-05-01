import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/pages/school_classes_management_page/courses_management/controllers/courses_management_controller.dart';

class CourseRow extends StatelessWidget {
  const CourseRow({super.key, required this.course, required this.rowColor});
  final Course course;
  final Color rowColor;

  @override
  Widget build(BuildContext context) {
    CoursesManagementController controller = Get.find();
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
    return SizedBox(
      height: 70.h,
      child: Container(
        color: rowColor,
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  alignment: Alignment.centerRight,
                  child: Text(
                    course.name,
                    style: textTheme.titleLarge!.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  alignment: Alignment.center,
                  child: Text(
                    course.totalGrade.toString(),
                    style: textTheme.titleLarge!.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  child: Text(
                    course.isEnriching ? 'إثرائي' : 'الزامي',
                    style: textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  child: IconButton(
                    onPressed: () => controller.updateCourseInfo(course),
                    icon: Icon(
                      Icons.edit,
                      color: Get.theme.colorScheme.primary.withOpacity(.7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
