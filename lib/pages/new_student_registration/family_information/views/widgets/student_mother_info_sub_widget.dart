import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../configs/fonts.dart';
import '../../../../../models/enums.dart';
import '../../../../../tools/ui_tools/labeled_widget.dart';
import '../../controllers/widget_controllers/student_mother_info_sub_widget_controller.dart';

class StudentMotherInfoSubWidget extends StatelessWidget {
  const StudentMotherInfoSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentMotherInfoSubWidgetController controller =
        Get.put(StudentMotherInfoSubWidgetController());
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
            )),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
            label: 'اللقب',
            child: Obx(
              () => HintedTextField(
                hintText: '',
                controller: controller.lastNameController.controller,
                fillColor: controller.lastNameController.fillColor.value,
              ),
            )),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
            label: 'اسم الأب',
            child: Obx(
              () => HintedTextField(
                hintText: '',
                controller: controller.fatherNameController.controller,
                fillColor: controller.fatherNameController.fillColor.value,
              ),
            )),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
            label: 'اسم الأم',
            child: Obx(
              () => HintedTextField(
                hintText: '',
                controller: controller.motherNameController.controller,
                fillColor: controller.motherNameController.fillColor.value,
              ),
            )),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
          label: 'هل تعيش مع الأب؟',
          child: Obx(
            () {
              return AnimatedContainer(
                decoration: BoxDecoration(
                  color: controller.doesLiveWithHusband.value == true
                      ? Colors.greenAccent.shade700
                      : Colors.redAccent,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                duration: const Duration(milliseconds: 400),
                child: Material(
                  borderRadius: BorderRadius.circular(14.r),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14.r),
                    splashColor: Colors.transparent,
                    onTap: () => controller.toggleLivesWithHusband(),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        child: Center(
                          child: Text(
                            controller.doesLiveWithHusband.value == true
                                ? 'نعم'
                                : 'لا',
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.white,
                            ),
                          ),
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
            label: 'المهنة',
            child: Obx(
              () => HintedTextField(
                hintText: '',
                controller: controller.careerController.controller,
                fillColor: controller.careerController.fillColor.value,
              ),
            )),
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
            )),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
            label: 'مكان القيد',
            child: Obx(
              () => HintedTextField(
                hintText: '',
                controller: controller.tiePlaceController.controller,
                fillColor: controller.tiePlaceController.fillColor.value,
              ),
            )),
        AddVerticalSpacing(value: 15.h),
        LabeledWidget(
            label: 'مكان الولادة',
            child: Obx(
              () => HintedTextField(
                hintText: '',
                controller: controller.placeOfBirthController.controller,
                fillColor: controller.placeOfBirthController.fillColor.value,
              ),
            )),
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
          label: 'الحالة التعليمية',
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
                child: CustomFilledButton(
                  height: 55.h,
                  onTap: () => controller.toNextPage(),
                  child: 'التالي',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
