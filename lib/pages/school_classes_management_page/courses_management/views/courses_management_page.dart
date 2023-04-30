import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/pages/school_classes_management_page/courses_management/controllers/courses_management_controller.dart';
import 'package:kalam_noor/pages/school_classes_management_page/courses_management/views/widgets/courses_table.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../tools/ui_tools/custom_drop_down_menu.dart';
import '../../../../tools/ui_tools/custom_scaffold.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../../../tools/widgets/empty_item_widget.dart';
import '../../main_page/controllers/school_classes_management_controller.dart';

class CoursesManagementPage extends StatelessWidget {
  const CoursesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    final CoursesManagementController controller = Get.find();
    return CustomScaffold(
      floatingActionButton: CustomFilledButton(
        onTap: () => controller.addNewCourse(),
        height: 74.h,
        width: 400.w,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة مادة جديدة',
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
      bodyPadding: EdgeInsetsDirectional.only(
        top: 20.h,
        start: 60.w,
        end: 60.w,
      ),
      appBar: CustomAppBar(
        title: controller.schoolClass.name,
        iconData: FontAwesomeIcons.locationDot,
        backButtonEnabled: true,
        actionButton: Row(
          children: [
            Text(
              'ترتيب حسب:',
              style: textTheme.titleLarge,
            ),
            AddHorizontalSpacing(value: 25.w),
            CustomDropDownButton<SchoolClassesSortingOption>(
              dropdownColor: colorScheme.primaryContainer,
              textStyle: textTheme.titleMedium,
              backgroundColor: colorScheme.primaryContainer,
              value: controller.currentSortingOption,
              items: SchoolClassesSortingOption.values
                  .map((e) => DropdownMenuItem<SchoolClassesSortingOption>(
                      value: e,
                      child: Text(schoolClassesSortingOptionsAsString[e]!)))
                  .toList(),
              onChanged: (SchoolClassesSortingOption? value) =>
                  controller.changeSortingOption(value),
            ),
          ],
        ),
      ),
      body: Obx(
        () => FutureBuilder(
          future: controller.courses.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoaderWidget(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                //TODO: Change later
                child: Text('Error Loading Courses'),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const EmptyItemWidget(
                  itemName: 'مواد',
                  iconData: FontAwesomeIcons.mapLocationDot,
                );
              } else {
                List<Course> courses = snapshot.data as List<Course>;
                return Expanded(
                  child: CoursesTable(
                    courses: courses,
                  ),
                );
              }
            } else {
              return const EmptyItemWidget(
                itemName: 'مواد',
                iconData: FontAwesomeIcons.mapLocation,
              );
            }
          },
        ),
      ),
    );
  }
}
