import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/controllers/student_profile_controller.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/student_profile.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/student_info_tab.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';

class StudentProfileMotherInfo extends GetView<StudentProfileController> {
  const StudentProfileMotherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return StudentInfoTab(
      title: 'بيانات الأم',
      children: [
        SingleLineDetailWithIcon(
            detailText:
                '${controller.mother.firstName} ${controller.mother.lastName}',
            icon: FontAwesomeIcons.userTie,
            toolTipText: 'اسم الأم',
            iconSize: 30.sp),
        AddVerticalSpacing(value: 13.h),
        SingleLineDetailWithIcon(
            detailText: controller.mother.career,
            icon: FontAwesomeIcons.briefcase,
            toolTipText: 'مهنة الأم',
            iconSize: 30.sp),
        AddVerticalSpacing(value: 13.h),
        SingleLineDetailWithIcon(
            detailText: controller.mother.phoneNumber,
            icon: FontAwesomeIcons.mobile,
            toolTipText: 'رقم الأم',
            iconSize: 30.sp),
        AddVerticalSpacing(value: 13.h),
        SingleLineDetailWithIcon(
            detailText:
                '${controller.mother.tiePlace} ${controller.mother.tieNumber}',
            icon: FontAwesomeIcons.locationDot,
            toolTipText: 'قيد الأم',
            iconSize: 30.sp),
        AddVerticalSpacing(value: 13.h),
        SingleLineDetailWithIcon(
            detailText: controller.mother.doesLiveWithHasband
                ? 'تعيش مع الأب'
                : '-----',
            icon: FontAwesomeIcons.solidAddressCard,
            toolTipText: 'عنوان الأم الدائم',
            iconSize: 30.sp),
      ],
    );
  }
}
