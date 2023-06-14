import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';

import 'classroom_row.dart';

class ClassroomsTable extends StatelessWidget {
  const ClassroomsTable({super.key, required this.classrooms});

  final List<Classroom> classrooms;
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
                    flex: 7,
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
                        'إسم الشعبة',
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
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
                        'السعة الكلية',
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
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
                itemCount: classrooms.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Color rowColor = index % 2 == 0
                      ? Colors.white
                      : Get.theme.colorScheme.primaryContainer.withOpacity(.2);
                  return ClassroomRow(
                      classroom: classrooms[index], rowColor: rowColor);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
