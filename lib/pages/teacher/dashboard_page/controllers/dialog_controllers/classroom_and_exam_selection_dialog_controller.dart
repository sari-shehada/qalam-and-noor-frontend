import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/models/educational/exam.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/helpers/database_helpers/classrooms_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/exams_db_helper.dart';
import 'package:kalam_noor/pages/teacher/fill_students_marks_page/controllers/fill_students_marks_controller.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

class ClassroomAndExamSelectionDialogController extends GetxController {
  ClassroomAndExamSelectionDialogController({
    required this.schoolClass,
    required this.course,
  });

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  //Passes parameters
  final SchoolClass schoolClass;
  final Course course;

  //Status indicators
  RxBool isLoading = true.obs;

  //Future Lists
  RxList<Exam> exams = <Exam>[].obs;
  RxList<Classroom> classrooms = <Classroom>[].obs;

  //User Choices
  Rx<Exam?> selectedExam = Rx<Exam?>(null);
  Rx<Classroom?> selectedClassroom = Rx<Classroom?>(null);

  //Future getter methods
  getData() async {
    isLoading.value = true;
    await getClassrooms();
    await getExams();
    isLoading.value = false;
  }

  Future<List<Classroom>> getClassrooms() async {
    classrooms.value =
        await ClassroomDBHelper.instance.getAlreadyOpenClassroomsByClassId(
      schoolClass.id,
    );
    return classrooms;
  }

  Future<List<Exam>> getExams() async {
    exams.value =
        await ExamsDBHelper.instance.getExamsByClassId(schoolClass.id);
    return exams;
  }

  //Validation
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

  //User Selection Helpers
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

  void changeClassroom(Classroom? classroom) {
    if (classroom == null) {
      return;
    }
    if (classroom.id == -1) {
      selectedClassroom.value = null;
    } else {
      selectedClassroom.value = classroom;
    }
  }

  void goToFillMarksPage() {
    if (validateFields()) {
      Get.back(
        result: BindingsBuilder.put(
          () => FillStudentMarksController(
            course: course,
            classroom: selectedClassroom.value!,
            exam: selectedExam.value!,
          ),
        ),
      );
    }
  }
}
