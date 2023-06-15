import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../configs/assets.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../configs/styles.dart';
import '../../../../../../models/educational/current_school_year_insights.dart';
import '../../../../../../models/educational/school_year.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';

import '../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../tools/widgets/error_loading_something_widget.dart';
import '../../controllers/school_year_management_controller.dart';

class CurrentSchoolYearCard extends GetView<SchoolYearManagementController> {
  const CurrentSchoolYearCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20.r),
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF393939).withOpacity(.06),
              blurRadius: 60,
              offset: const Offset(0, 30),
            ),
          ],
        ),
        child: Obx(
          () {
            try {
              if (controller.isLoading.value) {
                return const Center(
                  child: LoaderWidget(),
                );
              }
              return CurrentSchoolYearCardData(
                schoolYear: controller.currentSchoolYear.value,
                insights: controller.currentSchoolYearInsights.value,
              );
            } catch (e) {
              return ErrorLoadingSomethingWidget(
                somethingName: 'العام الدراسي الحالي',
                retryCallback: () => controller.getData(),
              );
            }
          },
        ),
      ),
    );
  }
}

class CurrentSchoolYearCardData
    extends GetView<SchoolYearManagementController> {
  const CurrentSchoolYearCardData({
    super.key,
    required this.schoolYear,
    required this.insights,
  });

  final SchoolYear schoolYear;
  final CurrentSchoolYearInsights insights;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          height: 410.w,
          width: 410.w,
          right: 0.w,
          top: -65.h,
          child: SvgPicture.asset(
            GlobalAssets.currentSchoolYearIllustration,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          height: 410.w,
          width: 410.w,
          right: 0.w,
          top: -65.h,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(.3),
                  Colors.white.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
          child: InkWell(
            onTap: () => controller.manageCurrentSchoolYear(),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 0.w,
                end: 50.w,
                top: 15.h,
                bottom: 15.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 23,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 57,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          schoolYear.name,
                          style: ProjectFonts.displayLarge(),
                        ),
                        AddVerticalSpacing(value: 10.h),
                        Text(
                          'العام الدراسي الحالي',
                          style: ProjectFonts.displaySmall(),
                        ),
                        AddVerticalSpacing(value: 20.h),
                        Text(
                          'الحالة: ${schoolYear.isFinished ? 'منتهي' : 'يزال جاريا'}',
                          style: ProjectFonts.headlineMedium().copyWith(
                            color: Get.theme.colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CurrentSchoolYearInsightMiniCard(
                          description: 'طالب',
                          count: insights.studentsCount,
                          color: GlobalStyles.miscColors[0],
                        ),
                        CurrentSchoolYearInsightMiniCard(
                          description: 'شعبة مفتوحة',
                          count: insights.classRoomsCount,
                          color: GlobalStyles.miscColors[1],
                        ),
                        CurrentSchoolYearInsightMiniCard(
                          description: 'صف مفتوح',
                          count: insights.classesCount,
                          color: GlobalStyles.miscColors[2],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CurrentSchoolYearInsightMiniCard extends StatelessWidget {
  const CurrentSchoolYearInsightMiniCard({
    super.key,
    required this.description,
    required this.count,
    required this.color,
  });

  final String description;
  final int count;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        color: color,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 24,
      ),
      child: Row(
        children: [
          Text(
            count.toString(),
            style: ProjectFonts.headlineSmall().copyWith(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
          AddHorizontalSpacing(value: 15.w),
          Text(
            description,
            style: ProjectFonts.headlineSmall().copyWith(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
