import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../configs/fonts.dart';
import '../../../../../configs/styles.dart';
import '../../../../../models/stats_models/psychological_status_student_count.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PsychologicalStatusesPieChartWidget extends StatelessWidget {
  const PsychologicalStatusesPieChartWidget({
    super.key,
    this.legendTitle,
    required this.data,
    required this.onFailedToLoadText,
  });

  final String? legendTitle;
  final List<PsychologicalStatusStudentCount> data;
  final String onFailedToLoadText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfCircularChart(
            tooltipBehavior: TooltipBehavior(enable: true),
            legend: Legend(
              isVisible: true,
            ),
            palette: GlobalStyles.miscColors,
            series: <CircularSeries>[
              PieSeries<PsychologicalStatusStudentCount, String>(
                // enableTooltip: true,
                // explode: true,
                // explodeAll: true,
                explodeGesture: ActivationMode.singleTap,
                dataSource: data,
                pointColorMapper: (PsychologicalStatusStudentCount data, _) =>
                    null,
                xValueMapper: (PsychologicalStatusStudentCount data, _) =>
                    data.psychologicalStatusName,
                yValueMapper: (PsychologicalStatusStudentCount data, _) =>
                    data.studentsCount,
                animationDuration: 600,
              ),
            ],
          ),
        ),
        if (legendTitle != null)
          Container(
            padding: EdgeInsets.only(bottom: 25.h),
            child: Text(
              legendTitle!,
              style: ProjectFonts.titleMedium(),
            ),
          ),
      ],
    );
  }
}
