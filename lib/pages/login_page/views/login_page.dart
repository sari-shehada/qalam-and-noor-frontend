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
    LoginPageController loginPageController = Get.find();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          lightColorScheme.primary,
          lightColorScheme.primaryContainer
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            decoration: BoxDecoration(
              //TODO: Refactor this color
              color: const Color(0xFFEFF5FF).withOpacity(.7),
              borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //     offset: const Offset(0, 3),
              //     color: lightColorScheme.shadow.withOpacity(.08),
              //     blurRadius: 12,
              //   ),
              // ],
            ),
            width: 380,
            height: 680,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  GlobalAssets.appLogoPath,
                  height: 150,
                ),
                const AddVerticalSpacing(value: 40),
                //TODO: Add text styles and change the style of this widget
                Text('مرحبا بك', style: ProjectFonts.headlineSmall),
                const AddVerticalSpacing(value: 100),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: HintedTextField(
                    hintText: 'اسم المستخدم',
                    textAlign: TextAlign.center,
                    controller: loginPageController.userNameField,
                    fillColor: lightColorScheme.surface.withOpacity(.4),
                  ),
                ),
                const AddVerticalSpacing(value: 20),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: HintedTextField(
                    hintText: 'كلمة السر',
                    textAlign: TextAlign.center,
                    controller: loginPageController.passwordField,
                    fillColor: lightColorScheme.surface.withOpacity(.4),
                  ),
                ),
                const AddVerticalSpacing(value: 35),
                CallToActionButton(
                  label: 'تسجيل الدخول',
                  onTap: () => loginPageController.login(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
