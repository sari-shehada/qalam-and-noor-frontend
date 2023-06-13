import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/pages/students_management_page/controllers/students_display_controller.dart';
import 'package:kalam_noor/pages/students_management_page/views/widgets/students_table.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';
import '../../../tools/ui_tools/buttons.dart';
import '../../../tools/ui_tools/custom_appbar.dart';
import '../../../tools/ui_tools/custom_drop_down_menu.dart';
import '../../../tools/ui_tools/labeled_widget.dart';
import '../../../tools/ui_tools/loader_widget.dart';
import '../../../tools/ui_tools/ui_tools.dart';
import '../../../tools/widgets/empty_item_widget.dart';

class StudentsManagementPage extends StatelessWidget {
  const StudentsManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    StudentsManagementController studentsDisplayController =
        Get.put(StudentsManagementController());
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return CustomScaffold(
      floatingActionButton: CustomFilledButton(
        height: 74.h,
        width: 300.w,
        onTap: () => NavigationController.toAddNewStudentPage(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة طالب جديد',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                FaIcon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 28.sp,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: CustomAppBar(
        title: 'إدارة شؤون الطلاب',
        iconData: FontAwesomeIcons.graduationCap,
        actionButton: Row(
          children: [
            Text(
              'ترتيب حسب:',
              style: ProjectFonts.titleLarge(),
            ),
            AddHorizontalSpacing(value: 25.w),
            CustomDropDownButton(
              backgroundColor: colorScheme.primaryContainer,
              dropdownColor: colorScheme.primaryContainer,
              value: studentsDisplayController.currentSortingOption,
              items: StudentsSortingOption.values
                  .map((e) => DropdownMenuItem<StudentsSortingOption>(
                      value: e,
                      child: Text(vaccinesSortingOptionsAsString[e]!)))
                  .toList(),
              onChanged: (StudentsSortingOption? value) =>
                  studentsDisplayController.changeSortingOption(value),
            ),
          ],
        ),
      ),
      bodyPadding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
      body: LabeledWidget(
        label: 'قائمة الطلاب الحالية',
        labelTextStyle: TextStyle(
          fontSize: 30.sp,
        ),
        spacing: 35.h,
        child: Obx(() {
          return FutureBuilder<RxList<Student>>(
            future: studentsDisplayController.students.value,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: LoaderWidget(),
                );
              }
              if (snapshot.hasError) {
                return const ErrorLoadingSomethingWidget(
                  somethingName: 'طلاب',
                );
              }
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const EmptyItemWidget(
                    itemName: 'طلاب',
                    iconData: FontAwesomeIcons.syringe,
                  );
                } else {
                  RxList<Student> students = snapshot.data as RxList<Student>;
                  return Expanded(
                    child: StudentsTable(students: students),
                  );
                }
              } else {
                return const EmptyItemWidget(
                  itemName: 'طلاب',
                  iconData: FontAwesomeIcons.syringe,
                );
              }
            },
          );
        }),
      ),
    );
  }
}
