import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../configs/fonts.dart';
import '../../../../tools/ui_tools/ui_tools.dart';

class MedicalsManagementTabBarItem extends StatelessWidget {
  const MedicalsManagementTabBarItem({
    super.key,
    required this.title,
    this.toolTipMessage,
    required this.iconData,
    required this.currentIndex,
    required this.itemIndex,
  });

  final String title;
  final String? toolTipMessage;
  final IconData iconData;
  final Rx<int> currentIndex;
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTipMessage,
      waitDuration: 900.milliseconds,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Obx(
          () => Row(
            children: [
              FaIcon(
                iconData,
                size: 35,
                color: currentIndex.value == itemIndex
                    ? Get.theme.colorScheme.primary
                    : Colors.blueGrey[800],
              ),
              AddHorizontalSpacing(value: 20.w),
              Text(
                title,
                style: ProjectFonts.titleLarge().copyWith(
                  color: currentIndex.value == itemIndex
                      ? Get.theme.colorScheme.primary
                      : Colors.blueGrey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
