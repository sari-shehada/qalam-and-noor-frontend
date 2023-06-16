import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/educational/semester.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/controllers/current_school_year_management_controller.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../../../configs/styles.dart';
import '../../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../../tools/widgets/empty_item_widget.dart';
import '../../../../../../../tools/widgets/error_loading_something_widget.dart';

class SemestersInSchoolYearWidget
    extends GetView<CurrentSchoolYearManagementController> {
  const SemestersInSchoolYearWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          GlobalStyles.globalBorderRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF393939).withOpacity(.06),
            blurRadius: 60,
            offset: const Offset(0, 30),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 20.h,
      ),
      child: FutureBuilder<List<Semester>>(
        future: controller.semestersInSchoolYear.value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LoaderWidget(),
            );
          }
          if (snapshot.hasError) {
            return ErrorLoadingSomethingWidget(
              somethingName: 'الفصول في العام الدراسي',
              retryCallback: () => controller.refreshSemestersInSchoolYear(),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const EmptyItemWidget(
                itemName: 'فصول',
                iconData: FontAwesomeIcons.locationArrow, //TODO:
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الفصول الدراسية في العام الدراسي الحالي',
                    style: ProjectFonts.titleLarge(),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  Expanded(
                    child: _SemestersInSchoolYearDisplayWidget(
                      semesters: snapshot.data as List<Semester>,
                    ),
                  ),
                ],
              );
            }
          } else {
            return const EmptyItemWidget(
              itemName: 'فصول',
              iconData: FontAwesomeIcons.locationArrow, //TODO:
            );
          }
        },
      ),
    );
  }
}

class _SemestersInSchoolYearDisplayWidget extends StatelessWidget {
  const _SemestersInSchoolYearDisplayWidget({required this.semesters});

  final List<Semester> semesters;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Get.theme.colorScheme;
    return ListView.separated(
      padding: EdgeInsetsDirectional.only(start: 10.w, top: 10.h, bottom: 10.h),
      scrollDirection: Axis.horizontal,
      itemCount: semesters.length,
      itemBuilder: (_, index) {
        bool isCurrentSemester = index == semesters.length - 1;
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 5.h,
          ),
          height: double.infinity,
          width: 250.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              GlobalStyles.globalBorderRadius,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF393939).withOpacity(.06),
                blurRadius: 60,
                offset: const Offset(0, 30),
              ),
            ],
            color: isCurrentSemester ? colorScheme.primary : Colors.white,
            // shape: BoxShape.circle,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                semesters[index].name,
                style: ProjectFonts.headlineMedium().copyWith(
                  color: isCurrentSemester ? Colors.white : colorScheme.primary,
                ),
              ),
              AddHorizontalSpacing(value: 25.w),
              Text(
                '(${isCurrentSemester ? 'الفصل الحالي' : 'متنتهي'})',
                style: ProjectFonts.titleMedium().copyWith(
                  color: isCurrentSemester ? Colors.white : colorScheme.primary,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }
}
