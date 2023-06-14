import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/student_family_info_controller.dart';
import 'student_family_info_card.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';

import '../../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../../tools/ui_tools/labeled_widget.dart';

class StudentFamilyInfoWidget extends StatelessWidget {
  const StudentFamilyInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StudentFamilyInfoController controller = Get.find();
    return LabeledWidget(
      label: 'أسرة الطالب',
      labelTextStyle: Get.theme.textTheme.headlineMedium,
      mainAxisSize: MainAxisSize.max,
      child: Obx(
        () {
          if (controller.familyInfo.value != null) {
            return Column(
              children: [
                StudentFamilyInfoCard(
                  familyInfo: controller.familyInfo.value!,
                  clickable: false,
                ),
                AddVerticalSpacing(value: 20.h),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () => controller.selectStudentFamily(),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(2),
                      shadowColor: MaterialStateProperty.all(
                        Colors.black.withOpacity(.2),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Get.theme.scaffoldBackgroundColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'الاختيار مجددا',
                          style: Get.textTheme.labelLarge!
                              .copyWith(color: Get.theme.colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTintedButton(
                  height: 150.h,
                  useShadow: false,
                  onTap: () => controller.selectStudentFamily(),
                  child: 'إضافة معلومات أسرة الطالب',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
