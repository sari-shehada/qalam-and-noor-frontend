import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/pages/account_settings_page/controllers/settings_page_controller.dart';
import 'package:kalam_noor/tools/logic_tools/datetime_helper.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsPageController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconLabelItem(
          iconData: FontAwesomeIcons.cakeCandles,
          label: DateTimeHelper.getDateWithoutTime(
            controller.employee.value.dateOfBirth,
          ),
          toolTip: 'تاريخ الميلاد',
        ),
        AddVerticalSpacing(value: 15.h),
        //TODO:
        IconLabelItem(
          iconData:
              controller.employee.value.isMale ? Icons.male : Icons.female,
          label: controller.employee.value.isMale ? 'ذكر' : 'أنثى',
          toolTip: 'الجنس',
        ),
        AddVerticalSpacing(value: 15.h),
        IconLabelItem(
          iconData: FontAwesomeIcons.locationDot,
          label: controller.employee.value.placeOfBirth,
          toolTip: 'مكان الميلاد',
        ),
      ],
    );
  }
}

class IconLabelItem extends StatelessWidget {
  const IconLabelItem({
    super.key,
    required this.iconData,
    required this.label,
    this.toolTip,
  });

  final IconData iconData;
  final String? toolTip;
  final String label;
  @override
  Widget build(BuildContext context) {
    if (toolTip != null) {
      return Tooltip(
        message: toolTip,
        child: _buildChild(),
      );
    }
    return _buildChild();
  }

  Widget _buildChild() {
    return Row(
      children: [
        FaIcon(
          iconData,
          color: Get.theme.colorScheme.primary,
          size: 30.sp,
        ),
        AddHorizontalSpacing(value: 25.w),
        Text(
          label,
          style: ProjectFonts.headlineSmall().copyWith(
            color: Get.theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
