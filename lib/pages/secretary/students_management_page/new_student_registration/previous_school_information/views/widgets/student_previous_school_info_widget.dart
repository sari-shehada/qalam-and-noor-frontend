import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

import '../../../../../../../tools/ui_tools/labeled_widget.dart';
import '../../controllers/add_student_previous_school_info_widget_controller.dart';

class StudentPreviousSchoolInfoWidget extends StatelessWidget {
  const StudentPreviousSchoolInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentPreviousSchoolInfoController controller = Get.find();
    return LabeledWidget(
      label: 'المدرسة السابقة (اختياري)',
      labelTextStyle: ProjectFonts.headlineSmall(),
      spacing: 20.h,
      child: Obx(
        () {
          if (controller.studentPreviousSchoolInfo.value == null) {
            return Expanded(
              child: CustomFilledButton(
                onTap: () => controller.selectPreviousSchool(),
                child: 'اختيار مدرسة سابقة',
              ),
            );
          }
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(.2),
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
            ),
            alignment: Alignment.center,
            child: Material(
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
              color: Colors.transparent,
              child: Tooltip(
                message: 'إعادة الاختيار',
                child: InkWell(
                  onTap: () => controller.selectPreviousSchool(),
                  borderRadius:
                      BorderRadius.circular(GlobalStyles.globalBorderRadius),
                  child: Center(
                    child: Text(
                      controller
                          .studentPreviousSchoolInfo.value!.previousSchool.name,
                      style: ProjectFonts.labelLarge(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
