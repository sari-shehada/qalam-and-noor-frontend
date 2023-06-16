import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/main_page/controllers/register_new_students_in_school_year_tab_controller.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

import '../../sub_pages/class_selection_sub_page/controllers/class_selection_sub_page_controller.dart';
import '../../sub_pages/classroom_selection_sub_page/controllers/classroom_selection_sub_page_controller.dart';
import '../../sub_pages/school_year_new_students_registration_sub_page/controllers/school_year_new_students_registration_sub_page_controller.dart';

class RegisterNewStudentsInSchoolYearDialogPrimaryController
    extends GetxController {
  late RegisterNewStudentsInSchoolYearTabController tabController;
  late ClassSelectionSubPageController classSelectionController;
  late ClassroomSelectionSubPageController classroomSelectionController;
  late SchoolYearNewStudentsRegistrationSubPageController
      schoolYearNewStudentsRegistrationSubPageController;

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
    super.onInit();
  }
}
