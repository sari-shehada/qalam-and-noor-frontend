import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';

class StudentPreviousSchoolInfoWidget extends StatelessWidget {
  const StudentPreviousSchoolInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LabeledWidget(
      label: 'المدرسة السابقة (اختياري)',
      labelTextStyle: Get.theme.textTheme.headlineMedium,
      child: const SizedBox.shrink(),
    );
  }
}
