import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/controllers/student_medical_info_controller.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';

class StudentMedicalInfoWidget extends StatelessWidget {
  const StudentMedicalInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StudentMedicalInfoController controller = Get.find();
    return LabeledWidget(
      label: 'المعلومات الصحية للطالب',
      labelTextStyle: Get.theme.textTheme.headlineMedium,
      child: Obx(
        () => controller.medicalInfo.value == null
            ? Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: CustomTintedButton(
                      onTap: () => controller.addMedicalInfo(),
                      child: 'تحديد المعلومات الصحية للطالب'),
                ),
              )
            : Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(
                  GlobalStyles.globalBorderRadius,
                ),
                child: Tooltip(
                  message: 'إعادة تحديد',
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      GlobalStyles.globalBorderRadius,
                    ),
                    onTap: () => controller.addMedicalInfo(),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'الطول:',
                                style: ProjectFonts.titleLarge(),
                              ),
                              Text(
                                '${controller.medicalInfo.value!.record.studentHeight.toString()} سم',
                                style: ProjectFonts.titleLarge().copyWith(
                                  color: Get.theme.colorScheme.onBackground,
                                ),
                              ),
                            ],
                          ),
                          AddVerticalSpacing(value: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'الوزن:',
                                style: ProjectFonts.titleLarge(),
                              ),
                              Text(
                                '${controller.medicalInfo.value!.record.studentWeight.toString()} كغ',
                                style: ProjectFonts.titleLarge().copyWith(
                                  color: Get.theme.colorScheme.onBackground,
                                ),
                              ),
                            ],
                          ),
                          AddVerticalSpacing(value: 20.h),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 24.w),
                                  decoration: BoxDecoration(
                                    color: Get.theme.colorScheme
                                        .primaryContainer, //TODO:
                                    borderRadius: BorderRadius.circular(
                                        GlobalStyles.globalBorderRadius),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 7.h, right: 10.w),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: FaIcon(
                                            FontAwesomeIcons.virus,
                                            color: Colors.grey[700],
                                            size: 40.sp,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Text(
                                              controller.medicalInfo.value!
                                                  .illnesses.length
                                                  .toString(),
                                              style:
                                                  ProjectFonts.displayMedium(),
                                            ),
                                            AddVerticalSpacing(value: 10.h),
                                            Text(
                                              'حالة مرضية',
                                              style:
                                                  ProjectFonts.headlineSmall()
                                                      .copyWith(
                                                color: Colors.grey[700],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              AddHorizontalSpacing(value: 20.w),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 24.w),
                                  decoration: BoxDecoration(
                                    color: Get.theme.colorScheme
                                        .primaryContainer, //TODO:
                                    borderRadius: BorderRadius.circular(
                                        GlobalStyles.globalBorderRadius),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 7.h, right: 10.w),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: FaIcon(
                                            FontAwesomeIcons.syringe,
                                            color: Colors.grey[700],
                                            size: 40.sp,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Text(
                                              controller.medicalInfo.value!
                                                  .takenVaccines.length
                                                  .toString(),
                                              style:
                                                  ProjectFonts.displayMedium(),
                                            ),
                                            AddVerticalSpacing(value: 10.h),
                                            Text(
                                              'لقاح',
                                              style:
                                                  ProjectFonts.headlineSmall()
                                                      .copyWith(
                                                color: Colors.grey[700],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
