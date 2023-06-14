import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../models/educational/school_class.dart';

import '../../../../../../../configs/fonts.dart';
import '../../../../../../../configs/styles.dart';
import '../../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/dialog_controllers/add_student_enrolled_class_info_dialog_controller.dart';

class AddStudentEnrolledClassInfoDialog extends StatelessWidget {
  const AddStudentEnrolledClassInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    AddStudentEnrolledClassInfoController controller =
        Get.put(AddStudentEnrolledClassInfoController());
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
                'الصف المنتسب اليه',
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
                    label: 'الصف المنتسب اليه',
                    child: Container(
                      height: 49.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        color: Get.theme.colorScheme.primaryContainer
                            .withOpacity(.5),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsetsDirectional.only(end: 20.w),
                      child: DropdownButton<SchoolClass>(
                        value: controller.selectedClass.value,
                        onChanged: (value) => controller.selectClass(value),
                        borderRadius: BorderRadius.circular(14.r),
                        elevation: 5,
                        dropdownColor: Get.theme.colorScheme.primaryContainer,
                        style: TextStyle(
                          fontFamily: ProjectFonts.fontFamily,
                          fontSize: 24.sp,
                          color: Get.theme.colorScheme.primary,
                        ),
                        isExpanded: true,
                        underline: const SizedBox.shrink(),
                        items: controller.classes
                            .map(
                              (e) => DropdownMenuItem<SchoolClass>(
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
                            controller.selectedClass.value != null ? 1.0 : 0.0,
                        duration: 600.milliseconds,
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: CustomFilledButton(
                            height: 50.h,
                            onTap: () => controller.returnData(),
                            child: 'أختيار الصف'),
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
