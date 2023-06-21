import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_year.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/controllers/widget_controllers/school_year_classrooms_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/controllers/widget_controllers/school_year_school_classes_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/controllers/widget_controllers/school_year_semesters_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/controllers/widget_controllers/school_year_students_controller.dart';

import 'current_school_year_management_controller.dart';

class CurrentSchoolYearBindings extends Bindings {
  SchoolYear currentSchoolYear;
  CurrentSchoolYearBindings({
    required this.currentSchoolYear,
  });
  @override
  void dependencies() {
    Get.put(
      CurrentSchoolYearManagementController(
        schoolYear: currentSchoolYear,
      ),
    );
    Get.put(
      SchoolYearSchoolClassesController(),
    );
    Get.put(
      SchoolYearClassroomsController(),
    );
    Get.put(
      SchoolYearSemestersController(),
    );
    Get.put(
      SchoolYearStudentsController(),
    );
  }
}
