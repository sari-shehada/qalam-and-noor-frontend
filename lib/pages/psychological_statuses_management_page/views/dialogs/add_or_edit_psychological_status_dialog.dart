import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/psychological_status.dart';
import 'package:kalam_noor/pages/psychological_statuses_management_page/controllers/dialog_controllers/add_or_edit_psychological_status_dialog_controller.dart';
import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../tools/ui_tools/text_fields.dart';
import '../../../../tools/ui_tools/ui_tools.dart';

class AddOrEditPsychologicalStatusDialog extends StatelessWidget {
  const AddOrEditPsychologicalStatusDialog(
      {super.key, this.psychologicalStatus});
  final PsychologicalStatus? psychologicalStatus;
  @override
  Widget build(BuildContext context) {
    AddOrEditPsychologicalStatusDialogController controller = Get.put(
        AddOrEditPsychologicalStatusDialogController(
            psychologicalStatus: psychologicalStatus));
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
                      ? 'إضافة حالة مزاجية'
                      : 'تعديل معلومات الحالة المزاجية',
                  style: textTheme.headlineMedium,
                );
              }),
              AddVerticalSpacing(value: 40.h),
              LabeledWidget(
                label: 'اسم الحالة',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.psychologicalStatusController,
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
                              onTap: () => controller.addPsychologicalStatus(),
                              child: 'اضافة',
                            )
                          : CustomFilledButton(
                              buttonStatus: controller.buttonStatus,
                              height: 50.h,
                              onTap: () =>
                                  controller.updatePsychologicalStatusInfo(),
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
