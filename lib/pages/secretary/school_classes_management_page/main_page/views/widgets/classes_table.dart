import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../models/educational/school_class.dart';
import 'class_row.dart';

class SchoolClassesTable extends StatelessWidget {
  const SchoolClassesTable({super.key, required this.schoolClasses});

  final List<SchoolClass> schoolClasses;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                border: Border.all(color: colorScheme.primary),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 22,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(color: colorScheme.primary),
                        ),
                      ),
                      child: Text(
                        'إسم المرحلة الدراسية',
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(color: colorScheme.primary),
                        ),
                      ),
                      child: Text(
                        'عدد المقررات الكفيلة بترسيب الطالب',
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 20.w),
                      child: Text(
                        'الاجراءات',
                        textAlign: TextAlign.center,
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 100.h),
                itemCount: schoolClasses.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Color rowColor = index % 2 == 0
                      ? Colors.white
                      : Get.theme.colorScheme.primaryContainer.withOpacity(.2);
                  return SchoolClassRow(
                    schoolClass: schoolClasses[index],
                    rowColor: rowColor,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
