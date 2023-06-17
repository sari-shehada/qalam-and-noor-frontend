import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/controllers/school_year_students_enrollment_dialog_tab_controller.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

import '../../sub_pages/class_selection/controllers/class_selection_sub_page_controller.dart';
import '../../sub_pages/classroom_selection/controllers/classroom_selection_sub_page_controller.dart';
import '../../sub_pages/succeeding_students_selection/controllers/school_year_succeeding_students_enrollment_sub_page_controller.dart';
import '../../sub_pages/new_students_selection/controllers/school_year_new_students_enrollment_sub_page_controller.dart';
import '../../sub_pages/failing_students_selection/controllers/school_year_failing_students_enrollment_sub_page_controller.dart';

class SchoolYearStudentsEnrollmentDialogPrimaryController
    extends GetxController {
  late SchoolYearStudentsEnrollmentDialogTabController tabController;
  late ClassSelectionSubPageController classSelectionController;
  late ClassroomSelectionSubPageController classroomSelectionController;
  late SchoolYearNewStudentsEnrollmentSubPageController
      schoolYearNewStudentsRegistrationSubPageController;
  late SchoolYearSucceedingStudentsEnrollmentSubPageController
      schoolYearSucceedingStudentsRegistrationSubPageController;
  late SchoolYearFailingStudentsEnrollmentSubPageController
      schoolYearFailingStudentsRegistrationSubPageController;

  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;

  @override
  void onInit() {
    tabController = Get.put(
      SchoolYearStudentsEnrollmentDialogTabController(),
    );
    classSelectionController = Get.put(
      ClassSelectionSubPageController(),
    );
    classroomSelectionController = Get.put(
      ClassroomSelectionSubPageController(),
    );
    schoolYearNewStudentsRegistrationSubPageController = Get.put(
      SchoolYearNewStudentsEnrollmentSubPageController(),
    );
    schoolYearSucceedingStudentsRegistrationSubPageController = Get.put(
      SchoolYearSucceedingStudentsEnrollmentSubPageController(),
    );
    schoolYearFailingStudentsRegistrationSubPageController = Get.put(
      SchoolYearFailingStudentsEnrollmentSubPageController(),
    );
    super.onInit();
  }
}
