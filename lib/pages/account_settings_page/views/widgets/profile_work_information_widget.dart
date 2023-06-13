import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/account_settings_page/views/widgets/profile_info_widget.dart';
import '../../../../configs/fonts.dart';
import '../../../../tools/logic_tools/datetime_helper.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/settings_page_controller.dart';

class ProfileWorkInfo extends StatelessWidget {
  const ProfileWorkInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsPageController controller = Get.find();
    return Container(
      padding: EdgeInsets.all(30.w),
      margin: EdgeInsets.all(20.w),
      width: 410.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "معلومات العمل",
            style: ProjectFonts.headlineMedium(),
          ),
          AddVerticalSpacing(value: 20.h),
          IconLabelItem(
            iconData: FontAwesomeIcons.desktop,
            label: controller.jobTitle.details,
          ),
          AddVerticalSpacing(value: 20.h),
          IconLabelItem(
            iconData: FontAwesomeIcons.school,
            label: controller.jobTitle.name,
            toolTip: "المسمى الوظيفي",
          ),
          AddVerticalSpacing(value: 20.h),
          IconLabelItem(
            iconData: FontAwesomeIcons.businessTime,
            label: DateTimeHelper.getDateWithoutTime(
                controller.employee.value.startDate),
            toolTip: "تاريخ بدء العمل",
          ),
        ],
      ),
    );
  }
}
