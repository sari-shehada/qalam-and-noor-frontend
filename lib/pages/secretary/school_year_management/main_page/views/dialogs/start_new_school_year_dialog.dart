import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_year.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/main_page/controllers/dialog_controllers/start_new_school_year_dialog_controller.dart';

import '../../../../../../configs/fonts.dart';
import '../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';

class StartNewSchoolYearDialog extends StatelessWidget {
  const StartNewSchoolYearDialog({super.key, required this.currentSchoolYear});
  final SchoolYear currentSchoolYear;
  @override
  Widget build(BuildContext context) {
    StartNewSchoolYearDialogController dialogController = Get.put(
      StartNewSchoolYearDialogController(
        currentSchoolYear: currentSchoolYear,
      ),
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
              Text(
                'بدء عام دراسي جديد',
                style: ProjectFonts.headlineMedium(),
              ),
              AddVerticalSpacing(value: 40.h),
              LabeledWidget(
                label: 'اسم العام الدراسي (أو تاريخه)',
                child: HintedTextField(
                  hintText: '',
                  controller: dialogController.schoolYearNameController,
                ),
              ),
              AddVerticalSpacing(value: 30.h),
              LabeledWidget(
                label: 'اسم الفصل الأول',
                child: HintedTextField(
                  hintText: '',
                  controller: dialogController.firstSemesterNameController,
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
                    child: CustomFilledButton(
                      buttonStatus: dialogController.buttonStatus,
                      height: 50.h,
                      onTap: () => dialogController.startSchoolYear(),
                      child: 'بدء العام الدراسي',
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
