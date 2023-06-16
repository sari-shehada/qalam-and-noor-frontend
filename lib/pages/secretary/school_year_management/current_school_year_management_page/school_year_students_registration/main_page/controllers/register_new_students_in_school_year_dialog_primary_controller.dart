import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_registration/main_page/controllers/register_new_students_in_school_year_tab_controller.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

import '../../sub_pages/class_selection/controllers/class_selection_sub_page_controller.dart';
import '../../sub_pages/classroom_selection/controllers/classroom_selection_sub_page_controller.dart';
import '../../sub_pages/succeeding_students_selection/controllers/school_year_succeeding_students_registration_sub_page_controller.dart';
import '../../sub_pages/new_students_selection/controllers/school_year_new_students_registration_sub_page_controller.dart';
import '../../sub_pages/failing_students_selection/controllers/school_year_failing_students_registration_sub_page_controller.dart';

class RegisterNewStudentsInSchoolYearDialogPrimaryController
    extends GetxController {
  late RegisterNewStudentsInSchoolYearTabController tabController;
  late ClassSelectionSubPageController classSelectionController;
  late ClassroomSelectionSubPageController classroomSelectionController;
  late SchoolYearNewStudentsRegistrationSubPageController
      schoolYearNewStudentsRegistrationSubPageController;
  late SchoolYearSucceedingStudentsRegistrationSubPageController
      schoolYearSucceedingStudentsRegistrationSubPageController;
  late SchoolYearFailingStudentsRegistrationSubPageController
      schoolYearFailingStudentsRegistrationSubPageController;

  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;

  @override
  void onInit() {
    tabController = Get.put(
      RegisterNewStudentsInSchoolYearTabController(),
    );
    classSelectionController = Get.put(
      ClassSelectionSubPageController(),
    );
    classroomSelectionController = Get.put(
      ClassroomSelectionSubPageController(),
    );
    schoolYearNewStudentsRegistrationSubPageController = Get.put(
      SchoolYearNewStudentsRegistrationSubPageController(),
    );
    schoolYearSucceedingStudentsRegistrationSubPageController = Get.put(
      SchoolYearSucceedingStudentsRegistrationSubPageController(),
    );
    schoolYearFailingStudentsRegistrationSubPageController = Get.put(
      SchoolYearFailingStudentsRegistrationSubPageController(),
    );
    super.onInit();
  }
}
