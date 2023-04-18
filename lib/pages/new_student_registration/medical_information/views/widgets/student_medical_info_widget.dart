import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';

class StudentMedicalInfoWidget extends StatelessWidget {
  const StudentMedicalInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledWidget(
      label: 'المعلومات الصحية للطالب',
      labelTextStyle: Get.theme.textTheme.headlineMedium,
      child: const SizedBox.shrink(),
    );
  }
}
