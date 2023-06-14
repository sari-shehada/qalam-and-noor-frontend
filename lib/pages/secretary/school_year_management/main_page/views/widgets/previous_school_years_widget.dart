import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/main_page/controllers/school_year_management_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/main_page/views/widgets/previous_semesters_table.dart';
import 'package:kalam_noor/tools/ui_tools/labeled_widget.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';

class PreviousSchoolYearsWidget
    extends GetView<SchoolYearManagementController> {
  const PreviousSchoolYearsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        try {
          if (controller.isLoading.value) {
            return const Center(
              child: LoaderWidget(),
            );
          }
          return Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: LabeledWidget(
              label: 'الأعوام الدراسية السابقة',
              labelTextStyle: TextStyle(
                fontSize: 30.sp,
              ),
              spacing: 35.h,
              child: Expanded(
                child: SchoolYearTable(
                  schoolYears: controller.otherSchoolYears,
                ),
              ),
            ),
          );
        } catch (e) {
          return const ErrorLoadingSomethingWidget(
            somethingName: 'الأعوام الدراسية السابقة',
          );
        }
      },
    );
  }
}
