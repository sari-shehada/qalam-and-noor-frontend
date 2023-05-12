import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/agendas/employee.dart';
import 'package:kalam_noor/models/agendas/job_title.dart';
import 'package:kalam_noor/pages/employees_management_page/main_page/views/widgets/employees_table.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';

import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../tools/ui_tools/custom_drop_down_menu.dart';
import '../../../../tools/ui_tools/loader_widget.dart';
import '../../../../tools/ui_tools/search_fields.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../../../tools/widgets/empty_item_widget.dart';
import '../controllers/employees_management_controller.dart';
import '../models/employee_management_constants.dart';

class EmployeesManagementPage extends StatelessWidget {
  const EmployeesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EmployeesManagementController controller =
        Get.put(EmployeesManagementController());
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return CustomScaffold(
      floatingActionButton: CustomFilledButton(
        height: 74.h,
        width: 300.w,
        onTap: () => controller.addNewEmployee(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة موظف جديد',
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
        title: 'إدارة شؤون الموظفين',
        iconData: FontAwesomeIcons.userTie,
        actionButton: CustomSearchFieldMedium(
          hintText: 'البحث عن موظفين',
          callback: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 40.w, end: 40.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'الموظفين الحاليين',
                  style: ProjectFonts.headlineMedium(),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Row(
                    children: [
                      Text(
                        'عرض:',
                        style: ProjectFonts.titleLarge(),
                      ),
                      AddHorizontalSpacing(value: 25.w),
                      Obx(
                        () => controller.jobTitles.isEmpty
                            ? Text(
                                'يتم الآن تحميل المسميات الوظيفية',
                                style: ProjectFonts.bodyLarge(),
                              )
                            : CustomDropDownButton(
                                backgroundColor: colorScheme.primaryContainer,
                                dropdownColor: colorScheme.primaryContainer,
                                value: controller.currentDisplayOption,
                                hint: 'جميع المسميات الوظيفية',
                                items: controller.jobTitles
                                    .map(
                                      (e) => DropdownMenuItem<JobTitle>(
                                        value: e,
                                        child: Text(
                                            '${e.name} ${e.details == 'موظف' ? '' : e.details}'),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (JobTitle? value) =>
                                    controller.changeDisplayOption(value),
                              ),
                      ),
                    ],
                  ),
                  AddVerticalSpacing(value: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'ترتيب حسب:',
                        style: ProjectFonts.titleLarge(),
                      ),
                      AddHorizontalSpacing(value: 25.w),
                      CustomDropDownButton(
                        backgroundColor: colorScheme.primaryContainer,
                        dropdownColor: colorScheme.primaryContainer,
                        value: controller.currentSortingOption,
                        items: EmployeeSortingOption.values
                            .map(
                              (e) => DropdownMenuItem<EmployeeSortingOption>(
                                value: e,
                                child: Text(EmployeesManagementConstants
                                    .employeeSortingOptionsAsString[e]!),
                              ),
                            )
                            .toList(),
                        onChanged: (EmployeeSortingOption? value) =>
                            controller.changeSortingOption(value),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
            AddVerticalSpacing(value: 20.h),
            Expanded(
              child: Obx(() {
                return FutureBuilder<List<Employee>>(
                  future: controller.employees.value,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: LoaderWidget(),
                      );
                    }
                    if (snapshot.hasError) {
                      return ErrorLoadingSomethingWidget(
                        somethingName: 'الموظفين',
                        bottomPadding: 180.h,
                        retryCallback: () => controller.refreshEmployees(),
                      );
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return const EmptyItemWidget(
                          itemName: 'موظفين',
                          iconData: FontAwesomeIcons.userTie,
                        );
                      } else {
                        List<Employee> employees =
                            snapshot.data as List<Employee>;
                        return EmployeesTable(
                          employees: employees,
                        );
                      }
                    } else {
                      return const EmptyItemWidget(
                        itemName: 'موظفين',
                        iconData: FontAwesomeIcons.userTie,
                      );
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
