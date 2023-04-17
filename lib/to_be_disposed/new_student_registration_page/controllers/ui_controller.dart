import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../views/dialogs/student_civilian_information_sub_window.dart';
import '../views/dialogs/student_personal_information_sub_window.dart';

class RegisterNewStudentUIController extends GetxController {
  final RxBool isLastPageReached = false.obs;
  final RxInt currentPageIndex = 0.obs;

  List<Widget> pages = [
    const StudentPersonalInformationSubWindow(),
    const StudentCivilianInformationSubWindow(),
  ];
  Future<void> nextPage() async {
    if (currentPageIndex.value < pages.length) {
      currentPageIndex.value++;
      checkLastPage();
    }
  }

  Future<void> previousPage() async {
    if (currentPageIndex.value > 0) {
      currentPageIndex.value--;
      checkLastPage();
    }
  }

  checkLastPage() {
    if (currentPageIndex.value == (pages.length - 1)) {
      isLastPageReached.value = true;
    } else {
      isLastPageReached.value = false;
    }
  }
}

class _RegisterNewStudentUIControllerConstants {
  static Duration get animationDuration => const Duration(milliseconds: 600);
  static Curve get animationCurve => Curves.fastLinearToSlowEaseIn;
}
