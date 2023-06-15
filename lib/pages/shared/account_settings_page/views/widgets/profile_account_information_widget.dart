import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import '../../../../../configs/fonts.dart';
import '../../../../../configs/styles.dart';
import '../../controllers/settings_page_controller.dart';
import 'profile_info_widget.dart';

class AccountInfoWidget extends StatelessWidget {
  const AccountInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsPageController controller = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 20.h),
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF393939).withOpacity(.06),
            blurRadius: 60,
            offset: const Offset(0, 30),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "معلومات تسجيل الدخول",
                style: ProjectFonts.headlineMedium(),
              ),
              AddHorizontalSpacing(value: 15.w),
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
          Obx(
            () => IconLabelItem(
                iconData: FontAwesomeIcons.userTie,
                label: "إسم المستخدم : ${controller.employee.value.userName}"),
          ),
          Obx(
            () => IconLabelItem(
              iconData: FontAwesomeIcons.lock,
              label: "كلمة السر : ${controller.employee.value.password}",
            ),
          ),
        ],
      ),
    );
  }
}
