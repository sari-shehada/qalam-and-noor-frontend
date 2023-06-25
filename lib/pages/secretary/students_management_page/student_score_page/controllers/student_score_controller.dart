import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/educational/semester.dart';
import 'package:kalam_noor/models/helpers/database_helpers/semesters_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/students_db_helper.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/student_score_page/models/final_student_score.dart';
import '../../../../../models/educational/school_year.dart';
import '../models/student_semester_score.dart';

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
  final RxBool isOnFinalStudentScore = false.obs;
  final RxBool isLoadingFinalScore = true.obs;
  final RxInt selectedIndex = (-1).obs;

  late StudentSemesterScore currentSemesterStudentScore;
  late FinalStudentScore finalStudentScore;
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
    print("done");
    await getFinalScore();
    print("done2");
  }

  Future<StudentSemesterScore> getStudentScores(
      {required int semesterId}) async {
    isLoadingGrades.value = true;
    currentSemesterStudentScore =
        await StudentsDBHelper.instance.getStudentScores(
      studentId: student.id,
      schoolYearId: schoolYear.id,
      semesterId: semesterId,
    );
    isLoadingGrades.value = false;
    return currentSemesterStudentScore;
  }

  Future<FinalStudentScore> getFinalScore() async {
    isLoadingFinalScore.value = true;
    finalStudentScore = await StudentsDBHelper.instance
        .getFinalScore(student.id, schoolYear.id);
    isLoadingFinalScore.value = false;
    return finalStudentScore;
  }
}
