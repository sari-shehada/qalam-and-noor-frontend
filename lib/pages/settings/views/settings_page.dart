import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';

import '../../../controllers/account_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController accountController = Get.find();
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'الملف الشخصي',
        iconData: FontAwesomeIcons.gear,
        backButtonEnabled: true,
        actionButton: CustomTintedButton(
          width: 200.w,
          onTap: () => Get.find<AccountController>().logout(),
          child: 'تسجيل الخروج',
          foregroundColor: colorScheme.error,
          backgroundColor: colorScheme.errorContainer,
        ),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Container(
              height: 300.h,
              decoration: BoxDecoration(
                color: themeData.scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 20.h),
                    blurRadius: 12,
                    color: colorScheme.primary.withOpacity(.09),
                  ),
                ],
              ),
              padding: EdgeInsetsDirectional.only(
                top: 30.h,
                bottom: 30.h,
                start: 120.w,
                end: 30.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 20,
                          color: Colors.black.withOpacity(.06),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8.0.h),
                    child: ClipOval(
                      child: Image.asset(
                        accountController.employee.getAvatarImage(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
