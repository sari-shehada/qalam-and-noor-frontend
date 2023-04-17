// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// import '../../controllers/addresses_management_stats_controller.dart';

// class LargestCitiesByAddressCountPieChart extends StatelessWidget {
//   const LargestCitiesByAddressCountPieChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future:
//           Get.find<AddressesManagementStatsController>().citiesToAddressesCount,
//       builder: (BuildContext context,
//           AsyncSnapshot<List<CityToDescendentCount>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasData) {
//             return SfCircularChart(
//               tooltipBehavior: TooltipBehavior(enable: true),
//               legend: Legend(
//                 isVisible: true,
//               ),
//               series: <CircularSeries>[
//                 PieSeries<CityToDescendentCount, String>(
//                     dataSource: snapshot.data,
//                     pointColorMapper: (CityToDescendentCount data, _) =>
//                         data.color,
//                     xValueMapper: (CityToDescendentCount data, _) =>
//                         data.city.name,
//                     yValueMapper: (CityToDescendentCount data, _) =>
//                         data.descendentCount)
//               ],
//             );
//           }
//           if (!snapshot.hasData) {
//             return Center(
//               child: Text(
//                 //TODO: Chnage this bullcrap
//                 'تعذر بناء إحصيائات عدد الأحياء',
//                 style: Get.theme.textTheme.headlineMedium!.copyWith(
//                   color: Get.theme.colorScheme.onSurfaceVariant,
//                 ),
//               ),
//             );
//           }
//         }

//         return const SizedBox.shrink();
//       },
//     );
//   }
// }
