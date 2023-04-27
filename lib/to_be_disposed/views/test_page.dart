import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200.h,
          width: 400.w,
          child: SfCircularChart(
            tooltipBehavior: TooltipBehavior(enable: true),
            legend: Legend(
              isVisible: true,
            ),
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y)
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

final List<ChartData> chartData = [
  ChartData('David', 25),
  ChartData('Steve', 38),
  ChartData('Jack', 34),
  ChartData('Others', 52)
];
