import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/models/educational/exam.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/helpers/database_helpers/classrooms_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/exams_db_helper.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

class ClassroomAndExamSelectionDialogController extends GetxController {
  ClassroomAndExamSelectionDialogController({
    required this.schoolClass,
  }) {
    getClassrooms();
    getExams();
  }
  final SchoolClass schoolClass;
  Rx<Exam?> selectedExam = Rx<Exam?>(null);
  RxList<Exam> exams = <Exam>[].obs;
  Rx<Classroom?> selectedClassroom = Rx<Classroom?>(null);
  RxList<Classroom> classrooms = <Classroom>[].obs;

  Future<List<Classroom>> getClassrooms() async {
    classrooms.value = await ClassroomDBHelper.instance
        .getAllClassroomsByClassId(schoolClass.id);
    return classrooms;
  }

  bool validateFields() {
    if (selectedClassroom.value == null) {
      SnackBarService.showErrorSnackBar(
          title: "لم يتم إختيار الشعبة", message: "الرجاء إختيار شعبة");
      return false;
    }
    if (selectedExam.value == null) {
      SnackBarService.showErrorSnackBar(
          title: "لم يتم إختيار الإمتحان", message: "الرجاء إختيار إمتحان");
      return false;
    }
    return true;
  }

  Future<List<Exam>> getExams() async {
    exams.value =
        await ExamsDBHelper.instance.getExamsByClassId(schoolClass.id);
    return exams;
  }

  void changeExam(Exam? exam) {
    if (exam == null) {
      return;
    }
    if (exam.id == -1) {
      selectedExam.value = null;
    } else {
      selectedExam.value = exam;
    }
  }
}
