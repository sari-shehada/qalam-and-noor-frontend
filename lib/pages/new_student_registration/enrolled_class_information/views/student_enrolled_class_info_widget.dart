import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

import '../../../../tools/ui_tools/labeled_widget.dart';
import '../controllers/student_enrolled_class_info_widget_controller.dart';

class StudentEnrolledClassInfoWidget extends StatelessWidget {
  const StudentEnrolledClassInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentEnrolledClassInfoController controller =
        Get.put(StudentEnrolledClassInfoController());
    return LabeledWidget(
      label: 'الصف المنتسب اليه',
      labelTextStyle: ProjectFonts.headlineSmall(),
      spacing: 20.h,
      child: Obx(
        () {
          if (controller.enrolledClass.value == null) {
            return Expanded(
              child: CustomFilledButton(
                onTap: () => controller.selectEnrolledClass(),
                child: 'اختيار صف',
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
                  onTap: () => controller.selectEnrolledClass(),
                  borderRadius:
                      BorderRadius.circular(GlobalStyles.globalBorderRadius),
                  child: Center(
                    child: Text(
                      controller.enrolledClass.value!.name,
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
