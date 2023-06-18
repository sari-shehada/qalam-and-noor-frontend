import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/models/educational/exam.dart';
import '../../../../../models/helpers/database_helpers/students_db_helper.dart';
import '../../../../../models/agendas/student.dart';

class FillStudentMarksController extends GetxController {
  FillStudentMarksController({
    required this.course,
    required this.classroom,
    required this.exam,
  });
  TextEditingController searchFieldController = TextEditingController();
  late Rx<Future<List<Student>>> students;
  final Classroom classroom;
  final Course course;
  final Exam exam;

  late final double fullMark;
  @override
  void onInit() {
    fullMark = course.totalGrade * exam.percentage / 100;
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
    List<Student> classroomStudents = await StudentsDBHelper.instance
        .getActiveStudentsInSchoolYearByClassroomId(classroom.id);
    return classroomStudents;
  }
}
