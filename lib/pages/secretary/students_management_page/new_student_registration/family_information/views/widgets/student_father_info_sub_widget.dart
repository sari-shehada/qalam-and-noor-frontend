import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';

import '../../../../../../../configs/fonts.dart';
import '../../../../../../../models/enums.dart';
import '../../../../../../../tools/ui_tools/labeled_widget.dart';
import '../../controllers/widget_controllers/student_father_info_sub_widget_controller.dart';

class StudentFatherInfoSubWidget extends StatelessWidget {
  const StudentFatherInfoSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentFatherInfoSubWidgetController controller =
        Get.put(StudentFatherInfoSubWidgetController());
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
            () {
              return HintedTextField(
                hintText: '',
                controller: controller.lastNameController.controller,
                fillColor: controller.lastNameController.fillColor.value,
              );
            },
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'اسم الأب',
          child: Obx(
            () {
              return HintedTextField(
                hintText: '',
                controller: controller.fatherNameController.controller,
                fillColor: controller.fatherNameController.fillColor.value,
              );
            },
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'اسم الأم',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller: controller.motherNameController.controller,
              fillColor: controller.motherNameController.fillColor.value,
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'المهنة',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller: controller.careerController.controller,
              fillColor: controller.careerController.fillColor.value,
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'مكان الإقامة',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller: controller.placeOfResidenceController.controller,
              fillColor: controller.placeOfResidenceController.fillColor.value,
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'رقم القيد',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller: controller.tieNumberController.controller,
              fillColor: controller.tieNumberController.fillColor.value,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'مكان القيد',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller: controller.tiePlaceController.controller,
              fillColor: controller.tiePlaceController.fillColor.value,
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
              firstDate: DateTime(1950),
              initialDate: DateTime(1980),
              lastDate: DateTime.now(),
              onDateChanged: (DateTime value) =>
                  controller.changeDateOfBirth(value),
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'الديانة',
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: Get.theme.colorScheme.primaryContainer.withOpacity(.5),
              ),
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: DropdownButton<Religion>(
                value: controller.religion.value,
                onChanged: (value) => controller.changeReligion(value),
                borderRadius: BorderRadius.circular(14.r),
                elevation: 5,
                dropdownColor: Get.theme.colorScheme.primaryContainer,
                style: TextStyle(
                  fontFamily: ProjectFonts.fontFamily,
                  fontSize: 24.sp,
                  color: Get.theme.colorScheme.primary,
                ),
                isExpanded: true,
                icon: const SizedBox.shrink(),
                underline: const SizedBox.shrink(),
                items: Religion.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 30.w,
                          ),
                          child: Text(religionAsString[e]!),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'أمانة السجل المدني',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller:
                  controller.civilRegisterSecretaryController.controller,
              fillColor:
                  controller.civilRegisterSecretaryController.fillColor.value,
            ),
          ),
        ),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'الحاة التعليمية',
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: Get.theme.colorScheme.primaryContainer.withOpacity(.5),
              ),
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: DropdownButton<EducationalStatus>(
                value: controller.educationalStatus.value,
                onChanged: (value) => controller.changeEducationalStatus(value),
                borderRadius: BorderRadius.circular(14.r),
                elevation: 5,
                dropdownColor: Get.theme.colorScheme.primaryContainer,
                style: TextStyle(
                  fontFamily: ProjectFonts.fontFamily,
                  fontSize: 24.sp,
                  color: Get.theme.colorScheme.primary,
                ),
                isExpanded: true,
                icon: const SizedBox.shrink(),
                underline: const SizedBox.shrink(),
                items: EducationalStatus.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 30.w,
                          ),
                          child: Text(educationalStatusAsString[e]!),
                        ),
                      ),
                    )
                    .toList(),
              ),
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
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'العنوان الدائم',
          child: Obx(
            () => HintedTextField(
              hintText: '',
              controller: controller.permanentAddressController.controller,
              fillColor: controller.permanentAddressController.fillColor.value,
            ),
          ),
        ),
        AddVerticalSpacing(value: 30.h),
        CustomFilledButton(
          onTap: () => controller.toNextPage(),
          child: 'التالي',
        )
      ],
    );
  }
}
