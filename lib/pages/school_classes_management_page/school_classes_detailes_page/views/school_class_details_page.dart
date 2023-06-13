import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/school_classes_management_page/main_page/controllers/school_classes_management_controller.dart';
import 'package:kalam_noor/pages/school_classes_management_page/school_classes_detailes_page/views/widgets/classroom_table.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';
import '../../../../models/educational/classroom.dart';
import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../tools/ui_tools/custom_drop_down_menu.dart';
import '../../../../tools/ui_tools/custom_scaffold.dart';
import '../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../../../tools/widgets/empty_item_widget.dart';
import '../controllers/school_class_details_controller.dart';

class SchoolClassDetailsPage extends StatelessWidget {
  const SchoolClassDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    final SchoolClassDetailsController controller = Get.find();
    return CustomScaffold(
      floatingActionButton: CustomFilledButton(
        onTap: () => controller.addNewClassroom(),
        height: 74.h,
        width: 400.w,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة شعبة جديدة',
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
                )
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
        title: 'الصف ${controller.schoolClass.name}',
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
      body: SizedBox.expand(
        child: Column(
          children: [
            AddVerticalSpacing(value: 40.h),
            Expanded(
              flex: 70,
              child: LabeledWidget(
                label: 'الشعب ضمن الصف ${controller.schoolClass.name}',
                labelTextStyle: TextStyle(
                  fontSize: 30.sp,
                ),
                spacing: 35.h,
                child: Obx(
                  () => FutureBuilder(
                    future: controller.classrooms.value,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Expanded(
                          child: Center(
                            child: LoaderWidget(),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Center(
                          child: ErrorLoadingSomethingWidget(
                            somethingName: "الشعب",
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return const EmptyItemWidget(
                            itemName: 'شعب',
                            iconData: FontAwesomeIcons.mapLocationDot,
                          );
                        } else {
                          List<Classroom> classrooms =
                              snapshot.data as List<Classroom>;

                          return Expanded(
                            child: ClassroomsTable(
                              classrooms: classrooms,
                            ),
                          );
                        }
                      } else {
                        return const EmptyItemWidget(
                          itemName: 'شعب',
                          iconData: FontAwesomeIcons.mapLocation,
                        );
                      }
                    },
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
