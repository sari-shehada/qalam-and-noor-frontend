import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/students_db_helper.dart';
import 'package:kalam_noor/pages/psychological_instructor/student_fill_psychological_statuses_page/assign_student_psychological_info_page/controllers/assign_student_psychological_info_controller.dart';
import 'package:kalam_noor/pages/psychological_instructor/student_fill_psychological_statuses_page/assign_student_psychological_info_page/views/assign_student_psychological_info_page.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

import '../../../../../models/agendas/student.dart';

class StudentFillPsychologicalStatusesController extends GetxController {
  TextEditingController searchFieldController = TextEditingController();
  RxInt numberOfRemainingStudents = 0.obs;
  late Rx<Future<List<Student>>> students;

  @override
  void onInit() {
    students = _getStudents().obs;
    super.onInit();
  }

  void performSearch() async {
    if (searchFieldController.text.isEmpty) {
      return;
    }
    students.value = _getStudents(withSearch: true);
  }

  void clearSearchData() {
    refreshStudents();
  }

  void updateNumberOfRemainingStudents(int newNumber) {
    numberOfRemainingStudents.value = newNumber;
  }

  void refreshStudents() {
    students.value = _getStudents();
  }

  Future<List<Student>> _getStudents({
    bool withSearch = false,
  }) async {
    if (!withSearch) {
      if (searchFieldController.text.isNotEmpty) {
        searchFieldController.text = '';
      }
      return await getStudentsList();
    }
    List<Student> temporaryStudents = [];
    temporaryStudents = await getStudentsList();
    if (searchFieldController.text.isNumericOnly) {
      return temporaryStudents
          .where(
            (element) =>
                element.publicRecordId == int.parse(searchFieldController.text),
          )
          .toList();
    } else {
      return temporaryStudents
          .where(
            (element) => element.firstName.contains(
              searchFieldController.text,
            ),
          )
          .toList();
    }
  }

  Future<List<Student>> getStudentsList() async {
    List<Student> temporaryStudents = await StudentsDBHelper.instance
        .getStudentWithoutPsychologicalStatuses();
    if (numberOfRemainingStudents.value != temporaryStudents.length) {
      updateNumberOfRemainingStudents(temporaryStudents.length);
    }
    return temporaryStudents;
  }

  Future<void> addStudentPsychologicalInfo(Student student) async {
    var result = await Get.to(
      () => const AssignStudentPsychologicalInfoPage(),
      binding: BindingsBuilder.put(
        () => AssignStudentPsychologicalInfoController(student: student),
      ),
    );
    if (result == true) {
      SnackBarService.showSuccessSnackBar(
          title: 'تمت العملية بنجاح',
          message: 'تم تحديد الحالات الاجتماعية ل${student.firstName}');
      refreshStudents();
    }
  }
}
