import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';

import '../../../configs/project_themes.dart';
import '../../../configs/styles.dart';
import '../../../controllers/account_controller.dart';
import '../../../dummy_methods.dart';
import '../../../tools/ui_tools/ui_tools.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController accountController = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'الملف الشخصي',
        iconData: FontAwesomeIcons.gear,
        backButtonEnabled: true,
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddVerticalSpacing(value: 30.h),
              Row(
                children: [
                  CircleAvatar(
                    radius: 120.r,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.h),
                      child: Image.asset(
                        accountController.employee
                            .getAvatarImage(circular: true),
                        height: 300.h,
                        width: 300.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 58.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: lightColorScheme.tertiary, width: 2.w),
                      borderRadius: BorderRadius.circular(
                          GlobalStyles.globalBorderRadius),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(
                          GlobalStyles.globalBorderRadius),
                      child: InkWell(
                        onTap: () => logout(),
                        borderRadius: BorderRadius.circular(
                            GlobalStyles.globalBorderRadius),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'تسجيل الخروج',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: lightColorScheme.tertiary),
                              ),
                              AddHorizontalSpacing(value: 20.w),
                              FaIcon(
                                FontAwesomeIcons.doorOpen,
                                color: lightColorScheme.tertiary,
                                size: 25.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
