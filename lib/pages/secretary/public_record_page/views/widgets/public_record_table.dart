import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/public_record.dart';
import 'package:kalam_noor/pages/secretary/public_record_page/views/widgets/public_record_row.dart';

class PublicRecordTable extends StatelessWidget {
  const PublicRecordTable({super.key, required this.records});

  final List<PublicRecord> records;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Column(
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
                flex: 1,
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    'رقم السجل العام',
                    style: ProjectFonts.titleLarge(),
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
                      left: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    'الاسم الثلاثي',
                    style: ProjectFonts.titleLarge(),
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
                      left: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    'الام',
                    style: ProjectFonts.titleLarge(),
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
                      left: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    'الجد',
                    style: ProjectFonts.titleLarge(),
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
                      left: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    'القيد',
                    style: ProjectFonts.titleLarge(),
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
                      left: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    'الجنس',
                    style: ProjectFonts.titleLarge(),
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
                      left: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    'مكان الولادة',
                    style: ProjectFonts.titleLarge(),
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
                      left: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    'تاريح الولادة',
                    style: ProjectFonts.titleLarge(),
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
                      left: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    'رقم الهاتف',
                    style: ProjectFonts.titleLarge(),
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
                      left: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    'رقم الواتس اب',
                    style: ProjectFonts.titleLarge(),
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
                      left: BorderSide(color: colorScheme.primary),
                    ),
                  ),
                  child: Text(
                    'الهاتف الارضي',
                    style: ProjectFonts.titleLarge(),
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
                    'العنوان',
                    textAlign: TextAlign.center,
                    style: ProjectFonts.titleLarge(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 100.h),
            itemCount: records.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Color rowColor = index % 2 == 0
                  ? Colors.white
                  : Get.theme.colorScheme.primaryContainer.withOpacity(.2);
              return PublicRecordRow(
                  record: records[index], rowColor: rowColor);
            },
          ),
        )
      ],
    );
  }
}
