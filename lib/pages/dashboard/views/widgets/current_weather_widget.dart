import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../configs/fonts.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/dashboard_controller.dart';

class CurrentWeatherWidget extends GetView<DashboardController> {
  const CurrentWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AddVerticalSpacing(value: 20.h),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://cdn.weatherbit.io/static/img/icons/${controller.weatherForecast.value!.weather.icon}.png',
                  height: 50.w,
                  width: 50.w,
                ),
                AddHorizontalSpacing(value: 10.w),
                Text(
                  controller.weatherForecast.value!.weather.description,
                  style: ProjectFonts.titleLarge(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${controller.weatherForecast.value!.temp.toString()}°',
                    style: ProjectFonts.displaySmall().copyWith(
                      color: Get.theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  AddHorizontalSpacing(value: 10.w),
                  Text(
                    'C',
                    style: ProjectFonts.displaySmall().copyWith(
                      color: Get.theme.colorScheme.onSurfaceVariant,
                    ),
                  )
                ],
              ),
            ),
          ),
          AddVerticalSpacing(value: 30.h),
        ],
      ),
    );
  }
}
