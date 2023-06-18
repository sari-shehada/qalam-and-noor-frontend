// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kalam_noor/pages/teacher/fill_students_marks_page/models/student_exam_mark.dart';

class StudentExamMarkEditingModel {
  final StudentExamMark studentExamMark;
  final TextEditingController editingController;
  StudentExamMarkEditingModel({
    required this.studentExamMark,
    required this.editingController,
  }) {
    if (!isAddMode()) {
      editingController.text =
          studentExamMark.semesterExam!.obtainedGrade.toString();
    }
  }

  bool isEmpty() {
    return editingController.text.isEmpty;
  }

  bool isAddMode() {
    return studentExamMark.semesterExam == null;
  }

  bool changeHappened() {
    return int.parse(editingController.text) !=
        studentExamMark.semesterExam!.obtainedGrade;
  }
}
