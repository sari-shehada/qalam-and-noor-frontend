import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/student_profile_controller.dart';

class StudentMedicalRecordInfo extends GetView<StudentProfileController> {
  const StudentMedicalRecordInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final Color colorOfChoice = Theme.of(context).colorScheme.primary;

    return Obx(() {
      if (controller.isLoading.value) {
        return const SizedBox.shrink();
      }
      return SizedBox(
          width: 200.w,
          height: 200.w,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: colorOfChoice,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    offset: const Offset(1, 0),
                    blurRadius: 4,
                    spreadRadius: 2,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.student.value.isMale ? "وزنه" : "وزنها",
                  textAlign: TextAlign.center,
                  style: ProjectFonts.headlineSmall().copyWith(
                    fontSize: 22.sp,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AddVerticalSpacing(value: 10.h),
                Text(
                  "${controller.medicalRecord.studentWeight.toStringAsFixed(0)} KG",
                  style: ProjectFonts.headlineSmall().copyWith(
                    fontSize: 20.sp,
                    color: colorOfChoice,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: const Divider(),
                ),
                Text(
                  controller.student.value.isMale ? "طوله" : "طولها",
                  textAlign: TextAlign.center,
                  style: ProjectFonts.headlineSmall().copyWith(
                    fontSize: 22.sp,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AddVerticalSpacing(value: 10.h),
                Text(
                  "${controller.medicalRecord.studentHight.toStringAsFixed(0)} CM",
                  style: ProjectFonts.headlineSmall().copyWith(
                    fontSize: 20.sp,
                    color: colorOfChoice,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ));
    });
  }
}
