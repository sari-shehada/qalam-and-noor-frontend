import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/models/educational/exam.dart';
import 'package:kalam_noor/models/educational/semester_exam.dart';
import 'package:kalam_noor/models/helpers/database_helpers/semester_exams_db_helper.dart';
import 'package:kalam_noor/models/item_or.dart';
import 'package:kalam_noor/pages/teacher/fill_students_marks_page/models/student_exam_mark_insertion.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import '../../../../../models/helpers/database_helpers/students_db_helper.dart';
import '../models/student_exam_mark_editing_model.dart';

class FillStudentMarksController extends GetxController {
  FillStudentMarksController({
    required this.course,
    required this.classroom,
    required this.exam,
  });

  RxBool isLoading = true.obs;
  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;
  TextEditingController searchFieldController = TextEditingController();
  RxList<StudentExamMarkEditingModel> students =
      <StudentExamMarkEditingModel>[].obs;
  final Classroom classroom;
  final Course course;
  final Exam exam;

  late final double fullMark;
  @override
  void onInit() {
    fullMark = course.totalGrade * exam.percentage / 100;
    refreshStudents();
    super.onInit();
  }

  void performSearch() async {
    if (searchFieldController.text.isEmpty) {
      return;
    }
    students.value = await _getStudents(withSearch: true);
  }

  void clearSearchData() {
    refreshStudents();
  }

  void refreshStudents() async {
    students.value = await _getStudents();
  }

  Future<List<StudentExamMarkEditingModel>> _getStudents({
    bool withSearch = false,
  }) async {
    try {
      isLoading.value = true;
      if (!withSearch) {
        if (searchFieldController.text.isNotEmpty) {
          searchFieldController.text = '';
        }
        return await getStudentsList();
      }
      List<StudentExamMarkEditingModel> temporaryStudents = [];
      temporaryStudents = await getStudentsList();
      if (searchFieldController.text.isNumericOnly) {
        return temporaryStudents
            .where(
              (element) =>
                  element.studentExamMark.student.publicRecordId ==
                  int.parse(searchFieldController.text),
            )
            .toList();
      } else {
        return temporaryStudents
            .where(
              (element) => element.studentExamMark.student.firstName.contains(
                searchFieldController.text,
              ),
            )
            .toList();
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<StudentExamMarkEditingModel>> getStudentsList() async {
    return await StudentsDBHelper.instance
        .getStudentsExamMarks(
          examId: exam.id,
          clasRoomId: classroom.id,
          courseId: course.id,
        )
        .then(
          (value) => value
              .map(
                (e) => StudentExamMarkEditingModel(
                  studentExamMark: e,
                  editingController: TextEditingController(),
                ),
              )
              .toList(),
        );
  }

  Future<bool> addNewStudentMarks() async {
    List<StudentExamMarkEditingModel> insertionStudents = students
        .where(
          (p0) => p0.isAddMode(),
        )
        .toList();
    if (insertionStudents.isEmpty) {
      return true;
    }
    Map<String, int> insertionStudentsMap = {};
    insertionStudents.forEach(
      (element) {
        insertionStudentsMap[element.studentExamMark.yearRecord.id.toString()] =
            int.parse(element.editingController.text);
      },
    );
    StudentExamMarkInsertion insertionDTO = StudentExamMarkInsertion(
      courseId: course.id,
      examId: exam.id,
      studentMark: insertionStudentsMap,
    );
    ItemOr<String> insertionResult =
        await StudentsDBHelper.instance.addNewMarksToStudentExams(
      studentExamMarkInsertion: insertionDTO,
    );
    return insertionResult.success;
  }

  Future<bool> updateExistingStudentsMarks() async {
    List<SemesterExam> toEditMarks = students
        .where(
          (p0) =>
              p0.studentExamMark.semesterExam != null && p0.changeHappened(),
        )
        .toList()
        .map(
          (e) => e.studentExamMark.semesterExam!.copyWith(
            obtainedGrade: double.parse(e.editingController.text),
          ),
        )
        .toList();
    if (toEditMarks.isEmpty) {
      return true;
    }
    for (var element in toEditMarks) {
      if (!await SemesterExamsDBHelper.instance.update(element)) {
        return false;
      }
    }
    return true;
  }

  Future<void> addStudentsMarks() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      String? validationMessage = validateFields();
      if (validationMessage != null) {
        SnackBarService.showErrorSnackBar(
          title: 'خطأ في المدخلات',
          message: validationMessage,
        );
        return;
      }
      if (!await addNewStudentMarks()) {
        SnackBarService.showErrorSnackBar(
          title: 'حدث خطأ',
          message: 'حدث خطأ اثناء تسجيل العلامات الجديدة للطلاب',
        );
        return;
      }
      if (!await updateExistingStudentsMarks()) {
        SnackBarService.showErrorSnackBar(
          title: 'حدث خطأ',
          message: 'حدث خطأ اثناء تعديل العلامات السابقة للطلاب',
        );
        return;
      }
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  String? validateFields() {
    for (var element in students) {
      if (element.isEmpty()) {
        return 'الرجاء اضافة علامة للطالب ${element.studentExamMark.fullName}';
      }
      if (int.parse(element.editingController.text) > fullMark) {
        return 'يرجى ادخال علامة صالحة للطالب ${element.studentExamMark.fullName}';
      }
    }
    return null;
  }
}
