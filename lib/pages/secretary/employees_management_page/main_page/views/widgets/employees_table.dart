import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/agendas/employee.dart';
import 'package:kalam_noor/pages/secretary/employees_management_page/main_page/views/widgets/employee_row.dart';

class EmployeesTable extends StatelessWidget {
  const EmployeesTable({super.key, required this.employees});
  final List<Employee> employees;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Scaffold(
      body: SizedBox.expand(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              border: Border.all(
                color: colorScheme.primary,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.r),
                topLeft: Radius.circular(15.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    child: Text(
                      'الاسم الثلاثي',
                      style: ProjectFonts.titleLarge().copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    child: Text(
                      'الاسم الأم',
                      style: ProjectFonts.titleLarge().copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    child: Text(
                      'الجنس',
                      style: ProjectFonts.titleLarge().copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    child: Text(
                      'تاريخ الميلاد',
                      style: ProjectFonts.titleLarge().copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    child: Text(
                      'عدد الأبناء',
                      style: ProjectFonts.titleLarge().copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    child: Text(
                      'تاريخ التوظيف',
                      style: ProjectFonts.titleLarge().copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 100.h),
              itemCount: employees.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Color rowColor = index % 2 == 0
                    ? Colors.white
                    : Get.theme.colorScheme.primaryContainer.withOpacity(.2);
                return EmployeeRow(
                  employee: employees[index],
                  rowColor: rowColor,
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
