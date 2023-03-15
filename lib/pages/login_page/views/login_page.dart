import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/project_themes.dart';
import 'package:kalam_noor/pages/login_page/controllers/login_page_controller.dart';

import '../../../configs/assets.dart';
import '../../../tools/ui_tools/buttons.dart';
import '../../../tools/ui_tools/ui_tools.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginPageController loginPageController = Get.find();
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          decoration: BoxDecoration(
              color: lightColorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 6),
                  color: Colors.black.withOpacity(.08),
                  blurRadius: 12,
                )
              ]),
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
              Text(
                'مرحبا بك',
                style:
                    TextStyle(fontSize: 35, color: lightColorScheme.tertiary),
              ),
              const AddVerticalSpacing(value: 120),
              const Directionality(
                  textDirection: TextDirection.ltr, child: TextField()),
              const AddVerticalSpacing(value: 25),
              const Directionality(
                  textDirection: TextDirection.ltr, child: TextField()),
              const AddVerticalSpacing(value: 30),
              CallToActionButton(
                label: 'تسجيل الدخول',
                onTap: () => loginPageController.login(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
