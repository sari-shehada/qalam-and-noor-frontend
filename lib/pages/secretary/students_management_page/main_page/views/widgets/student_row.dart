import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/logic_tools/datetime_helper.dart';
import '../../../models/student_info.dart';
import '../../../student_profile/controllers/student_profile_controller.dart';
import '../../../student_profile/views/student_profile.dart';

class StudentRow extends StatelessWidget {
  const StudentRow({super.key, required this.student, required this.rowColor});
  final FullStudentInfo student;
  final Color rowColor;
  @override
  Widget build(BuildContext context) {
    // StudentsManagementController controller = Get.find(); //TODO: Uncomment this later when there is a use for it
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
    return SizedBox(
      height: 70.h,
      child: Container(
        color: rowColor,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Get.to(
                () => const StudentProfile(),
                binding: BindingsBuilder(
                  () {
                    Get.put(
                      StudentProfileController(
                        student: student.student.obs,
                      ),
                    );
                  },
                ),
              );
            },
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 20.w),
                      alignment: Alignment.centerRight,
                      child: Text(
                        student.student.publicRecordId.toString(),
                        style: textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 22.sp),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 40,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 20.w),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${student.student.firstName} ${student.father.firstName} ${student.father.lastName}",
                        style: textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 22.sp),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 20.w),
                      alignment: Alignment.centerRight,
                      child: student.student.isMale
                          ? const FaIcon(Icons.male, color: Colors.blue)
                          : FaIcon(Icons.female, color: Colors.pink[300]),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 20.w),
                      alignment: Alignment.centerRight,
                      child: Text(
                        DateTimeHelper.getDateWithoutTime(
                          student.student.joinDate,
                        ),
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
      ),
    );
  }
}
