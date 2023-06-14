import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/dashboard_page/views/widgets/useful_links_list_widget.dart';
import 'widgets/current_time_widget.dart';
import 'widgets/current_weather_widget.dart';
import 'widgets/daily_quote_widget.dart';
import 'widgets/student_count_widget.dart';
import 'widgets/teachers_count_widget.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../tools/ui_tools/custom_scaffold.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../../../tools/widgets/employee_dashboard_profile_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/secretary_dashboard_controller.dart';

class SecretaryDashboardPage extends StatelessWidget {
  const SecretaryDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    SecretaryDashboardController controller = Get.put(
      SecretaryDashboardController(),
    );
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'الصفحة الرئيسية',
        iconData: FontAwesomeIcons.house,
        actionButton: EmployeeDashboardProfileWidget(),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Row(
            children: [
              Expanded(
                flex: 80,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Obx(
                              () => _DashboardContainer(
                                child: controller.studentsCount.value == null
                                    ? null
                                    : StudentCountWidget(
                                        count: controller.studentsCount.value!,
                                      ),
                              ),
                            ),
                          ),
                          AddHorizontalSpacing(value: 30.w),
                          Expanded(
                            flex: 5,
                            child: Obx(
                              () => _DashboardContainer(
                                buildChildWithContainer: false,
                                child: controller.teachersCount.value == null
                                    ? null
                                    : TeachersCountWidget(
                                        count: controller.teachersCount.value!,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AddVerticalSpacing(value: 20.h),
                    Expanded(
                      flex: 1,
                      child: Obx(
                        () => _DashboardContainer(
                          buildChildWithContainer: true,
                          child: controller.dailyQuote.value == null
                              ? null
                              : const DailyQuoteWidget(),
                        ),
                      ),
                    ),
                    AddVerticalSpacing(value: 20.h),
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: _DashboardContainer(),
                          ),
                          AddHorizontalSpacing(value: 30.w),
                          const Expanded(
                            flex: 3,
                            child: _DashboardContainer(),
                          ),
                        ],
                      ),
                    ),
                    AddVerticalSpacing(value: 20.h),
                  ],
                ),
              ),
              AddHorizontalSpacing(value: 30.w),
              Expanded(
                flex: 30,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Obx(
                        () => _DashboardContainer(
                          buildChildWithContainer: true,
                          child: controller.serverTime.value == null
                              ? null
                              : const CurrentTimeWidget(),
                        ),
                      ),
                    ),
                    AddVerticalSpacing(value: 20.h),
                    Expanded(
                      flex: 2,
                      child: Obx(
                        () => _DashboardContainer(
                          buildChildWithContainer: true,
                          child: controller.weatherForecast.value == null
                              ? null
                              : const CurrentWeatherWidget(),
                        ),
                      ),
                    ),
                    AddVerticalSpacing(value: 20.h),
                    const Expanded(
                      flex: 6,
                      child: UsefulLinksListWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardContainer extends StatelessWidget {
  ///Nullable as to be a placeholder
  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final bool buildChildWithContainer;
  const _DashboardContainer({
    this.child,
    this.margin,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.boxShadow,
    this.buildChildWithContainer = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ??
          BorderRadius.all(
            Radius.circular(20.r),
          ),
      child: child == null
          ? Shimmer.fromColors(
              baseColor: Colors.white.withOpacity(1),
              highlightColor: Get.theme.scaffoldBackgroundColor,
              direction: ShimmerDirection.rtl,
              child: _buildChild(),
            )
          : buildChildWithContainer == false
              ? child
              : _buildChild(),
    );
  }

  Widget _buildChild() {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: const Color(0xFF393939).withOpacity(.06),
                blurRadius: 60,
                offset: const Offset(0, 30),
              ),
            ],
        borderRadius: borderRadius ??
            BorderRadius.all(
              Radius.circular(20.r),
            ),
      ),
      child: child,
    );
  }
}
