import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../tools/ui_tools/labeled_widget.dart';
import '../../controllers/widget_controllers/student_responsible_person_info_sub_widget_controller.dart';

class StudentResponsiblePersonInfoSubWidget extends StatelessWidget {
  const StudentResponsiblePersonInfoSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentResponsiblePersonInfoSubWidgetController controller =
        Get.put(StudentResponsiblePersonInfoSubWidgetController());
    return ListView(
      padding: EdgeInsets.only(bottom: 70.h, left: 30.w, right: 30.w),
      children: [
        LabeledWidget(
          label: 'الاسم الأول',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller: controller.firstNameController.controller,
              fillColor: controller.firstNameController.fillColor.value,
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'اللقب',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller: controller.lastNameController.controller,
              fillColor: controller.lastNameController.fillColor.value,
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'العلاقة بالطالب',
          child: Obx(
            () => HintedTextField(
              hintText: 'عم ، عمة ، خال...',
              controller: controller.relationToStudentController.controller,
              fillColor: controller.relationToStudentController.fillColor.value,
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'مكان الولادة',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller: controller.placeOfBirthController.controller,
              fillColor: controller.placeOfBirthController.fillColor.value,
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'تاريخ الولادة',
          child: Obx(
            () => CalendarDatePicker(
              currentDate: controller.dateOfBirth.value,
              firstDate: DateTime(1970),
              initialDate: DateTime(1980),
              lastDate: DateTime.now(),
              onDateChanged: (DateTime value) =>
                  controller.changeDateOfBirth(value),
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'رقم الهاتف',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller: controller.phoneNumberController.controller,
              fillColor: controller.phoneNumberController.fillColor.value,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
        ),
        AddVerticalSpacing(value: 30.h),
        SizedBox(
          height: 60.h,
          child: Row(
            children: [
              Expanded(
                child: CustomOutlinedButton(
                    height: 55.h,
                    onTap: () => controller.toPreviousPage(),
                    child: 'السابق'),
              ),
              AddHorizontalSpacing(value: 20.w),
              Expanded(
                child: Obx(
                  () => CustomFilledButton(
                    height: 55.h,
                    onTap: () => controller.returnData(),
                    child: controller.responsiblePersonExists.value == true
                        ? 'اضافة معلومات الأسرة'
                        : 'تخطي واضافة المعلومات',
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
