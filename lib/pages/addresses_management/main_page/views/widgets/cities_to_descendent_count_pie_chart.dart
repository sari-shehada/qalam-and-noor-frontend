import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../controllers/addresses_management_stats_controller.dart';

class LargestCitiesByDescendentCountPieChart extends StatelessWidget {
  const LargestCitiesByDescendentCountPieChart({
    super.key,
    this.legendTitle,
    required this.future,
    required this.onFailedToLoadText,
  });

  final LegendTitle? legendTitle;
  final Future<List<CityToDescendentCount>> future;
  final String onFailedToLoadText;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context,
          AsyncSnapshot<List<CityToDescendentCount>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return SfCircularChart(
              tooltipBehavior: TooltipBehavior(enable: true),
              legend: Legend(isVisible: true, title: legendTitle),
              series: <CircularSeries>[
                PieSeries<CityToDescendentCount, String>(
                  // enableTooltip: true,
                  // explode: true,
                  // explodeAll: true,
                  explodeGesture: ActivationMode.singleTap,
                  dataSource: snapshot.data,
                  pointColorMapper: (CityToDescendentCount data, _) =>
                      data.color,
                  xValueMapper: (CityToDescendentCount data, _) =>
                      data.city.name,
                  yValueMapper: (CityToDescendentCount data, _) =>
                      data.descendentCount,
                  animationDuration: 600,
                ),
              ],
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                onFailedToLoadText,
                style: Get.theme.textTheme.headlineMedium!.copyWith(
                  color: Get.theme.colorScheme.onSurfaceVariant,
                ),
              ),
            );
          }
        }

        return const SizedBox.shrink();
      },
    );
  }
}
