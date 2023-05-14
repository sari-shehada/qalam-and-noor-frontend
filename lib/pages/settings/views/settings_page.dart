import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/settings/controllers/settings_page_controller.dart';
import 'package:kalam_noor/pages/settings/views/widgets/profile_image_widget.dart';
import 'package:kalam_noor/pages/settings/views/widgets/profile_info_widget.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../controllers/account_controller.dart';

class SettingsPage extends GetView<SettingsPageController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.getFullName(),
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
                bottom: 40.h,
                start: 110.w,
                end: 30.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ProfileImageWidget(),
                  AddHorizontalSpacing(value: 20.w),
                  const ProfileInfoWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
