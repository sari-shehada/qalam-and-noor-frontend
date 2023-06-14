import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CourseInfoRow extends StatelessWidget {
  const CourseInfoRow(
      {super.key,
      required this.className,
      required this.courseName,
      required this.isEnriching,
      required this.totalMark,
      required this.rowColor});
  final String courseName;
  final String className;
  final bool isEnriching;
  final double totalMark;
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
                      courseName,
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
                      className,
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
                      isEnriching ? 'إثرائي' : 'إلزامي',
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
                      totalMark.toString(),
                      style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22.sp),
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
