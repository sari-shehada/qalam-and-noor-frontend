import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/assets.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/widgets/sub_widgets/current_school_year_shimmer_container.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../../../models/enums.dart';
import '../../../../../../../tools/widgets/error_loading_something_widget.dart';
import '../../controllers/widget_controllers/school_year_semesters_controller.dart';

class CurrentSemesterWidget extends GetView<SchoolYearSemestersController> {
  const CurrentSemesterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CurrentSchoolYearShimmerContainer(
        buildChildWithContainer:
            controller.loadingStatus.value == GeneralLoadingStatus.hasData
                ? true
                : true,
        child: _getChild(),
      ),
    );
  }

  Widget? _getChild() {
    switch (controller.loadingStatus.value) {
      case GeneralLoadingStatus.isLoading:
        {
          return null;
        }
      case GeneralLoadingStatus.hasData:
        {
          return const _SuccessfulLoadCurrentSemesterWidget();
        }
      case GeneralLoadingStatus.hasError:
        {
          return ErrorLoadingSomethingWidget(
            somethingName: 'TODO', //TODO:
            retryCallback: () => controller.loadSemesters(),
          );
        }
    }
  }
}

class _SuccessfulLoadCurrentSemesterWidget
    extends GetView<SchoolYearSemestersController> {
  const _SuccessfulLoadCurrentSemesterWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        Positioned(
          right: -140.w,
          top: -130.h,
          height: 800.sp,
          width: 800.sp,
          child: SvgPicture.asset(
            GlobalAssets.semesterIllustration,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(1),
                Colors.white.withOpacity(.8),
                Colors.white.withOpacity(0),
              ],
              stops: const [0, .8, 1],
            ),
          ),
        ),
        SizedBox(
          height: 460.h,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'الفصل الحالي',
                        style: ProjectFonts.headlineMedium(),
                      ),
                      const Spacer(),
                      Text(
                        controller.currentSemester.value!.name,
                        style: ProjectFonts.displayLarge(),
                      ),
                      AddVerticalSpacing(value: 100.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.h,
                          horizontal: 35.w,
                        ),
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.onSurfaceVariant
                              .withOpacity(.1),
                          borderRadius: BorderRadius.circular(
                            GlobalStyles.globalBorderRadius,
                          ),
                        ),
                        child: Builder(
                          builder: (_) {
                            String status =
                                controller.currentSemester.value!.isDone
                                    ? 'منتهي'
                                    : 'لا يزال جاريا';
                            return Text(
                              'الحالة | $status',
                              style: ProjectFonts.displaySmall(),
                            );
                          },
                        ),
                      ),
                      AddVerticalSpacing(value: 20.h),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25.h),
                height: double.infinity,
                color: Colors.black.withOpacity(.3),
                width: 2.w,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AddVerticalSpacing(value: 20.h),
                    Text(
                      'الفصول السابقة',
                      style: ProjectFonts.headlineMedium(),
                    ),
                    AddVerticalSpacing(
                      value: 20.h,
                    ),
                    Expanded(
                      child: controller.semesters.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.schoolCircleXmark,
                                    size: 90.sp,
                                    color:
                                        Get.theme.colorScheme.onSurfaceVariant,
                                  ),
                                  AddVerticalSpacing(value: 50.h),
                                  Text(
                                    'لا يوجد فصول سابقة للفصل الحالي',
                                    style: ProjectFonts.titleLarge().copyWith(
                                      color: Get
                                          .theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 30.h),
                                ],
                              ),
                            )
                          : ListView.separated(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                              ),
                              itemCount: controller.semesters.length + 2,
                              itemBuilder: (context, index) => Container(
                                height: 60.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    GlobalStyles.globalBorderRadius,
                                  ),
                                  border: Border.all(
                                    color: Get.theme.colorScheme.primary,
                                    width: 2.sp,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 8.h),
                                      blurRadius: 30,
                                      color: Get.theme.colorScheme.shadow
                                          .withOpacity(.06),
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    controller.currentSemester.value!.name,
                                    style: ProjectFonts.titleLarge().copyWith(
                                      color: Get
                                          .theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  AddVerticalSpacing(value: 10.h),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
