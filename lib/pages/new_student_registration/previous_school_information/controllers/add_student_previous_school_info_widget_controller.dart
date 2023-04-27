// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:kalam_noor/models/previous_schools/previous_schools.dart';
import 'package:kalam_noor/models/previous_schools/student_previous_school.dart';
import 'package:kalam_noor/pages/new_student_registration/previous_school_information/views/dialogs/add_student_previous_schools_info_dialog.dart';

class StudentPreviousSchoolInfoController extends GetxController {
  Rx<StudentPreviousSchoolInfo?> studentPreviousSchoolInfo =
      Rx<StudentPreviousSchoolInfo?>(null);

  Future<void> selectPreviousSchool() async {
    var result = await Get.dialog(const AddStudentPreviousSchoolInfo());
    if (result is StudentPreviousSchoolInfo) {
      studentPreviousSchoolInfo.value = result;
      studentPreviousSchoolInfo.refresh();
    }
  }

  StudentPreviousSchool? encapsulateData() {
    if (studentPreviousSchoolInfo.value == null) {
      return null;
    }
    return StudentPreviousSchool(
      id: -1,
      studentId: -1,
      previousSchoolId: studentPreviousSchoolInfo.value!.previousSchool.id,
      notes: studentPreviousSchoolInfo.value!.notes,
    );
  }
}

class StudentPreviousSchoolInfo {
  final PreviousSchool previousSchool;
  final String notes;
  StudentPreviousSchoolInfo({
    required this.previousSchool,
    required this.notes,
  });
}
