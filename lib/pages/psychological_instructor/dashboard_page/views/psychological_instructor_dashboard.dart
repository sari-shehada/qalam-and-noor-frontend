import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/psychological_instructor/dashboard_page/views/widgets/psychological_instructor_current_time_widget.dart';
import 'package:kalam_noor/pages/psychological_instructor/dashboard_page/views/widgets/psychological_instructor_current_weather_widget.dart';
import 'package:kalam_noor/pages/psychological_instructor/dashboard_page/views/widgets/psychological_instructor_daily_quote_widget.dart';
import 'package:kalam_noor/pages/psychological_instructor/dashboard_page/views/widgets/psychological_instructor_usefull_links_list_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../controller/psychological_instructor_dashboard_controller.dart';
import 'widgets/psychological_statuses_pie_chart_widget.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../tools/ui_tools/custom_scaffold.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../../../tools/widgets/employee_dashboard_profile_widget.dart';

class PsychologicalInstructorDashboard extends StatelessWidget {
  const PsychologicalInstructorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    PsychologicalInstructorDashboardController controller = Get.put(
      PsychologicalInstructorDashboardController(),
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
                            flex: 11,
                            child: Obx(
                              () => DashboardContainer2(
                                child: controller
                                            .psychologicalInstructorDashboardCardsInfo
                                            .value ==
                                        null
                                    ? null
                                    : Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(14.r),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 10.h),
                                              blurRadius: 10,
                                              color: colorScheme.shadow
                                                  .withOpacity(.02),
                                            ),
                                          ],
                                        ),
                                        child: AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child:
                                              PsychologicalStatusesPieChartWidget(
                                            legendTitle:
                                                'اكثر الحالات الاجتماعية من حيث عدد الطلاب',
                                            data: controller
                                                .psychologicalInstructorDashboardCardsInfo
                                                .value!
                                                .psychologicalStatusesToStudentCount,
                                            onFailedToLoadText:
                                                'تعذر بناء إحصائية الحالات الاجتماعية للطلاب',
                                          ),
                                        ),
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
                        () => DashboardContainer2(
                          buildChildWithContainer: true,
                          child: controller.dailyQuote.value == null
                              ? null
                              : const PsychologicalInstructorDailyQuoteWidget(),
                        ),
                      ),
                    ),
                    AddVerticalSpacing(value: 20.h),
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Obx(
                              () => DashboardContainer2(
                                buildChildWithContainer: true,
                                child: controller
                                            .psychologicalInstructorDashboardCardsInfo
                                            .value ==
                                        null
                                    ? null
                                    : PsychologicalStatusesPieChartWidget(
                                        legendTitle:
                                            'اكثر الحالات الاجتماعية من حيث عدد الطلاب الذكور',
                                        data: controller
                                            .psychologicalInstructorDashboardCardsInfo
                                            .value!
                                            .malePsychologicalStatusesToStudentCount,
                                        onFailedToLoadText:
                                            'تعذر بناء إحصائيات الحالات الاجتماعية للطلاب الذكور',
                                      ),
                              ),
                            ),
                          ),
                          AddHorizontalSpacing(value: 20.w),
                          Expanded(
                            flex: 3,
                            child: Obx(
                              () => DashboardContainer2(
                                buildChildWithContainer: true,
                                child: controller
                                            .psychologicalInstructorDashboardCardsInfo
                                            .value ==
                                        null
                                    ? null
                                    : PsychologicalStatusesPieChartWidget(
                                        legendTitle:
                                            'اكثر الحالات الاجتماعية من حيث عدد الطلاب الإناث',
                                        data: controller
                                            .psychologicalInstructorDashboardCardsInfo
                                            .value!
                                            .femalePsychologicalStatusesToStudentCount,
                                        onFailedToLoadText:
                                            'تعذر بناء إحصائيات الحالات الاجتماعية للطلاب الإناث',
                                      ),
                              ),
                            ),
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
                        () => DashboardContainer2(
                          buildChildWithContainer: true,
                          child: controller.serverTime.value == null
                              ? null
                              : const PsychologicalInstructorCurrentTimeWidget(),
                        ),
                      ),
                    ),
                    AddVerticalSpacing(value: 20.h),
                    Expanded(
                      flex: 2,
                      child: Obx(
                        () => DashboardContainer2(
                          buildChildWithContainer: true,
                          child: controller.weatherForecast.value == null
                              ? null
                              : const CurrentWeatherWidget2(),
                        ),
                      ),
                    ),
                    AddVerticalSpacing(value: 20.h),
                    Expanded(
                      flex: 6,
                      child: Obx(
                        () => DashboardContainer2(
                          child: controller.usefulLinks.isEmpty
                              ? null
                              : const PsychologicalInstructorUsefulLinksListWidget(),
                        ),
                      ),
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

class DashboardContainer2 extends StatelessWidget {
  ///Nullable as to be a placeholder
  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final bool buildChildWithContainer;
  const DashboardContainer2({
    super.key,
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
