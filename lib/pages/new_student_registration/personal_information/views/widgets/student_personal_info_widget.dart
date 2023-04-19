import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../configs/fonts.dart';
import '../../../../../models/enums.dart';
import '../../../../../to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';
import '../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/student_personal_info_controller.dart';

class StudentPersonalInfoWidget extends StatelessWidget {
  const StudentPersonalInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StudentPersonalInfoController controller = Get.find();
    return LabeledWidget(
      label: 'المعلومات الشخصية للطالب',
      labelTextStyle: Get.theme.textTheme.headlineMedium,
      child: Expanded(
        child: ListView(
          // padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 400),
          shrinkWrap: true,
          children: [
            LabeledWidget(
              label: 'معلومات الطالب الاساسية',
              labelTextStyle: Get.textTheme.headlineSmall,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Divider(color: Colors.red),
                  LabeledWidget(
                    label: 'رقم سجل الطالب',
                    child: HintedTextField(
                      hintText: '',
                      controller: controller.publicRecordIdController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  LabeledWidget(
                    label: 'الاسم الأول',
                    child: HintedTextField(
                      controller: controller.firstNameController,
                      hintText: '',
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  LabeledWidget(
                    label: 'الجنس',
                    child: Obx(
                      () {
                        return AnimatedContainer(
                          decoration: BoxDecoration(
                            color: controller.isMale.value == true
                                ? Get.theme.colorScheme.primary
                                : Colors.pink[300],
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          duration: const Duration(milliseconds: 700),
                          child: Material(
                            borderRadius: BorderRadius.circular(14.r),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14.r),
                              splashColor: Colors.transparent,
                              onTap: () => controller.toggleGender(),
                              child: SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.isMale.value == true
                                            ? 'ذكر'
                                            : 'انثى',
                                        style: TextStyle(
                                          fontSize: 22.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      AddHorizontalSpacing(value: 30.w),
                                      Icon(
                                        controller.isMale.value == true
                                            ? Icons.male
                                            : Icons.female,
                                        size: 25.sp,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  LabeledWidget(
                    label: 'مكان الولادة',
                    child: HintedTextField(
                      controller: controller.placeOfBirthController,
                      hintText: '',
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: Get.theme.scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 30,
                          color: Colors.black.withOpacity(.07),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(25.w),
                    child: LabeledWidget(
                      label: 'تاريخ الولادة',
                      child: Obx(
                        () => CalendarDatePicker(
                          currentDate: controller.dateOfBirth.value,
                          firstDate: DateTime(2000),
                          initialDate: DateTime.now(),
                          lastDate: DateTime.now(),
                          onDateChanged: (DateTime value) =>
                              controller.changeDateOfBirth(value),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AddVerticalSpacing(value: 20.h),
            Divider(thickness: 1, color: Get.theme.primaryColor),
            AddVerticalSpacing(value: 20.h),
            LabeledWidget(
              label: 'معلومات الطالب المدنية',
              labelTextStyle: Get.textTheme.headlineSmall,
              child: Column(
                children: [
                  LabeledWidget(
                    label: 'الديانة',
                    child: Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Get.theme.colorScheme.primaryContainer
                              .withOpacity(.5),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: DropdownButton<Religion>(
                          value: controller.religion.value,
                          onChanged: (value) =>
                              controller.changeReligion(value),
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
                  AddVerticalSpacing(value: 20.h),
                  LabeledWidget(
                    label: 'رقم الواقعة',
                    child: HintedTextField(
                      hintText: '',
                      controller: controller.incidentNumberController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  AddVerticalSpacing(value: 30.h),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: Get.theme.scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 30,
                          color: Colors.black.withOpacity(.07),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(25.w),
                    child: LabeledWidget(
                      label: 'تاريخ الواقعة',
                      child: Obx(
                        () => CalendarDatePicker(
                          currentDate: controller.dateOfIncident.value,
                          firstDate: DateTime(2000),
                          initialDate: DateTime.now(),
                          lastDate: DateTime.now(),
                          onDateChanged: (DateTime value) =>
                              controller.changeDateOfIncident(value),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AddVerticalSpacing(value: 20.h),
            Divider(thickness: 1, color: Get.theme.primaryColor),
            AddVerticalSpacing(value: 20.h),
            LabeledWidget(
              label: 'معلومات التواصل بالطالب',
              labelTextStyle: Get.textTheme.headlineSmall,
              child: Column(
                children: [
                  LabeledWidget(
                    label: 'رقم الهاتف المحمول',
                    child: HintedTextField(
                      hintText: '',
                      controller: controller.phoneNumberController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  LabeledWidget(
                    label: 'رقم الواتساب',
                    child: HintedTextField(
                      hintText: '',
                      controller: controller.whatsappNumberController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  LabeledWidget(
                    label: 'رقم الهاتف الارضي',
                    child: HintedTextField(
                      hintText: '',
                      controller: controller.landlineController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AddVerticalSpacing(value: 20.h),
            Divider(thickness: 1, color: Get.theme.primaryColor),
            AddVerticalSpacing(value: 20.h),
            LabeledWidget(
              label: 'معلومات اضافية للطالب',
              labelTextStyle: Get.textTheme.headlineSmall,
              child: Column(
                children: [
                  AddVerticalSpacing(value: 20.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: Get.theme.scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 30,
                          color: Colors.black.withOpacity(.07),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(25.w),
                    child: LabeledWidget(
                      label: 'تاريخ الانضمام',
                      child: Obx(
                        () => CalendarDatePicker(
                          currentDate: controller.joinDate.value,
                          firstDate: DateTime(2000),
                          initialDate: DateTime.now(),
                          lastDate: DateTime.now(),
                          onDateChanged: (DateTime value) =>
                              controller.changeDateOfBirth(value),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
