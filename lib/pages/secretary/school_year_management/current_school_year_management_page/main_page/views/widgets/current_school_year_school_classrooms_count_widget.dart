import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/widgets/sub_widgets/current_school_year_numeric_stats_widget.dart';

import '../../../../../../../models/enums.dart';
import '../../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../../tools/widgets/error_loading_something_widget.dart';
import '../../controllers/widget_controllers/school_year_classrooms_controller.dart';

class CurrentSchoolYearClassroomsCountWidget
    extends GetView<SchoolYearClassroomsController> {
  const CurrentSchoolYearClassroomsCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.loadingStatus.value) {
        case GeneralLoadingStatus.isLoading:
          {
            return const Center(
              child: LoaderWidget(),
            );
          }
        case GeneralLoadingStatus.hasData:
          {
            return CurrentSchoolYearNumericStatsWidget(
              title: 'عدد الشعب المفتوحة',
              count: controller.classroomsCount.toDouble(),
            );
          }
        case GeneralLoadingStatus.hasError:
          {
            return const ErrorLoadingSomethingWidget(
              somethingName: 'TODO',
            );
          }
      }
    });
  }
}
