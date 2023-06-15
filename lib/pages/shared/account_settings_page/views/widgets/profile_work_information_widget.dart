import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../configs/fonts.dart';
import '../../../../../tools/logic_tools/datetime_helper.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/settings_page_controller.dart';

class ProfileWorkInfo extends StatelessWidget {
  const ProfileWorkInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsPageController controller = Get.find();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "معلومات العمل",
          style: ProjectFonts.headlineMedium(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WorkInfoSubCard(
              label: controller.jobTitle.name,
              toolTip: "المسمى الوظيفي",
              icon: FontAwesomeIcons.school,
            ),
            Container(
              height: 100.h,
              width: 1.w,
              color: Colors.grey,
            ),
            WorkInfoSubCard(
              label: controller.jobTitle.details,
              toolTip: "تفاصيل العمل",
              icon: FontAwesomeIcons.desktop,
            ),
            Container(
              height: 100.h,
              width: 1.w,
              color: Colors.grey,
            ),
            WorkInfoSubCard(
              label: DateTimeHelper.getDateWithoutTime(
                  controller.employee.value.startDate),
              toolTip: "تاريخ بدء العمل",
              icon: FontAwesomeIcons.businessTime,
            ),
          ],
        ),
      ],
    );
  }
}

class WorkInfoSubCard extends StatelessWidget {
  const WorkInfoSubCard({
    super.key,
    required this.label,
    required this.toolTip,
    required this.icon,
  });
  final String label;
  final String toolTip;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Tooltip(
      message: toolTip,
      child: Column(
        children: [
          FaIcon(
            icon,
            color: colorScheme.primary,
            size: 60.sp,
          ),
          AddVerticalSpacing(value: 15.h),
          Text(
            label,
            style: ProjectFonts.headlineSmall().copyWith(
              color: Get.theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
