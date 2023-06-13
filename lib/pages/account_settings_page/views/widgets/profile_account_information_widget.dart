import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/pages/account_settings_page/controllers/settings_page_controller.dart';
import 'package:kalam_noor/pages/account_settings_page/views/widgets/profile_info_widget.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class AccountInfoWidget extends StatelessWidget {
  const AccountInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsPageController controller = Get.find();
    return Container(
      width: 410.w,
      padding: EdgeInsets.all(20.w),
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 10.0,
              offset: Offset(0, 5),
            ),
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "معلومات تسجيل الدخول",
                style: ProjectFonts.headlineMedium(),
              ),
              AddHorizontalSpacing(value: 25.w),
              Tooltip(
                message: "تعديل المعلومات",
                child: IconButton(
                  onPressed: () => controller.changeLoginInfo(),
                  icon: Icon(
                    FontAwesomeIcons.pencil,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              )
            ],
          ),
          AddVerticalSpacing(value: 20.h),
          Obx(
            () => IconLabelItem(
                iconData: FontAwesomeIcons.user,
                label: "إسم المستخدم : ${controller.employee.value.userName}"),
          ),
          AddVerticalSpacing(value: 40.h),
          Obx(
            () => IconLabelItem(
              iconData: FontAwesomeIcons.userSecret,
              label: "كلمة السر : ${controller.employee.value.password}",
            ),
          ),
        ],
      ),
    );
  }
}
