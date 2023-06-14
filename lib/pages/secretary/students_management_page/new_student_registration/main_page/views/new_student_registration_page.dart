import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../address_information/views/widgets/student_address_info_widget.dart';
import '../controllers/new_student_registration_controller.dart';
import '../../medical_information/views/widgets/student_medical_info_widget.dart';
import '../../personal_information/views/widgets/student_personal_info_widget.dart';
import '../../previous_school_information/views/widgets/student_previous_school_info_widget.dart';
import '../../../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';

import '../../enrolled_class_information/views/student_enrolled_class_info_widget.dart';
import '../../family_information/views/widgets/student_family_info_widget.dart';

class NewStudentRegistrationPage extends StatelessWidget {
  const NewStudentRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;

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
          buttonStatus: controller.buttonStatus,
          onTap: () => controller.registerStudent(),
        ),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding:
              EdgeInsets.only(left: 45.w, right: 45.w, top: 15.h, bottom: 35.h),
          child: Row(
            children: [
              Container(
                width: 860.w,
                padding: containerPadding,
                decoration: backContainerDecoration,
                child: const StudentPersonalInfoWidget(),
              ),
              AddHorizontalSpacing(value: 30.w),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 300.h,
                      width: double.infinity,
                      decoration: backContainerDecoration,
                      padding: containerPadding,
                      child: const StudentFamilyInfoWidget(),
                    ),
                    AddVerticalSpacing(value: 30.h),
                    Container(
                      height: 300.h,
                      width: double.infinity,
                      decoration: backContainerDecoration,
                      padding: containerPadding,
                      child: const StudentMedicalInfoWidget(),
                    ),
                    AddVerticalSpacing(value: 30.h),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: backContainerDecoration,
                              padding: containerPadding,
                              child: const StudentAddressInfoWidget(),
                            ),
                          ),
                          AddHorizontalSpacing(value: 30.w),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: backContainerDecoration,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15.h,
                                      horizontal: 20.w,
                                    ),
                                    child:
                                        const StudentPreviousSchoolInfoWidget(),
                                  ),
                                ),
                                AddVerticalSpacing(value: 20.h),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: backContainerDecoration,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15.h,
                                      horizontal: 20.w,
                                    ),
                                    child:
                                        const StudentEnrolledClassInfoWidget(),
                                  ),
                                ),
                              ],
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
