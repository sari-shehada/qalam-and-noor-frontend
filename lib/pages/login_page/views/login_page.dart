import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/project_themes.dart';
import 'package:kalam_noor/pages/login_page/controllers/login_page_controller.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';

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
      backgroundColor: Color(0xFFE1EAF4),
      body: Center(
        child: Container(
          height: 590,
          width: 866,
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
                      height: 198,
                      width: 198,
                    ),
                    const AddVerticalSpacing(value: 60),
                    Text(
                      'قلم و نور',
                      style: TextStyle(
                        fontSize: 40,
                        color: colorScheme.primary,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 486,
                padding: EdgeInsets.symmetric(horizontal: 72),
                decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(27),
                      bottomLeft: Radius.circular(27),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabeledTextField(
                      textEditingController: loginPageController.userNameField,
                      titleColor: Colors.white,
                      label: 'اسم المستخدم',
                      fillColor: Color(0xFFBACCE2),
                    ),
                    const AddVerticalSpacing(value: 25),
                    LabeledTextField(
                      textEditingController: loginPageController.passwordField,
                      titleColor: Colors.white,
                      label: 'كلمة السر',
                      fillColor: Color(0xFFBACCE2),
                    ),
                    const AddVerticalSpacing(value: 50),
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
