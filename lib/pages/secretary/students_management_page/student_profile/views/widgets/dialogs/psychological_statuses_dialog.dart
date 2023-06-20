import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_profile/models/student_psychological_status_info.dart';
import '../../../../../../../configs/styles.dart';
import '../../../../../../../configs/fonts.dart';
import '../../../../../../../models/enums.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';
import '../psychological_status_indicator.dart';

class PsychologicalInfoDialog extends StatelessWidget {
  const PsychologicalInfoDialog({super.key, required this.list});
  final List<PsychologicalStatusInfo> list;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          width: 600.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.transparent,
          ),
          padding: EdgeInsetsDirectional.only(
              start: 30.w, end: 30.w, top: 20.h, bottom: 25.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "الحالات الإجتماعية",
                style: ProjectFonts.headlineMedium(),
              ),
              AddVerticalSpacing(value: 15.h),
              SizedBox(
                height: 350.h,
                width: 300.w,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300.w,
                      height: 105.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        border:
                            Border.all(color: colorScheme.primary, width: 2.w),
                      ),
                      margin: EdgeInsets.only(bottom: 15.h),
                      padding: EdgeInsets.all(5.w),
                      child: Column(
                        children: [
                          Text(
                            list[index].psychologicalStatusName,
                            style: ProjectFonts.headlineSmall(),
                          ),
                          AddVerticalSpacing(value: 15.h),
                          PsychologicalStatusIndicator(
                            value: ((list[index].statusLevel.index + 1) /
                                PsychologicalStatusLevel.values.length),
                            valueColor: GlobalStyles
                                .miscColors[12 + list[index].statusLevel.index],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
