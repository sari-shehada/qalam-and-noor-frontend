import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/current_school_year_insights.dart';
import 'package:kalam_noor/models/educational/school_year.dart';

import '../../open_new_classrooms_dialog/dialogs/open_new_classrooms_dialog.dart';

class CurrentSchoolYearManagementController extends GetxController {
  CurrentSchoolYearManagementController({
    required this.schoolYear,
    required this.schoolYearInsights,
  });

  SchoolYear schoolYear;
  Rx<CurrentSchoolYearInsights> schoolYearInsights;

  Future<void> manageClassroomsInSchoolYear() async {
    var result = await Get.dialog(
      const OpenNewClassroomsDialog(),
    );
    if (result == true) {
      updateClassroomsAndClassesCount();
    }
  }

  void updateClassroomsAndClassesCount() async {
    int classRoomsCount = await getClassroomsCount();
    schoolYearInsights.update(
      (val) {
        val = val?.copyWith(
          classRoomsCount: classRoomsCount,
        );
      },
    );
    int classesCount = await getClassesCount();
    schoolYearInsights.update(
      (val) {
        val = val?.copyWith(
          classesCount: classesCount,
        );
      },
    );
  }

  Future<int> getClassroomsCount() async {
    return 14; //TODO:
  }

  Future<int> getClassesCount() async {
    return 2; //TODO:
  }
}
