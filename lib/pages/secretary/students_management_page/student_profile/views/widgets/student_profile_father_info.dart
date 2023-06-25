import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/controllers/student_profile_controller.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/student_info_tab.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';
import '../student_profile.dart';

class StudentProfileFatherInfo extends GetView<StudentProfileController> {
  const StudentProfileFatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return StudentInfoTab(
      title: 'بيانات الأب',
      children: [
        SingleLineDetailWithIcon(
          detailText:
              '${controller.father.firstName} ${controller.father.lastName}',
          icon: FontAwesomeIcons.userTie,
          toolTipText: 'اسم الاب',
          iconSize: 30.sp,
        ),
        AddVerticalSpacing(value: 13.h),
        SingleLineDetailWithIcon(
          detailText: controller.father.career,
          icon: FontAwesomeIcons.briefcase,
          toolTipText: 'مهنة الاب',
          iconSize: 30.sp
        ),
        AddVerticalSpacing(value: 13.h),
        SingleLineDetailWithIcon(
          detailText: controller.father.phoneNumber,
          icon: FontAwesomeIcons.mobile,
          toolTipText: 'رقم الاب',
          iconSize: 30.sp
        ),
        AddVerticalSpacing(value: 13.h),
        SingleLineDetailWithIcon(
          detailText:
              '${controller.father.tiePlace} ${controller.father.tieNumber}',
          icon: FontAwesomeIcons.locationDot,
          toolTipText: 'قيد الاب',
          iconSize: 30.sp
        ),
        AddVerticalSpacing(value: 13.h),
        SingleLineDetailWithIcon(
          detailText: controller.father.permenantAddress,
          icon: FontAwesomeIcons.solidAddressCard,
          toolTipText: 'عنوان الاب الدائم',
          iconSize: 30.sp
        ),
      ],
    );
  }
}
