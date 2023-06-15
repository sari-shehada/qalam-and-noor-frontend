import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../configs/styles.dart';
import '../controllers/settings_page_controller.dart';
import 'widgets/profile_account_information_widget.dart';
import 'widgets/profile_address_widget.dart';
import 'widgets/profile_image_widget.dart';
import 'widgets/profile_info_widget.dart';
import 'widgets/profile_work_information_widget.dart';
import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../controllers/account_controller.dart';

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
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ProfileImageWidget(),
                      ),
                      Expanded(
                        flex: 3,
                        child: ProfileInfoWidget(),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(30.w),
                    margin: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          GlobalStyles.globalBorderRadius),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF393939).withOpacity(.06),
                          blurRadius: 60,
                          offset: const Offset(0, 30),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Expanded(
                          child: ProfileWorkInfo(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 50.h, horizontal: 10.w),
                          child: Container(
                            height: 1.h,
                            color: Colors.grey,
                          ),
                        ),
                        const Expanded(
                          child: ProfileAddress(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: AccountInfoWidget(),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: colorScheme.background,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
