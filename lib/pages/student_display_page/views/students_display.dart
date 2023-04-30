import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/pages/new_student_registration/main_page/views/new_student_registration_page.dart';
import 'package:kalam_noor/pages/student_display_page/controllers/students_display_controller.dart';
import 'package:kalam_noor/pages/student_display_page/views/widgets/students_table.dart';
import 'package:kalam_noor/to_be_disposed/new_student_registration/student_information/controllers/new_student_registration_controller.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import '../../../tools/ui_tools/buttons.dart';
import '../../../tools/ui_tools/custom_appbar.dart';
import '../../../tools/ui_tools/custom_drop_down_menu.dart';
import '../../../tools/ui_tools/labeled_widget.dart';
import '../../../tools/ui_tools/loader_widget.dart';
import '../../../tools/ui_tools/ui_tools.dart';
import '../../../tools/widgets/empty_item_widget.dart';

class StudentsDisplayPage extends StatelessWidget {
  const StudentsDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    StudentsDisplayController studentsDisplayController =
        Get.put(StudentsDisplayController());
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
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
        title: "قائمة الطلاب",
        iconData: FontAwesomeIcons.user,
        backButtonEnabled: true,
        actionButton: Row(
          children: [
            Text(
              'ترتيب حسب:',
              style: textTheme.titleLarge,
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
      body: Column(
        children: [
          Expanded(
            flex: 70,
            child: LabeledWidget(
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
                      //TODO: Change later
                      return const Center(
                        child: Text('error loading Students'),
                      );
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return const EmptyItemWidget(
                          itemName: 'طلاب',
                          iconData: FontAwesomeIcons.syringe,
                        );
                      } else {
                        RxList<Student> students =
                            snapshot.data as RxList<Student>;
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
          ),
        ],
      ),
    );
  }
}
