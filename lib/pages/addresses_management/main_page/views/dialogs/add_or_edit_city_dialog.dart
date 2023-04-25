// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';

import '../../../../../models/address/city.dart';
import '../../../../../tools/ui_tools/buttons.dart';
import '../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/dialog_controllers/add_or_edit_city_dialog_controller.dart';

class AddOrEditCityDialog extends StatelessWidget {
  const AddOrEditCityDialog({super.key, this.city});

  final City? city;
  @override
  Widget build(BuildContext context) {
    AddOrEditCityDialogController controller =
        Get.put(AddOrEditCityDialogController(city: city));
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
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
                      ? 'إضافة مدينة'
                      : 'تعديل معلومات المدينة',
                  style: textTheme.headlineMedium,
                );
              }),
              AddVerticalSpacing(value: 40.h),
              LabeledWidget(
                label: 'اسم المدينة',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.cityController,
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
                              onTap: () => controller.addCity(),
                              child: 'اضافة',
                            )
                          : CustomFilledButton(
                              buttonStatus: controller.buttonStatus,
                              height: 50.h,
                              onTap: () => controller.updateCityInfo(),
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
