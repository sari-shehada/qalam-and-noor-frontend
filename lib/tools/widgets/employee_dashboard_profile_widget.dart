import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../configs/fonts.dart';
import '../../controllers/account_controller.dart';
import '../../controllers/navigation_controller.dart';

class EmployeeDashboardProfileWidget extends StatelessWidget {
  const EmployeeDashboardProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Get.theme.colorScheme;
    final AccountController accountController = Get.find<AccountController>();
    return Container(
      height: 60.h,
      width: 450.w,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(200.w),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4.h),
            blurRadius: 10,
            color: colorScheme.shadow.withOpacity(.08),
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${accountController.employee.firstName} ${accountController.employee.lastName}',
            style: ProjectFonts.titleLarge(),
          ),
          IconButton(
            onPressed: () => NavigationController.toSettingsPage(),
            icon: Icon(
              Icons.settings,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
