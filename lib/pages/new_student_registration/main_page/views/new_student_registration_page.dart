import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/previous_schools/student_previous_school.dart';
import 'package:kalam_noor/pages/new_student_registration/address_information/views/widgets/student_address_info_widget.dart';
import 'package:kalam_noor/pages/new_student_registration/main_page/controllers/new_student_registration_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/views/widgets/student_medical_info_widget.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/views/widgets/student_personal_info_widget.dart';
import 'package:kalam_noor/to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../family_information/views/widgets/student_family_info_widget.dart';

class NewStudentRegistrationPage extends StatelessWidget {
  const NewStudentRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;

    final NewStudentRegistrationController controller = Get.find();

    final BoxDecoration backContainerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14.r),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4.h),
          blurRadius: 40,
          color: colorScheme.shadow.withOpacity(.04),
        )
      ],
    );
    final EdgeInsets containerPadding =
        EdgeInsets.symmetric(vertical: 20.h, horizontal: 35.w);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تسجيل طالب جديد',
        iconData: FontAwesomeIcons.userPlus,
        backButtonEnabled: true,
        actionButton: CustomAppBarActionButton(
            label: 'تسجيل الطالب',
            onTap: () {
              controller.personalInfoSectionStatus.value =
                  NewStudentRegistrationSectionStatus.valid;
            }),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding:
              EdgeInsets.only(left: 45.w, right: 45.w, top: 15.h, bottom: 35.h),
          child: Row(
            children: [
              Obx(
                () => AnimatedContainer(
                  duration: NewStudentRegistrationControllerConstants
                      .animationDuration,
                  curve:
                      NewStudentRegistrationControllerConstants.animationCurve,
                  width: 860.w,
                  padding: containerPadding,
                  decoration: backContainerDecoration.copyWith(
                    color: controller.getSectionStatusColor(
                        controller.personalInfoSectionStatus.value),
                  ),
                  child: const StudentPersonalInfoWidget(),
                ),
              ),
              AddHorizontalSpacing(value: 30.w),
              Expanded(
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: NewStudentRegistrationControllerConstants
                          .animationDuration,
                      curve: NewStudentRegistrationControllerConstants
                          .animationCurve,
                      height: 300.h,
                      width: double.infinity,
                      decoration: backContainerDecoration.copyWith(
                        color: controller.getSectionStatusColor(
                            controller.familyInfoSectionStatus.value),
                      ),
                      padding: containerPadding,
                      child: const StudentFamilyInfoWidget(),
                    ),
                    AddVerticalSpacing(value: 30.h),
                    AnimatedContainer(
                      duration: NewStudentRegistrationControllerConstants
                          .animationDuration,
                      curve: NewStudentRegistrationControllerConstants
                          .animationCurve,
                      height: 300.h,
                      width: double.infinity,
                      decoration: backContainerDecoration.copyWith(
                        color: controller.getSectionStatusColor(
                            controller.medicalInfoSectionStatus.value),
                      ),
                      padding: containerPadding,
                      child: const StudentMedicalInfoWidget(),
                    ),
                    AddVerticalSpacing(value: 30.h),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: AnimatedContainer(
                              duration:
                                  NewStudentRegistrationControllerConstants
                                      .animationDuration,
                              curve: NewStudentRegistrationControllerConstants
                                  .animationCurve,
                              width: double.infinity,
                              decoration: backContainerDecoration.copyWith(
                                color: controller.getSectionStatusColor(
                                    controller.addressInfoSectionStatus.value),
                              ),
                              padding: containerPadding,
                              child: const StudentAddressInfoWidget(),
                            ),
                          ),
                          AddHorizontalSpacing(value: 30.w),
                          Expanded(
                            child: AnimatedContainer(
                              duration:
                                  NewStudentRegistrationControllerConstants
                                      .animationDuration,
                              curve: NewStudentRegistrationControllerConstants
                                  .animationCurve,
                              width: double.infinity,
                              decoration: backContainerDecoration.copyWith(
                                color: controller.getSectionStatusColor(
                                    controller
                                        .previousSchoolInfoSectionStatus.value),
                              ),
                              padding: containerPadding,
                              child: const StudentPersonalInfoWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
