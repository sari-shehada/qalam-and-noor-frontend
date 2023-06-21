import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/widgets/sub_widgets/current_school_year_numeric_stats_widget.dart';

import '../../../../../../../models/enums.dart';
import '../../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';
import '../../../../../../../tools/widgets/error_loading_something_widget.dart';
import '../../controllers/widget_controllers/school_year_students_controller.dart';

class CurrentSchoolYearStudentsCountWidget
    extends GetView<SchoolYearStudentsController> {
  const CurrentSchoolYearStudentsCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        switch (controller.loadingStatus.value) {
          case GeneralLoadingStatus.isLoading:
            {
              return const Center(
                child: LoaderWidget(),
              );
            }
          case GeneralLoadingStatus.hasData:
            {
              SchoolYearStudentCountStats studentsCount =
                  controller.studentsStats.value!;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 10.h),
                child: Column(
                  children: [
                    Expanded(
                      child: CurrentSchoolYearNumericStatsWidget(
                        title: 'عدد الطلاب في العام الدراسي',
                        count: studentsCount.totalCount.toDouble(),
                      ),
                    ),
                    Column(
                      children: [
                        _StudentGenderCountBarWidget(
                          title: 'الذكور',
                          count: studentsCount.males,
                          color: Get.theme.colorScheme.primary,
                          max: studentsCount.totalCount,
                        ),
                        AddVerticalSpacing(value: 15.h),
                        _StudentGenderCountBarWidget(
                          title: 'الاناث',
                          count: studentsCount.females,
                          color: Colors.pink.shade300,
                          max: studentsCount.totalCount,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
          case GeneralLoadingStatus.hasError:
            {
              return const ErrorLoadingSomethingWidget(
                somethingName: 'TODO',
              );
            }
        }
      },
    );
  }
}

class _StudentGenderCountBarWidget extends StatelessWidget {
  const _StudentGenderCountBarWidget({
    super.key,
    required this.title,
    required this.count,
    required this.max,
    required this.color,
  });

  final String title;
  final int count;
  final int max;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
        ),
        AddHorizontalSpacing(value: 20.w),
        Expanded(
          child: Transform.flip(
            flipX: true,
            child: FAProgressBar(
              maxValue: 1,
              currentValue: count / max,
              size: 10.sp,
              animatedDuration: 400.milliseconds,
              progressColor: color,
              backgroundColor: Colors.grey.shade100,
            ),
          ),
        ),
        AddHorizontalSpacing(value: 20.w),
        Text(
          count.toString(),
        ),
      ],
    );
  }
}

class SchoolYearStudentCountStats {
  SchoolYearStudentCountStats({
    required this.totalCount,
    required this.males,
    required this.females,
  });
  final int totalCount;
  final int males;
  final int females;
}
