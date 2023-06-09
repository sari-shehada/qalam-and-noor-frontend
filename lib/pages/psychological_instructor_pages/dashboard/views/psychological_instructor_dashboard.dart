import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/psychological_instructor_pages/dashboard/controller/psychological_instructor_dashboard_controller.dart';
import 'package:kalam_noor/pages/psychological_instructor_pages/dashboard/views/widgets/psychological_statuses_pie_chart_widget.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../tools/widgets/employee_dashboard_profile_widget.dart';
import '../models/psychological_instructor_dashboard_cards_info.dart';

class PsychologicalInstructorDashboard extends StatelessWidget {
  const PsychologicalInstructorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    PsychologicalInstructorDashboardController dashboardController = Get.put(
      PsychologicalInstructorDashboardController(),
    );
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'صفحة المرشد الاجتماعي',
        iconData: FontAwesomeIcons.faceMehBlank,
        actionButton: EmployeeDashboardProfileWidget(),
      ),
      body: SizedBox.expand(
        child: Padding(
            padding: EdgeInsets.only(
              left: 40.w,
              right: 40.w,
              top: 20.h,
              bottom: 25,
            ),
            child: FutureBuilder(
              future: dashboardController
                  .psychologicalInstructorDashboardCardsInfo.value,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey.shade300,
                    direction: ShimmerDirection.rtl,
                    child: _buildCards(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return _buildCards(
                      snapshot: snapshot,
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: ErrorLoadingSomethingWidget(
                        somethingName: 'بطاقات الواجهة الرئيسية',
                      ),
                    );
                  }
                }
                return const SizedBox.shrink();
              },
            )),
      ),
    );
  }

  Widget _buildCards({
    AsyncSnapshot<PsychologicalInstructorDashboardCardsInfo>? snapshot,
  }) {
    final ColorScheme colorScheme = Get.theme.colorScheme;
    final BoxDecoration statsContainerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14.r),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 10.h),
          blurRadius: 10,
          color: colorScheme.shadow.withOpacity(.02),
        )
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 65,
                child: Container(
                  decoration: statsContainerDecoration,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: snapshot == null
                        ? null
                        : PsychologicalStatusesPieChartWidget(
                            legendTitle:
                                'اكثر الحالات الاجتماعية من حيث عدد الطلاب',
                            data: snapshot
                                .data!.psychologicalStatusesToStudentCount,
                            onFailedToLoadText:
                                'تعذر بناء إحصائية الحالات الاجتماعية للطلاب',
                          ),
                  ),
                ),
              ),
              AddHorizontalSpacing(value: 20.w),
              Expanded(
                flex: 35,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: statsContainerDecoration,
                      ),
                    ),
                    AddVerticalSpacing(value: 15.h),
                    Expanded(
                      child: Container(
                        decoration: statsContainerDecoration,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        AddVerticalSpacing(value: 20.h),
        Expanded(
            child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: statsContainerDecoration,
                child: snapshot == null
                    ? null
                    : PsychologicalStatusesPieChartWidget(
                        legendTitle:
                            'اكثر الحالات الاجتماعية من حيث عدد الطلاب الذكور',
                        data: snapshot
                            .data!.malePsychologicalStatusesToStudentCount,
                        onFailedToLoadText:
                            'تعذر بناء إحصائيات الحالات الاجتماعية للطلاب الذكور',
                      ),
              ),
            ),
            AddHorizontalSpacing(value: 20.w),
            Expanded(
              flex: 3,
              child: Container(
                decoration: statsContainerDecoration,
                child: snapshot == null
                    ? null
                    : PsychologicalStatusesPieChartWidget(
                        legendTitle:
                            'اكثر الحالات الاجتماعية من حيث عدد الطلاب الإناث',
                        data: snapshot
                            .data!.femalePsychologicalStatusesToStudentCount,
                        onFailedToLoadText:
                            'تعذر بناء إحصائيات الحالات الاجتماعية للطلاب الإناث',
                      ),
              ),
            ),
            AddHorizontalSpacing(value: 20.w),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: statsContainerDecoration,
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  Expanded(
                    child: Container(
                      decoration: statsContainerDecoration,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ))
      ],
    );
  }
}
