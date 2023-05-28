import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';

class PsychologicalInstructorDashboard extends StatelessWidget {
  const PsychologicalInstructorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SizedBox.expand(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .3),
            child: CustomFilledButton(
              onTap: () => Get.find<AccountController>().logout(),
              child: 'تسجيل اخروج',
            ),
          ),
        ),
      ),
    );
  }
}
