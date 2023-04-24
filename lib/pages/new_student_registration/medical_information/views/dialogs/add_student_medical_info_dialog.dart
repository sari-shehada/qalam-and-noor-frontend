import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/controllers/dialog_controllers/add_student_medical_info_dialog_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/views/widgets/student_basic_medical_info_sub_widget.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/views/widgets/student_vaccines_info_sub_widget.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

import '../../../../../tools/ui_tools/ui_tools.dart';
import '../widgets/student_illnesses_info_sub_widget.dart';

class AddStudentMedicalInfoDialog extends StatelessWidget {
  const AddStudentMedicalInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    AddStudentMedicalInfoDialogController dialogController =
        Get.put(AddStudentMedicalInfoDialogController());
    return Center(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        child: Obx(
          () => AnimatedContainer(
            width: 800.w,
            padding: EdgeInsets.only(top: 20.h),
            height: dialogController.dialogHeight.value,
            duration: 600.milliseconds,
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
            ),
            child: Column(
              children: [
                Text(
                  'المعلومات الصحية للطالب',
                  style: ProjectFonts.headlineMedium(),
                ),
                AddVerticalSpacing(value: 15.h),
                Text(
                  dialogController.sections[dialogController.pageIndex.value],
                  style: ProjectFonts.titleLarge(),
                ),
                AddVerticalSpacing(value: 25.h),
                Expanded(
                  child: Stack(
                    children: [
                      TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: dialogController.tabController,
                        children: const [
                          StudentBasicMedicalInfoSubWidget(),
                          StudentIllnessesInfoSubWidget(),
                          StudentVaccinesInfoSubWidget(),
                          // StudentPsychologicalStatusesInfoSubWidget(),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                  GlobalStyles.globalBorderRadius),
                              bottomRight: Radius.circular(
                                  GlobalStyles.globalBorderRadius),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomOutlinedButton(
                                    onTap: () =>
                                        dialogController.previousPage(),
                                    child: dialogController.pageIndex.value == 0
                                        ? 'إلغاء'
                                        : 'السابق',
                                    outlineColor:
                                        dialogController.pageIndex.value == 0
                                            ? Colors.redAccent
                                            : null,
                                  ),
                                ),
                                AddHorizontalSpacing(value: 20.w),
                                Expanded(
                                  child: CustomFilledButton(
                                    onTap: () => dialogController.nextPage(),
                                    child: dialogController.pageIndex.value ==
                                            dialogController.sections.length - 1
                                        ? 'إضافة المعلومات'
                                        : 'التالي',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
