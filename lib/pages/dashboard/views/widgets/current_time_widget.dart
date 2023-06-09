import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:kalam_noor/tools/logic_tools/datetime_helper.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class CurrentTimeWidget extends GetView<DashboardController> {
  const CurrentTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${controller.serverTime.value!.hour}:${controller.serverTime.value!.minute}',
            style: ProjectFonts.displayLarge(),
          ),
          AddVerticalSpacing(value: 20.h),
          Text(
            DateTimeHelper.getDateWithoutTime(controller.serverTime.value!),
            style: ProjectFonts.displaySmall(),
          ),
        ],
      ),
    );
  }
}
