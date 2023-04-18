import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/controllers/dialog_controllers/student_family_info_dialog_controller.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class StudentFamilyInfoDialog extends StatelessWidget {
  const StudentFamilyInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Get.textTheme;
    final StudentFamilyInfoDialogController dialogController =
        Get.put(StudentFamilyInfoDialogController());
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 900.w,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'أسرة الطالب',
                style: textTheme.headlineMedium,
              ),
              AddVerticalSpacing(value: 25.h),
              Text(
                'قم بإدخال رقم القيد للطالب ثم الضغط على زر البحث ثم أختيار أسرة الطالب',
                style: textTheme.bodyLarge,
              ),
              AddVerticalSpacing(value: 20.h),
              Row(
                children: [
                  Expanded(
                    child: HintedTextField(
                      hintText: 'رقم القيد',
                      controller: dialogController.tieNumberEditingController,
                    ),
                  ),
                  AddHorizontalSpacing(value: 20.w),
                  CustomFilledButton(
                    width: 150.w,
                    onTap: () {},
                    child: 'البحث',
                  ),
                ],
              ),
              AddVerticalSpacing(value: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
