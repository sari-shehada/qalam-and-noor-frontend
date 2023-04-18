import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/controllers/student_medical_info_controller.dart';

import '../../../../../to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';

class StudentPersonalInfoWidget extends StatelessWidget {
  const StudentPersonalInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StudentMedicalInfoController controller = Get.find();
    return LabeledWidget(
      label: 'المعلومات الشخصية للطالب',
      labelTextStyle: Get.theme.textTheme.headlineMedium,
      child: SizedBox.shrink(),
    );
  }
}
