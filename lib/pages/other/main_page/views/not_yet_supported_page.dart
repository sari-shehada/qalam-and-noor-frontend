import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../controllers/account_controller.dart';

class NotYetSupportedPage extends StatelessWidget {
  const NotYetSupportedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'الرئيسية',
        iconData: FontAwesomeIcons.house,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'لم يتم دعم هذا الحساب بعد',
              style: ProjectFonts.headlineMedium(),
            ),
            AddVerticalSpacing(value: 40.h),
            CustomOutlinedButton(
              onTap: () => Get.find<AccountController>().logout(),
              child: 'تسجيل الخروج',
            ),
          ],
        ),
      ),
    );
  }
}
