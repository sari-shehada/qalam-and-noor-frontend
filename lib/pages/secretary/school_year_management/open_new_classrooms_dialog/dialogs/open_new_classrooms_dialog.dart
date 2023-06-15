import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/open_new_classrooms_dialog/dialog_controllers/open_new_classrooms_dialog_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/open_new_classrooms_dialog/dialogs/dialog_widgets/classes_selection_list.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class OpenNewClassroomsDialog extends StatelessWidget {
  const OpenNewClassroomsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      OpenNewClassroomsDialogController(),
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          size: 35.sp,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      AddHorizontalSpacing(value: 20.w),
                      Text(
                        'فتح شعب جديدة ضمن العام الدراسي',
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
                      Expanded(
                        flex: 65,
                        child: Container(),
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
