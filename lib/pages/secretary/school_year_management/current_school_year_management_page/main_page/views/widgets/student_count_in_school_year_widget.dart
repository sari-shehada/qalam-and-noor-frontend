import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/controllers/current_school_year_management_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../../configs/fonts.dart';
import '../../../../../../../configs/styles.dart';
import '../../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';

class StudentCountInSchoolYearWidget
    extends GetView<CurrentSchoolYearManagementController> {
  const StudentCountInSchoolYearWidget({super.key});
  BoxDecoration get containerDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          GlobalStyles.globalBorderRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF393939).withOpacity(.06),
            blurRadius: 60,
            offset: const Offset(0, 30),
          ),
        ],
      );
  EdgeInsets get containerPadding => EdgeInsets.only(
        top: 20.h,
      );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FutureBuilder<SchoolYearStudentCountStats>(
        future: controller.studentsCount.value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
              baseColor: Colors.white.withOpacity(1),
              highlightColor: Get.theme.scaffoldBackgroundColor,
              direction: ShimmerDirection.rtl,
              child: Container(
                decoration: containerDecoration,
                height: double.infinity,
                width: double.infinity,
              ),
            );
          }
          if (snapshot.hasError) {
            return Container(
              padding: containerPadding,
              decoration: containerDecoration,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'حدث خطأ اثناء تحميل احصائيات الطلاب في العام الدراسي',
                    style: ProjectFonts.titleMedium(),
                  ),
                  AddVerticalSpacing(value: 35.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: CustomFilledButton(
                      onTap: () => controller.refreshStudentsCount(),
                      child: 'إعادة المحاولة',
                    ),
                  ),
                ],
              ),
            );
          }
          return Container(
            padding: containerPadding,
            decoration: containerDecoration,
            child: _StudentsCountInSchoolYearWidget(
              snapshot.data as SchoolYearStudentCountStats,
            ),
          );
        },
      ),
    );
  }
}

class _StudentsCountInSchoolYearWidget extends StatelessWidget {
  const _StudentsCountInSchoolYearWidget(this.studentCountStats);

  final SchoolYearStudentCountStats studentCountStats;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(),
        ),
        VerticalDivider(
          endIndent: 20.h,
        ),
        Expanded(
          flex: 7,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: _SchoolYearStudentCountLineChart(
              chartData: [
                _SchoolYearStudentCountLineChartData(
                  title: 'الذكور',
                  count: studentCountStats.males,
                  color: Get.theme.colorScheme.primary,
                ),
                _SchoolYearStudentCountLineChartData(
                  title: 'الاناث',
                  count: studentCountStats.females,
                  color: Colors.pink.shade300,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SchoolYearStudentCountLineChart extends StatelessWidget {
  const _SchoolYearStudentCountLineChart({
    required this.chartData,
  });

  final List<_SchoolYearStudentCountLineChartData> chartData;
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderColor: Colors.transparent,
      plotAreaBackgroundColor: Colors.transparent,
      borderColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        borderColor: Colors.transparent,
      ),
      enableAxisAnimation: true,
      series: <BarSeries<_SchoolYearStudentCountLineChartData, String>>[
        BarSeries<_SchoolYearStudentCountLineChartData, String>(
          dataSource: chartData,
          xValueMapper: (_SchoolYearStudentCountLineChartData data, index) =>
              data.title,
          yValueMapper: (_SchoolYearStudentCountLineChartData data, _) =>
              data.count,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelAlignment: ChartDataLabelAlignment.top,
          ),
          pointColorMapper: (datum, index) => datum.color,
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
        )
      ],
    );
  }
}

class _SchoolYearStudentCountLineChartData {
  _SchoolYearStudentCountLineChartData({
    required this.title,
    required this.count,
    required this.color,
  });
  final String title;
  final int count;
  final Color color;
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
