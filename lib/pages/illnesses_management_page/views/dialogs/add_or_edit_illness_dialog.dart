import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/illness.dart';
import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../tools/ui_tools/text_fields.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/dialog_controllers/add_or_edit_illness_dialog_controller.dart';

class AddOrEditIllnessDialog extends StatelessWidget {
  const AddOrEditIllnessDialog({super.key, this.illness});
  final Illness? illness;
  @override
  Widget build(BuildContext context) {
    AddOrEditIllnessController controller =
        Get.put(AddOrEditIllnessController(illness: illness));
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
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
              Obx(() {
                return Text(
                  controller.isEditMode.value == false
                      ? 'إضافة مرض'
                      : 'تعديل معلومات المرض',
                  style: textTheme.headlineMedium,
                );
              }),
              AddVerticalSpacing(value: 40.h),
              LabeledWidget(
                label: 'اسم المرض',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.illnessController,
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
                    child: Obx(
                      () => controller.isEditMode.value == false
                          ? CustomFilledButton(
                              buttonStatus: controller.buttonStatus,
                              height: 50.h,
                              onTap: () => controller.addIllness(),
                              child: 'اضافة',
                            )
                          : CustomFilledButton(
                              buttonStatus: controller.buttonStatus,
                              height: 50.h,
                              onTap: () => controller.updateIllnessInfo(),
                              child: 'إجراء التعديل',
                            ),
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
