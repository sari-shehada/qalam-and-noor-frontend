import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/controllers/dialog_controllers/add_student_family_info_dialog_controller.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/views/widgets/student_father_info_sub_widget.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/views/widgets/student_responsible_person_info_sub_widget.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../widgets/student_mother_info_sub_widget.dart';

class AddStudentFamilyInfoDialog extends StatelessWidget {
  const AddStudentFamilyInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final AddStudentFamilyInfoDialogController dialogController =
        Get.put(AddStudentFamilyInfoDialogController());
    return Center(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            padding: EdgeInsets.only(top: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
            ),
            height: 800.h,
            width: 800.w,
            child: Column(
              children: [
                Text(
                  'إضافة معلومات أسرة الطالب',
                  style: Get.textTheme.headlineMedium,
                ),
                AddVerticalSpacing(value: 20.h),
                Obx(
                  () => Text(
                    dialogController.sections[dialogController.pageIndex.value],
                    style: Get.textTheme.headlineSmall,
                  ),
                ),
                AddVerticalSpacing(value: 20.h),
                Expanded(
                  child: Stack(
                    fit: StackFit.loose,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: dialogController.tabController,
                        children: const [
                          StudentFatherInfoSubWidget(),
                          StudentMotherInfoSubWidget(),
                          StudentResponsiblePersonInfoSubWidget(),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 70.h,
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
                                Colors.white.withOpacity(0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              tileMode: TileMode.decal,
                            ),
                          ),
                        ),
                      ),
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
