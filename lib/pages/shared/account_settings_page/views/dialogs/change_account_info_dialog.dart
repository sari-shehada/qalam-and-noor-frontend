import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/pages/shared/account_settings_page/controllers/dialog_controllers/account_information_dialog_controller.dart';
import 'package:kalam_noor/pages/shared/account_settings_page/controllers/settings_page_controller.dart';
import '../../../../../tools/ui_tools/buttons.dart';
import '../../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';

class ChangeAccountInfoDialog extends StatelessWidget {
  const ChangeAccountInfoDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ChangeAccountInfoDialogController controller = Get.put(
      ChangeAccountInfoDialogController(
        employee: Get.find<SettingsPageController>().employee.value,
      ),
    );
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          width: 600.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.transparent,
          ),
          padding: EdgeInsetsDirectional.only(
              start: 30.w, end: 30.w, top: 20.h, bottom: 25.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "تعديل معلومات الحساب",
                style: ProjectFonts.headlineMedium(),
              ),
              AddVerticalSpacing(value: 40.h),
              LabeledWidget(
                label: 'اسم المستخدم',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.userNameController,
                ),
              ),
              AddVerticalSpacing(value: 20.h),
              LabeledWidget(
                label: 'كلمة السر',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.passwordController,
                ),
              ),
              AddVerticalSpacing(value: 30.h),
              Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      height: 50.h,
                      onTap: () => Get.back(),
                      child: 'إلغاء الإجراء',
                    ),
                  ),
                  AddHorizontalSpacing(value: 20.w),
                  Expanded(
                    child: CustomFilledButton(
                      buttonStatus: controller.buttonStatus,
                      height: 50.h,
                      onTap: () => controller.updateEmployeeInfo(),
                      child: 'إجراء التعديل',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
