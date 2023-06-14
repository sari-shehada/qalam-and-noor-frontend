import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/agendas/job_title.dart';
import 'package:kalam_noor/pages/secretary/employees_management_page/add_employee_page/controllers/add_employee_controller.dart';
import 'package:kalam_noor/pages/secretary/employees_management_page/add_employee_page/controllers/widget_controllers/employee_registration_form_controller.dart';
import 'package:kalam_noor/tools/logic_tools/datetime_helper.dart';
import 'package:kalam_noor/tools/ui_tools/labeled_widget.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../../tools/ui_tools/buttons.dart';

class EmployeeRegistrationForm extends StatelessWidget {
  const EmployeeRegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AddEmployeeController parentController = Get.find();
    final EmployeeRegistrationFormController controller = Get.find();
    return ListView(
      controller: parentController.scrollController,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
      children: [
        LabeledWidget(
          label: 'المعلومات الشخصية',
          labelTextStyle: ProjectFonts.headlineSmall(),
          child: Column(
            children: [
              LabeledWidget(
                label: 'الاسم الأول',
                child: Obx(
                  () => HintedTextField(
                    fillColor: controller.firstNameController.fillColor.value,
                    controller: controller.firstNameController.controller,
                    hintText: '',
                  ),
                ),
              ),
              AddVerticalSpacing(value: 15.h),
              LabeledWidget(
                label: 'اللقب',
                child: Obx(
                  () => HintedTextField(
                    fillColor: controller.lastNameController.fillColor.value,
                    controller: controller.lastNameController.controller,
                    hintText: '',
                  ),
                ),
              ),
              AddVerticalSpacing(value: 15.h),
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
                      duration: const Duration(milliseconds: 650),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
              AddVerticalSpacing(value: 15.h),
              LabeledWidget(
                label: 'تاريخ الميلاد',
                child: Obx(
                  () => CustomOutlinedButton(
                    onTap: () => controller.selectDateOfBirth(),
                    child: controller.dateOfBirth.value == null
                        ? 'أختر تاريخاً'
                        : '${DateTimeHelper.getDateWithoutTime(
                            controller.dateOfBirth.value!,
                          )} (تغيير)',
                  ),
                ),
              ),
            ],
          ),
        ),
        AddVerticalSpacing(value: 20.h),
        const Divider(),
        AddVerticalSpacing(value: 20.h),
        LabeledWidget(
          label: 'المعلومات الأسرية',
          labelTextStyle: ProjectFonts.headlineSmall(),
          child: Column(
            children: [
              LabeledWidget(
                label: 'اسم الأب',
                child: Obx(
                  () => HintedTextField(
                    fillColor: controller.fatherNameController.fillColor.value,
                    controller: controller.fatherNameController.controller,
                    hintText: '',
                  ),
                ),
              ),
              AddVerticalSpacing(value: 15.h),
              LabeledWidget(
                label: 'اسم الأم',
                child: Obx(
                  () => HintedTextField(
                    fillColor: controller.motherNameController.fillColor.value,
                    controller: controller.motherNameController.controller,
                    hintText: '',
                  ),
                ),
              ),
              AddVerticalSpacing(value: 15.h),
              LabeledWidget(
                label: 'عدد الأولاد',
                child: Obx(
                  () => HintedTextField(
                    fillColor:
                        controller.numberOfChildrenController.fillColor.value,
                    controller:
                        controller.numberOfChildrenController.controller,
                    hintText: '',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ),
            ],
          ),
        ),
        AddVerticalSpacing(value: 20.h),
        const Divider(),
        AddVerticalSpacing(value: 20.h),
        LabeledWidget(
          label: 'معلومات التواصل',
          labelTextStyle: ProjectFonts.headlineSmall(),
          child: LabeledWidget(
            label: 'رقم الهاتف',
            child: Obx(
              () => HintedTextField(
                fillColor: controller.phoneNumberController.fillColor.value,
                controller: controller.phoneNumberController.controller,
                hintText: '',
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
          ),
        ),
        AddVerticalSpacing(value: 20.h),
        const Divider(),
        AddVerticalSpacing(value: 20.h),
        LabeledWidget(
          label: 'الشؤون الوظيفية',
          labelTextStyle: ProjectFonts.headlineSmall(),
          child: Column(
            children: [
              LabeledWidget(
                label: 'تاريخ الشروع بالعمل',
                child: Obx(
                  () => CustomOutlinedButton(
                    onTap: () => controller.selectStartDate(),
                    child: controller.startDate.value == null
                        ? 'أختر تاريخاً'
                        : '${DateTimeHelper.getDateWithoutTime(
                            controller.startDate.value!,
                          )} (تغيير)',
                  ),
                ),
              ),
              AddVerticalSpacing(value: 15.h),
              LabeledWidget(
                label: 'المسمى الوظيفي',
                child: Container(
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color:
                        Get.theme.colorScheme.primaryContainer.withOpacity(.5),
                  ),
                  padding: EdgeInsetsDirectional.only(end: 20.w),
                  alignment: Alignment.center,
                  child: Obx(
                    () {
                      return DropdownButton<JobTitle>(
                        value: controller.selectedJobTitle.value,
                        onChanged: (value) => controller.selectJobTitle(value),
                        borderRadius: BorderRadius.circular(14.r),
                        elevation: 5,
                        dropdownColor: Get.theme.colorScheme.primaryContainer,
                        style: TextStyle(
                          fontFamily: ProjectFonts.fontFamily,
                          fontSize: 24.sp,
                          color: Get.theme.colorScheme.primary,
                        ),
                        isExpanded: true,
                        underline: const SizedBox.shrink(),
                        hint: Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 30.w,
                          ),
                          child: const Text('أختر المسمى الوظيفي'),
                        ),
                        items: controller.jobTitles
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    start: 30.w,
                                  ),
                                  child: Text('${e.name} ${e.details}'),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        AddVerticalSpacing(value: 20.h),
        const Divider(),
        AddVerticalSpacing(value: 20.h),
        LabeledWidget(
          label: 'معلومات أخرى',
          labelTextStyle: ProjectFonts.headlineSmall(),
          child: Column(
            children: [
              LabeledWidget(
                label: 'العنوان',
                child: Obx(
                  () => CustomOutlinedButton(
                    onTap: () => controller.selectAddress(),
                    child: controller.selectedAddress.value == null
                        ? 'تحديد العنوان'
                        : '${controller.selectedAddress.value!.city.name}/${controller.selectedAddress.value!.area.name}/${controller.selectedAddress.value!.address.name} (تغيير)',
                  ),
                ),
              ),
              AddVerticalSpacing(value: 15.h),
              LabeledWidget(
                label: 'مكان الولادة',
                child: Obx(
                  () => HintedTextField(
                    fillColor:
                        controller.placeOfBirthController.fillColor.value,
                    controller: controller.placeOfBirthController.controller,
                    hintText: '',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
