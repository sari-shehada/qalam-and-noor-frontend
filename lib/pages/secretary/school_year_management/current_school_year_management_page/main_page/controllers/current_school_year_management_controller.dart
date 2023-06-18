import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/educational/current_school_year_insights.dart';
import 'package:kalam_noor/models/educational/school_year.dart';
import 'package:kalam_noor/models/educational/semester.dart';
import 'package:kalam_noor/models/helpers/database_helpers/semesters_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/students_db_helper.dart';

import '../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../open_new_classrooms_dialog/dialogs/open_new_classrooms_dialog.dart';
import '../../school_year_students_enrollment/shared/views/school_year_students_enrollment_dialog.dart';
import '../views/widgets/student_count_in_school_year_widget.dart';

class CurrentSchoolYearManagementController extends GetxController {
  CurrentSchoolYearManagementController({
    required this.schoolYear,
    required this.schoolYearInsights,
  });

  SchoolYear schoolYear;
  Rx<CurrentSchoolYearInsights> schoolYearInsights;
  late Rx<Future<List<Semester>>> semestersInSchoolYear;
  Rx<Semester?> currentSemesterInSchoolYear = Rx<Semester?>(null);
  late Rx<Future<SchoolYearStudentCountStats>> studentsCount;

  @override
  onInit() {
    semestersInSchoolYear = getSemestersInSchoolYear().obs;
    studentsCount = getStudentsCount().obs;
    super.onInit();
  }

  Future<List<Semester>> getSemestersInSchoolYear() async {
    List<Semester> semesters = await SemestersDBHelper.instance.getAll();
    //TODO: Change to a real sorting
    semesters = semesters
        .where((element) => element.schoolYearId == schoolYear.id)
        .toList();
    semesters.sort(
      (a, b) => a.id.compareTo(b.id),
    );
    currentSemesterInSchoolYear.value = semesters.last;
    return semesters;
  }

  Future<SchoolYearStudentCountStats> getStudentsCount() async {
    List<Student> studentsInSchoolYear =
        await StudentsDBHelper.instance.getStudentsInCurrentSchoolYear();
    int allCount = studentsInSchoolYear.length;
    studentsInSchoolYear = studentsInSchoolYear
        .where((element) => element.isMale == true)
        .toList();
    int malesCount = studentsInSchoolYear.length;
    int femalesCount = allCount - malesCount;
    return SchoolYearStudentCountStats(
      totalCount: allCount,
      males: malesCount,
      females: femalesCount,
    );
  }

  refreshSemestersInSchoolYear() {
    semestersInSchoolYear.value = getSemestersInSchoolYear();
  }

  refreshStudentsCount() {
    studentsCount.value = getStudentsCount();
  }

  Future<void> manageClassroomsInSchoolYear() async {
    var result = await Get.dialog(
      const OpenNewClassroomsDialog(),
    );
    if (result == true) {
      updateClassroomsAndClassesCount();
    }
  }

  void updateClassroomsAndClassesCount() async {
    int classRoomsCount = await getClassroomsCount();
    schoolYearInsights.update(
      (val) {
        val = val?.copyWith(
          classRoomsCount: classRoomsCount,
        );
      },
    );
    int classesCount = await getClassesCount();
    schoolYearInsights.update(
      (val) {
        val = val?.copyWith(
          classesCount: classesCount,
        );
      },
    );
  }

  Future<void> enrollNewStudentsToSchoolYear() async {
    var result = await Get.dialog(
      const SchoolYearStudentsEnrollmentDialog(),
    );
    if (result is int) {
      SnackBarService.showSuccessSnackBar(
        title: 'تمت العملية بنجاح',
        message: 'تم تسجيل $result طالب بنجاح',
      );
    }
  }

  Future<int> getClassroomsCount() async {
    return 14; //TODO:
  }

  Future<int> getClassesCount() async {
    return 2; //TODO:
  }
}
