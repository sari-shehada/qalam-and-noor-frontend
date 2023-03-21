import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/login_page_controller.dart';
import '../../../tools/ui_tools/text_fields.dart';

import '../../../configs/assets.dart';
import '../../../tools/ui_tools/buttons.dart';
import '../../../tools/ui_tools/ui_tools.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Get.theme.colorScheme;
    LoginPageController loginPageController = Get.find();
    return Scaffold(
      //TODO: Refactor
      backgroundColor: const Color(0xFFE1EAF4),
      body: Center(
        child: Container(
          height: 590.h,
          width: 866.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(27),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF393939).withOpacity(.05),
                  offset: const Offset(0, 30),
                  blurRadius: 60,
                ),
              ]),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      GlobalAssets.appLogoPath,
                      height: 198.h,
                      width: 198.h,
                    ),
                    const AddVerticalSpacing(value: 60),
                    Text(
                      'قلم و نور',
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: colorScheme.primary,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 486.w,
                padding: EdgeInsets.symmetric(horizontal: 72.w),
                decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(27.sp),
                      bottomLeft: Radius.circular(27.sp),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabeledTextField(
                      textEditingController: loginPageController.userNameField,
                      titleColor: Colors.white,
                      label: 'اسم المستخدم',
                      fillColor: const Color(0xFFBACCE2),
                    ),
                    AddVerticalSpacing(value: 25.h),
                    LabeledTextField(
                      textEditingController: loginPageController.passwordField,
                      titleColor: Colors.white,
                      label: 'كلمة السر',
                      fillColor: const Color(0xFFBACCE2),
                    ),
                    AddVerticalSpacing(value: 50.h),
                    CallToActionButton(
                      label: 'تسجيل الدخول',
                      labelColor: colorScheme.primary,
                      onTap: () => loginPageController.login(),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
