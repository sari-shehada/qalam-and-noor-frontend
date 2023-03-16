import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';
import 'package:kalam_noor/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:kalam_noor/pages/dashboard/views/widgets/dashboard_card.dart';

import '../../../configs/fonts.dart';
import '../../../configs/project_themes.dart';
import '../../../tools/ui_tools/ui_tools.dart';

class DashboardContentPage extends StatelessWidget {
  const DashboardContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    AccountController accountController = Get.find();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحباً, ${accountController.employee.firstName}',
              style: TextStyle(
                  fontFamily: ProjectFonts.fontFamily,
                  fontSize: 40,
                  color: lightColorScheme.primary),
            ),
            const AddVerticalSpacing(value: 30),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'البحث',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 30),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      filled: true,
                      fillColor: lightColorScheme.primaryContainer,
                    ),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox())
              ],
            ),
            const AddVerticalSpacing(value: 30),
            GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) => DashboardCard(
                dashboardDestinationCard:
                    dashboardController.dashboardDestinations[index],
                onTap: () => dashboardController.animateToDestination(index),
              ),
            )
          ],
        ),
      ),
    );
  }
}
