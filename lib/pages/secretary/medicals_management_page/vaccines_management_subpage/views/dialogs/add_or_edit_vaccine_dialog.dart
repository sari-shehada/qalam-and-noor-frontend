import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/vaccine.dart';
import '../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/dialog_controllers/add_or_edit_vaccine_dialog_controller.dart';

class AddOrEditVaccineDialog extends StatelessWidget {
  const AddOrEditVaccineDialog({super.key, this.vaccine});
  final Vaccine? vaccine;
  @override
  Widget build(BuildContext context) {
    AddOrEditVaccineDialogController controller =
        Get.put(AddOrEditVaccineDialogController(vaccine: vaccine));
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
                      ? 'إضافة لقاح'
                      : 'تعديل معلومات اللقاح',
                  style: textTheme.headlineMedium,
                );
              }),
              AddVerticalSpacing(value: 40.h),
              LabeledWidget(
                label: 'اسم اللقاح',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.vaccineController,
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
                              onTap: () => controller.addVaccine(),
                              child: 'اضافة',
                            )
                          : CustomFilledButton(
                              buttonStatus: controller.buttonStatus,
                              height: 50.h,
                              onTap: () => controller.updateVaccineInfo(),
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
