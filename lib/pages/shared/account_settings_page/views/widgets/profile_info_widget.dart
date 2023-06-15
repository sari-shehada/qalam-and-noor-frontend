import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../configs/fonts.dart';
import '../../../../../configs/styles.dart';
import '../../controllers/settings_page_controller.dart';
import '../../../../../tools/logic_tools/datetime_helper.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsPageController controller = Get.find();
    return Container(
      padding: EdgeInsets.all(30.w),
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF393939).withOpacity(.06),
            blurRadius: 60,
            offset: const Offset(0, 30),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconLabelItem(
            iconData: FontAwesomeIcons.cakeCandles,
            label: DateTimeHelper.getDateWithoutTime(
              controller.employee.value.dateOfBirth,
            ),
            toolTip: 'تاريخ الميلاد',
          ),
          IconLabelItem(
            iconData:
                controller.employee.value.isMale ? Icons.male : Icons.female,
            label: controller.employee.value.isMale ? 'ذكر' : 'أنثى',
            toolTip: 'الجنس',
          ),
          IconLabelItem(
            iconData: FontAwesomeIcons.locationDot,
            label: controller.employee.value.placeOfBirth,
            toolTip: 'مكان الميلاد',
          ),
          IconLabelItem(
            iconData: FontAwesomeIcons.children,
            label: controller.employee.value.numberOfChildren.toString(),
            toolTip: 'عدد الأطفال',
          ),
        ],
      ),
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
