import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/controllers/student_medical_info_controller.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

import '../../../../../to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';

class StudentMedicalInfoWidget extends StatelessWidget {
  const StudentMedicalInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StudentMedicalInfoController controller = Get.find();
    return LabeledWidget(
      label: 'المعلومات الصحية للطالب',
      labelTextStyle: Get.theme.textTheme.headlineMedium,
      child: controller.medicalInfo.value == null
          ? Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: CustomTintedButton(
                    onTap: () => controller.addMedicalInfo(),
                    child: 'تحديد المعلومات الصحية للطالب'),
              ),
            )
          //TODO:
          : const SizedBox.shrink(),
    );
  }
}
