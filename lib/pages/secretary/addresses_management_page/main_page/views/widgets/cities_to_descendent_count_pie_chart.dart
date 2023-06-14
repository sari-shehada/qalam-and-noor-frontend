import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../configs/styles.dart';
import '../../../../../../tools/ui_tools/loader_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/city_to_descendent_count.dart';

class LargestCitiesByDescendentCountPieChart extends StatelessWidget {
  const LargestCitiesByDescendentCountPieChart({
    super.key,
    this.legendTitle,
    required this.future,
    required this.onFailedToLoadText,
  });

  final String? legendTitle;
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
            child: LoaderWidget(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
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
                      PieSeries<CityToDescendentCount, String>(
                        // enableTooltip: true,
                        // explode: true,
                        // explodeAll: true,
                        explodeGesture: ActivationMode.singleTap,
                        dataSource: snapshot.data,
                        pointColorMapper: (CityToDescendentCount data, _) =>
                            null,
                        xValueMapper: (CityToDescendentCount data, _) =>
                            data.city.name,
                        yValueMapper: (CityToDescendentCount data, _) =>
                            data.descendentCount,
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
