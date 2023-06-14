import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../models/educational/school_class.dart';
import '../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/dialog_controllers/add_or_edit_school_class_dialog_controller.dart';

class AddOrEditSchoolClassDialog extends StatelessWidget {
  const AddOrEditSchoolClassDialog({super.key, this.schoolClass});

  final SchoolClass? schoolClass;
  @override
  Widget build(BuildContext context) {
    AddOrEditSchoolClassDialogController controller =
        Get.put(AddOrEditSchoolClassDialogController(schoolClass: schoolClass));
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
                      ? 'إضافة مرحلة دراسية'
                      : 'تعديل معلومات المرحلة الدراسية',
                  style: textTheme.headlineMedium,
                );
              }),
              AddVerticalSpacing(value: 40.h),
              LabeledWidget(
                label: 'اسم المرحلة الدراسية',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.schoolClassController,
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
                              onTap: () => controller.addSchoolClass(),
                              child: 'اضافة',
                            )
                          : CustomFilledButton(
                              buttonStatus: controller.buttonStatus,
                              height: 50.h,
                              onTap: () => controller.updateSchoolClassInfo(),
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
