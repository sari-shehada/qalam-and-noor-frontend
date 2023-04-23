import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/controllers/widget_controllers/stdudent_basic_medical_info_sub_widget_controller.dart';
import 'package:kalam_noor/to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class StudentBasicMedicalInfoSubWidget extends StatelessWidget {
  const StudentBasicMedicalInfoSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentBasicMedicalInfoSubWidgetController controller =
        Get.put(StudentBasicMedicalInfoSubWidgetController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // shrinkWrap: true,
        children: [
          LabeledWidget(
            label: 'الطول (بالسنتيمتر)',
            child: HintedTextField(
              hintText: '',
              //TODO:
              controller: TextEditingController(),
            ),
          ),
          AddVerticalSpacing(value: 20.h),
          LabeledWidget(
            label: 'الوزن (بالكيلوغرام)',
            child: HintedTextField(
              hintText: '',
              //TODO:
              controller: TextEditingController(),
            ),
          ),
          AddVerticalSpacing(value: 20.h),
          LabeledWidget(
            label: 'زمرة الدم',
            child: HintedTextField(
              hintText: '',
              //TODO:
              controller: TextEditingController(),
            ),
          ),
          AddVerticalSpacing(value: 20.h),
          LabeledWidget(
            label: 'عامل الارتصاص',
            child: HintedTextField(
              hintText: '',
              //TODO:
              controller: TextEditingController(),
            ),
          ),
          AddVerticalSpacing(value: 80.h),
        ],
      ),
    );
  }
}
