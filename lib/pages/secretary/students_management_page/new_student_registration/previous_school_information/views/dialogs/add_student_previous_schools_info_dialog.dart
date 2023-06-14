import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/previous_schools/previous_schools.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';

import '../../../../../../../configs/fonts.dart';
import '../../../../../../../configs/styles.dart';
import '../../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/dialog_controllers/add_student_previous_schools_info_dialog_controller.dart';

class AddStudentPreviousSchoolInfo extends StatelessWidget {
  const AddStudentPreviousSchoolInfo({super.key});

  @override
  Widget build(BuildContext context) {
    AddStudentPreviousSchoolInfoDialogController controller =
        Get.put(AddStudentPreviousSchoolInfoDialogController());
    return Center(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        child: Container(
          width: 700.w,
          padding: EdgeInsets.only(
            top: 20.h,
            left: 25.w,
            right: 25.w,
            bottom: 20.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'المدرسة السابقة',
                style: ProjectFonts.headlineMedium(),
              ),
              AddVerticalSpacing(value: 25.h),
              Obx(
                () => Opacity(
                  opacity: controller.isProcessing.value == true ? 1.0 : 0.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: const LinearProgressIndicator(),
                  ),
                ),
              ),
              AddVerticalSpacing(value: 20.h),
              Obx(
                () => AnimatedOpacity(
                  duration: 600.milliseconds,
                  curve: Curves.fastLinearToSlowEaseIn,
                  opacity: controller.isProcessing.value == false ? 1.0 : 0.0,
                  child: LabeledWidget(
                    label: 'المدرسة السابقة',
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 49.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              color: Get.theme.colorScheme.primaryContainer
                                  .withOpacity(.5),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsetsDirectional.only(end: 20.w),
                            child: DropdownButton<PreviousSchool>(
                              value: controller.selectedSchool.value,
                              onChanged: (value) =>
                                  controller.selectSchool(value),
                              borderRadius: BorderRadius.circular(14.r),
                              elevation: 5,
                              dropdownColor:
                                  Get.theme.colorScheme.primaryContainer,
                              style: TextStyle(
                                fontFamily: ProjectFonts.fontFamily,
                                fontSize: 24.sp,
                                color: Get.theme.colorScheme.primary,
                              ),
                              isExpanded: true,
                              underline: const SizedBox.shrink(),
                              items: controller.previousSchools
                                  .map(
                                    (e) => DropdownMenuItem<PreviousSchool>(
                                      value: e,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          start: 30.w,
                                        ),
                                        child: Text(e.name),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        AddHorizontalSpacing(value: 10.w),
                        CustomFilledButton(
                            height: 49.h,
                            width: 120.w,
                            onTap: () => controller.addPreviousSchool(),
                            child: 'إضافة جديد'),
                      ],
                    ),
                  ),
                ),
              ),
              AddVerticalSpacing(value: 20.h),
              Obx(
                () => AnimatedOpacity(
                  duration: 600.milliseconds,
                  curve: Curves.fastLinearToSlowEaseIn,
                  opacity: controller.selectedSchool.value != null ? 1.0 : 0.0,
                  child: LabeledWidget(
                      label: 'ملاحظات (اختياري)',
                      child: HintedTextField(
                        hintText: '(سبب ترك المدرسة السابقة...)',
                        controller: controller.notesController,
                      )),
                ),
              ),
              AddVerticalSpacing(value: 40.h),
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
                      () => AnimatedOpacity(
                        opacity:
                            controller.selectedSchool.value != null ? 1.0 : 0.0,
                        duration: 600.milliseconds,
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: CustomFilledButton(
                            height: 50.h,
                            onTap: () => controller.returnData(),
                            child: 'أختيار المدرسة'),
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
