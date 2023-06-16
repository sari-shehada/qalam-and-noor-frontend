import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/class_selection_sub_page/controllers/class_selection_sub_page_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/classroom_selection_sub_page/controllers/classroom_selection_sub_page_controller.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

class RegisterNewStudentsInSchoolYearTabController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  RxInt currentPage = 0.obs;
  List<String> sections = [
    'اختيار الصف',
    'اختيار الشعبة',
    'تسجيل الطلاب الجدد',
    'تسجيل الطلاب الناجحين الى الصف',
    'تسجيل الطلاب الراسبين في الصف',
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

  void navigateToNextPage() {
    if (currentPage.value < sections.length - 1) {
      tabController.animateTo(++currentPage.value);
    }
  }
}
