import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AddVerticalSpacing(value: 30),
              Row(
                children: [
                  CircleAvatar(
                    radius: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        accountController.employee
                            .getAvatarImage(circular: true),
                        height: 300,
                        width: 300,
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
                    height: 58,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: lightColorScheme.tertiary, width: 2),
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
                                    fontSize: 16,
                                    color: lightColorScheme.tertiary),
                              ),
                              const AddHorizontalSpacing(value: 20),
                              FaIcon(FontAwesomeIcons.doorOpen,
                                  color: lightColorScheme.tertiary)
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
