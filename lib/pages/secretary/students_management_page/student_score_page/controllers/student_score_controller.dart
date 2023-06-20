import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/educational/semester.dart';
import 'package:kalam_noor/models/helpers/database_helpers/semesters_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/students_db_helper.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_score_page/models/student_scores.dart';

import '../../../../../models/educational/school_year.dart';

class StudentScoreController extends GetxController {
  final Student student;
  final SchoolYear schoolYear;
  StudentScoreController({
    required this.student,
    required this.schoolYear,
  }) {
    loadData();
  }

  //Observables
  final RxBool isLoadingSemesters = true.obs;
  final RxBool isLoadingGrades = true.obs;

  final RxInt selectedIndex = (-1).obs;
  late List<StudentScores> currentSemesterStudentScores;
  late List<Semester> semesters;

  Future<List<Semester>> getSemesters() async {
    semesters = await SemestersDBHelper.instance
        .getSemestersInSchoolYear(schoolYear.id);
    return semesters;
  }

  Future<void> loadData() async {
    isLoadingSemesters.value = true;
    await getSemesters();
    isLoadingSemesters.value = false;
  }

  Future<List<StudentScores>> getStudentScores(
      {required int semesterId}) async {
    isLoadingGrades.value = true;
    currentSemesterStudentScores =
        await StudentsDBHelper.instance.getStudentScores(
      studentId: student.id,
      schoolYearId: schoolYear.id,
      semesterId: semesterId,
    );
    isLoadingGrades.value = false;
    return currentSemesterStudentScores;
  }
}
