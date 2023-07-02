import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../configs/fonts.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../controller/psychological_instructor_dashboard_controller.dart';

class CurrentWeatherWidget2
    extends GetView<PsychologicalInstructorDashboardController> {
  const CurrentWeatherWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          height: 250.sp,
          width: 250.sp,
          right: -65.w,
          top: -60.h,
          child: Transform.flip(
            flipX: true,
            child: Image.network(
              'https://cdn.weatherbit.io/static/img/icons/${controller.weatherForecast.value!.weather.icon}.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          height: 250.sp,
          width: 250.sp,
          right: -65.w,
          top: -60.h,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(1),
                  Colors.white.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 22.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.weatherForecast.value!.weather.description,
                style: ProjectFonts.headlineMedium().copyWith(
                  color: Get.theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${controller.weatherForecast.value!.temp.toString()}°',
                      style: ProjectFonts.displaySmall().copyWith(
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                    AddHorizontalSpacing(value: 10.w),
                    Text(
                      'C',
                      style: ProjectFonts.displaySmall().copyWith(
                        color: Get.theme.colorScheme.primary,
                      ),
                    )
                  ],
                ),
              ),
              AddVerticalSpacing(value: 5.h),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 20.w,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Tooltip(
                        message: 'سرعة الرياح',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              controller.weatherForecast.value!
                                  .getWindDirectionIcon(),
                              size: 30.sp,
                              color: Get.theme.colorScheme.primary,
                            ),
                            AddHorizontalSpacing(value: 10.w),
                            Text(
                              'KM/H',
                              style: ProjectFonts.headlineSmall().copyWith(
                                color: Get.theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            AddHorizontalSpacing(value: 5.w),
                            Text(
                              controller.weatherForecast.value!.wind_spd
                                  .toStringAsPrecision(3),
                              style: ProjectFonts.headlineSmall().copyWith(
                                color: Get.theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AddHorizontalSpacing(value: 10.w),
                    Text(
                      '|',
                      style: ProjectFonts.headlineSmall().copyWith(
                        color: Get.theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    AddHorizontalSpacing(value: 10.w),
                    Expanded(
                      child: Tooltip(
                        message: 'نسبة الرطوبة',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '%',
                              style: ProjectFonts.headlineSmall().copyWith(
                                color: Get.theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            AddHorizontalSpacing(value: 5.w),
                            Text(
                              controller.weatherForecast.value!.rh.toString(),
                              style: ProjectFonts.headlineSmall().copyWith(
                                color: Get.theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            AddHorizontalSpacing(value: 10.w),
                            Icon(
                              Icons.water_drop_outlined,
                              size: 30.sp,
                              color: Get.theme.colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
