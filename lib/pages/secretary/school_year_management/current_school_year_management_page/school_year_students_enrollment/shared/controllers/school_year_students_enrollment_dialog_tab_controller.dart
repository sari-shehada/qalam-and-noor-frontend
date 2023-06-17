import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/controllers/school_year_students_enrollment_dialog_primary_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/class_selection/controllers/class_selection_sub_page_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/classroom_selection/controllers/classroom_selection_sub_page_controller.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

class SchoolYearStudentsEnrollmentDialogTabController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  RxInt currentPage = 0.obs;
  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;
  List<SchoolYearStudentRegistrationSectionInfo> sections = [
    SchoolYearStudentRegistrationSectionInfo(
      title: 'اختيار الصف',
      helperMessage: 'قم باختيار الصف من القائمة ادناه',
    ),
    SchoolYearStudentRegistrationSectionInfo(
      title: 'اختيار الشعبة',
      helperMessage: 'قم باختيار الشعبة المراد تسجيل الطلاب فيها',
    ),
    SchoolYearStudentRegistrationSectionInfo(
      title: 'تسجيل الطلاب الجدد',
      helperMessage: 'قم باختيار الطلاب المراد تسجيلهم من القائمة ادناه',
    ),
    SchoolYearStudentRegistrationSectionInfo(
      title: 'تسجيل الطلاب الناجحين الى الصف',
      helperMessage: 'قم باختيار الطلاب المراد تسجيلهم من القائمة ادناه',
    ),
    SchoolYearStudentRegistrationSectionInfo(
      title: 'تسجيل الطلاب الراسبين في الصف',
      helperMessage: 'قم باختيار الطلاب المراد تسجيلهم من القائمة ادناه',
    ),
  ];

  @override
  void onInit() {
    tabController = TabController(
      vsync: this,
      length: sections.length,
    );
    super.onInit();
  }

  void toNextPage() {
    String? validationMessage;
    switch (currentPage.value) {
      case 0:
        {
          validationMessage = Get.find<ClassSelectionSubPageController>()
              .validatePageRequirements();
          break;
        }
      case 1:
        {
          validationMessage = Get.find<ClassroomSelectionSubPageController>()
              .validatePageRequirements();
          break;
        }
    }
    if (validationMessage != null) {
      SnackBarService.showErrorSnackBar(
        title: 'خطأ في المدخلات',
        message: validationMessage,
      );
      return;
    }
    navigateToNextPage();
  }

  toPreviousPage() {
    if (currentPage.value > 0) {
      tabController.animateTo(--currentPage.value);
    }
  }

  void navigateToNextPage() {
    if (currentPage.value < sections.length - 1) {
      tabController.animateTo(++currentPage.value);
      return;
    }
    registerSelectedStudents();
  }

  String getStatusToDisplay() {
    String status = '';
    if (currentPage.value > 0) {
      status +=
          'الصف ${Get.find<ClassSelectionSubPageController>().selectedClass.value!.name}';
    }
    if (currentPage.value > 1) {
      status +=
          '   >   ${Get.find<ClassroomSelectionSubPageController>().selectedClassroom.value!.name}';
    }
    return status;
  }

  void registerSelectedStudents() async {
    buttonStatus.value = CustomButtonStatus.processing;
    await Get.find<SchoolYearStudentsEnrollmentDialogPrimaryController>()
        .registerSelectedStudents();
    buttonStatus.value = CustomButtonStatus.enabled;
  }
}

class SchoolYearStudentRegistrationSectionInfo {
  SchoolYearStudentRegistrationSectionInfo({
    required this.title,
    required this.helperMessage,
  });
  final String title;
  final String helperMessage;
}
