import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/views/widgets/student_info_tab.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../tools/logic_tools/datetime_helper.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/student_profile_controller.dart';

class StudentMainInfo extends GetView<StudentProfileController> {
  const StudentMainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return StudentInfoTab(
      title: 'البيانات الشخصية',
      children: [
        const Spacer(),
        _SingleLineDetailWithIcon(
          icon: controller.student.value.isMale ? Icons.male : Icons.female,
          detailText: controller.student.value.isMale ? 'ذكر' : 'انثى',
          toolTipText: "الجنس",
          iconColor: controller.student.value.isMale ? null : Colors.pink[300],
          iconSize: 40,
        ),
        AddVerticalSpacing(value: 13.h),
        _SingleLineDetailWithIcon(
          icon: FontAwesomeIcons.cakeCandles,
          detailText: DateTimeHelper.getDateWithoutTime(
            controller.student.value.dateOfBirth,
          ),
          toolTipText: "تاريخ الميلاد",
        ),
        AddVerticalSpacing(value: 13.h),
        _SingleLineDetailWithIcon(
          icon: FontAwesomeIcons.phoneFlip,
          detailText: controller.student.value.landLine,
          toolTipText: "رقم الهاتف الأرضي",
        ),
        AddVerticalSpacing(value: 13.h),
        _SingleLineDetailWithIcon(
          icon: FontAwesomeIcons.squareWhatsapp,
          detailText: controller.student.value.whatsappPhoneNumber,
          toolTipText: 'رقم المحمول',
          iconSize: 40,
        ),
        const Spacer(),
      ],
    );
  }
}

class _SingleLineDetailWithIcon extends StatelessWidget {
  const _SingleLineDetailWithIcon({
    required this.detailText,
    required this.icon,
    required this.toolTipText,
    this.iconSize = 30,
    this.iconColor,
  });
  final String detailText;
  final IconData icon;
  final double iconSize;
  final String toolTipText;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTipText,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: iconSize.w,
            child: Center(
              child: FaIcon(
                icon,
                color: iconColor ?? Get.theme.colorScheme.primary,
                size: iconSize.sp,
              ),
            ),
          ),
          AddHorizontalSpacing(value: 12.w),
          SizedBox(
            width: 250.w,
            child: Text(
              detailText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ProjectFonts.titleMedium().copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 19.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
