import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../models/agendas/employee.dart';
import '../../../../../../tools/logic_tools/datetime_helper.dart';

class EmployeeRow extends StatelessWidget {
  const EmployeeRow(
      {super.key, required this.employee, required this.rowColor});
  final Employee employee;
  final Color rowColor;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
    return SizedBox(
      height: 70.h,
      child: Container(
        color: rowColor,
        child: Material(
          color: Colors.transparent,
          child: SizedBox(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${employee.firstName} ${employee.fatherName} ${employee.lastName}',
                      style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22.sp),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      employee.motherName,
                      style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22.sp),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      employee.isMale ? 'ذكر' : 'أنثى',
                      style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22.sp),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      DateTimeHelper.getDateWithoutTime(employee.dateOfBirth),
                      style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22.sp),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      employee.numberOfChildren.toString(),
                      style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22.sp),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      DateTimeHelper.getDateWithoutTime(employee.startDate),
                      style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22.sp),
                    ),
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
