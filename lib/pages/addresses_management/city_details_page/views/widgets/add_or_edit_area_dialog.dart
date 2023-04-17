// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../tools/ui_tools/buttons.dart';
import '../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../../../new_student_registration/student_information/views/new_student_registration_page.dart';
import '../../controllers/dialog_controllers/add_or_edit_area_controller.dart';

class AddOrEditAreaDialog extends StatelessWidget {
  const AddOrEditAreaDialog({
    super.key,
    required this.argument,
  });

  final dynamic argument;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    AddOrEditAreaController controller = Get.put(
      AddOrEditAreaController(argument: argument),
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
              Obx(() {
                return Text(
                  controller.isEditMode.value == false
                      ? 'إضافة حي'
                      : 'تعديل معلومات الحي',
                  style: textTheme.headlineMedium,
                );
              }),
              AddVerticalSpacing(value: 40.h),
              LabeledWidget(
                label: 'اسم الحي',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.areaController,
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
                              height: 50.h,
                              onTap: () => controller.addArea(),
                              child: 'اضافة',
                            )
                          : CustomFilledButton(
                              height: 50.h,
                              onTap: () => controller.updateAreaInfo(),
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
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 40.w),
        width: 700.w,
        height: 320.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 80.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  padding: EdgeInsets.all(12.w),
                  icon: FaIcon(
                    FontAwesomeIcons.x,
                    size: 24.sp,
                  ),
                ),
                AddHorizontalSpacing(value: 20.w),
                Text(
                  'إضافة منطقة',
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddVerticalSpacing(value: 30.h),
              HintedTextField(
                hintText: 'اسم المنطقة',
                controller: controller.areaController,
              ),
              AddVerticalSpacing(value: 30.h),
              CustomFilledButton(
                onTap: () => controller.addArea(),
                child: 'اضافة منطقة',
              ),
              AddVerticalSpacing(value: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
