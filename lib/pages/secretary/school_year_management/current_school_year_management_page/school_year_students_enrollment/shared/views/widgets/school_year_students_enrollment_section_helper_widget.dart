import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/classroom_selection/controllers/classroom_selection_sub_page_controller.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../controllers/school_year_students_enrollment_dialog_tab_controller.dart';

class SchoolYearStudentsEnrollmentSectionHelperWidget
    extends GetView<SchoolYearStudentsEnrollmentDialogTabController> {
  const SchoolYearStudentsEnrollmentSectionHelperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 45.h),
            blurRadius: 30,
            color: Get.theme.colorScheme.shadow.withOpacity(.05),
          ),
        ],
      ),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  controller
                      .sections[controller.currentPage.value].helperMessage,
                  style: ProjectFonts.headlineMedium(),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            controller.getStatusToDisplay(),
                            style: ProjectFonts.titleLarge().copyWith(
                              color: Get.theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Obx(
                            () {
                              if (Get.find<
                                          SchoolYearStudentsEnrollmentDialogTabController>()
                                      .currentPage
                                      .value <=
                                  1) {
                                return const SizedBox.shrink();
                              }
                              final ClassroomSelectionSubPageController
                                  classroomSelectionSubPageController =
                                  Get.find<
                                      ClassroomSelectionSubPageController>();
                              int numberOfMales =
                                  classroomSelectionSubPageController
                                      .getNumberOfMales();
                              int numberOfFemales =
                                  classroomSelectionSubPageController
                                      .getNumberOfFemales();
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.female,
                                          color: Colors.pink.shade300,
                                        ),
                                        AddHorizontalSpacing(value: 10.w),
                                        Text(
                                          numberOfFemales.toString(),
                                          style: ProjectFonts.titleLarge()
                                              .copyWith(
                                            color: Colors.pink.shade300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AddHorizontalSpacing(value: 20.w),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.male,
                                          color: Get.theme.colorScheme.primary,
                                        ),
                                        AddHorizontalSpacing(value: 10.w),
                                        Text(
                                          numberOfMales.toString(),
                                          style: ProjectFonts.titleLarge(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AddHorizontalSpacing(value: 20.w),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          classroomSelectionSubPageController
                                              .currentCapacity.value
                                              .toString(),
                                          style: ProjectFonts.titleLarge()
                                              .copyWith(
                                            color: Get.theme.colorScheme
                                                .onSurfaceVariant,
                                          ),
                                        ),
                                        Text(
                                          '/${classroomSelectionSubPageController.selectedClassroom.value!.maxCapacity}',
                                          style: ProjectFonts.titleLarge(),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
