import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';

class StudentAddressInfoWidget extends StatelessWidget {
  const StudentAddressInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledWidget(
      label: 'عنوان الطالب',
      labelTextStyle: Get.theme.textTheme.headlineMedium,
      child: const SizedBox.shrink(),
    );
  }
}
