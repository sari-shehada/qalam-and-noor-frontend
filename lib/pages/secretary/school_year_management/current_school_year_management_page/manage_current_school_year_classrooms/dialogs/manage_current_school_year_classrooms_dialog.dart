import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/manage_current_school_year_classrooms/dialog_controllers/classrooms_selection_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/manage_current_school_year_classrooms/dialog_controllers/manage_current_school_year_classrooms_dialog_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/manage_current_school_year_classrooms/dialogs/dialog_widgets/classes_selection_list_widget.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../../tools/ui_tools/buttons.dart';
import 'dialog_widgets/classrooms_selection_list_widget.dart';

class ManageCurrentSchoolYearClassroomsDialog extends StatelessWidget {
  const ManageCurrentSchoolYearClassroomsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    OpenNewClassroomsDialogController dialogController = Get.put(
      OpenNewClassroomsDialogController(),
    );
    Get.put(
      ClassroomsSelectionController(),
    );
    final ColorScheme colorScheme = Get.theme.colorScheme;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 700.h,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15.h),
                        blurRadius: 30,
                        color: colorScheme.shadow.withOpacity(.09),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.cancel,
                          size: 35.sp,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      AddHorizontalSpacing(value: 20.w),
                      Text(
                        'إدارة الشعب ضمن العام الدراسي',
                        style: ProjectFonts.titleLarge(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 45,
                        child: ClassesSelectionList(),
                      ),
                      VerticalDivider(
                        indent: 20.h,
                        endIndent: 20.h,
                        width: 0,
                      ),
                      const Expanded(
                        flex: 65,
                        child: ClassroomsSelectionList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15.h),
                        blurRadius: 30,
                        color: colorScheme.shadow.withOpacity(.09),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomOutlinedButton(
                          height: 50.h,
                          onTap: () => Get.back(),
                          child: 'إلغاء الاجراء',
                          outlineColor: Colors.redAccent,
                        ),
                      ),
                      AddHorizontalSpacing(value: 20.w),
                      Expanded(
                        child: Obx(
                          () {
                            ClassroomsSelectionController controller =
                                Get.find<ClassroomsSelectionController>();
                            bool isClickable =
                                controller.toBeClosedClassrooms.isNotEmpty ||
                                    controller.toBeOpenedClassrooms.isNotEmpty;
                            return AnimatedOpacity(
                              duration: 300.milliseconds,
                              opacity: isClickable ? 1 : 0,
                              child: CustomFilledButton(
                                buttonStatus: dialogController.buttonStatus,
                                height: 50.h,
                                onTap: () => dialogController.applyChanges(),
                                child: 'اجراء التعديلات',
                              ),
                            );
                          },
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
