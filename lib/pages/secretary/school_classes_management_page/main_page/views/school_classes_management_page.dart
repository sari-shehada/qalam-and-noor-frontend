import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/school_classes_management_controller.dart';
import 'widgets/classes_table.dart';
import '../../../../../tools/ui_tools/custom_drop_down_menu.dart';
import '../../../../../tools/ui_tools/custom_scaffold.dart';
import '../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../../../../tools/widgets/empty_item_widget.dart';
import '../../../../../tools/widgets/error_loading_something_widget.dart';
import '../../../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../../models/educational/school_class.dart';

//TODO: Consider adding some statistics in spare time
class SchoolClassesManagementPage extends StatelessWidget {
  const SchoolClassesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    SchoolClassManagementController schoolClassesManagementController = Get.put(
      SchoolClassManagementController(),
    );

    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    return CustomScaffold(
      floatingActionButton: CustomFilledButton(
        onTap: () => schoolClassesManagementController.addNewSchoolClass(),
        height: 74.h,
        width: 380.w,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة مرحلة دراسية جديدة',
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
        title: 'إدارة المراحل الدراسية',
        iconData: FontAwesomeIcons.book,
        appBarBoxDecoration: const BoxDecoration(),
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
              value: schoolClassesManagementController.currentSortingOption,
              items: SchoolClassesSortingOption.values
                  .map((e) => DropdownMenuItem<SchoolClassesSortingOption>(
                      value: e,
                      child: Text(schoolClassesSortingOptionsAsString[e]!)))
                  .toList(),
              onChanged: (SchoolClassesSortingOption? value) =>
                  schoolClassesManagementController.changeSortingOption(value),
            ),
          ],
        ),
      ),
      bodyPadding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
      body: SizedBox.expand(
        child: Column(
          children: [
            AddVerticalSpacing(value: 40.h),
            Expanded(
              flex: 70,
              child: LabeledWidget(
                label: 'المراحل الدراسية الحالية',
                labelTextStyle: TextStyle(
                  fontSize: 30.sp,
                ),
                spacing: 35.h,
                child: Obx(() {
                  return FutureBuilder<RxList<SchoolClass>>(
                    future: schoolClassesManagementController.classes.value,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: LoaderWidget(),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Center(
                          child: ErrorLoadingSomethingWidget(
                            somethingName: "المراحل الدراسية",
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return const EmptyItemWidget(
                            itemName: 'مراحل دراسية',
                            iconData: FontAwesomeIcons.locationArrow,
                          );
                        } else {
                          RxList<SchoolClass> schoolClasses =
                              snapshot.data as RxList<SchoolClass>;
                          return Expanded(
                            child: SchoolClassesTable(
                              schoolClasses: schoolClasses,
                            ),
                          );
                        }
                      } else {
                        return const EmptyItemWidget(
                          itemName: 'مراحل دراسية',
                          iconData: FontAwesomeIcons.locationArrow,
                        );
                      }
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
