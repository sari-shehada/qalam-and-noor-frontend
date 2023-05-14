import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/previous_schools/previous_schools.dart';

import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../tools/ui_tools/text_fields.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/dialog_controllers/add_or_edit_previous_school_dialog_controller.dart';

class AddOrEditPreviousSchoolDialog extends StatelessWidget {
  const AddOrEditPreviousSchoolDialog({
    super.key,
    this.previousSchool,
  });

  final PreviousSchool? previousSchool;
  @override
  Widget build(BuildContext context) {
    AddOrEditPreviousSchoolDialogController controller = Get.put(
        AddOrEditPreviousSchoolDialogController(
            previousSchool: previousSchool));

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
                      ? 'إضافة مدرسة'
                      : 'تعديل معلومات المدرسة',
                  style: ProjectFonts.headlineMedium(),
                );
              }),
              AddVerticalSpacing(value: 40.h),
              LabeledWidget(
                label: 'اسم المدرسة',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.previousSchoolController,
                ),
              ),
              AddVerticalSpacing(value: 20.h),
              LabeledWidget(
                label: 'تفاصيل إضافية (اختياري)',
                child: HintedTextField(
                  hintText: '(العنوان، رقم المدرسة...)',
                  controller: controller.detailsController,
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
                              onTap: () => controller.addPreviousSchool(),
                              child: 'اضافة',
                            )
                          : CustomFilledButton(
                              buttonStatus: controller.buttonStatus,
                              height: 50.h,
                              onTap: () =>
                                  controller.updatePreviousSchoolInfo(),
                              child: 'إجراء التعديل',
                            ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
