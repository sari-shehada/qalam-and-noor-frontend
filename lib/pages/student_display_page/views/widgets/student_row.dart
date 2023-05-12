import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/pages/student_display_page/controllers/students_display_controller.dart';

class StudentRow extends StatelessWidget {
  const StudentRow({super.key, required this.student, required this.rowColor});
  final Student student;
  final Color rowColor;
  @override
  Widget build(BuildContext context) {
    StudentsManagementController controller = Get.find();
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
                  flex: 9,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      student.firstName,
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
