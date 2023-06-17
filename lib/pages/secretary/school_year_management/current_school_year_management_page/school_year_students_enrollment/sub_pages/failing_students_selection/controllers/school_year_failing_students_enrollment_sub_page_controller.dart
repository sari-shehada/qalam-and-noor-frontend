import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/students_db_helper.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/controllers/school_year_students_enrollment_dialog_tab_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/class_selection/controllers/class_selection_sub_page_controller.dart';
import '../../../../../../../../models/agendas/student.dart';
import '../../../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../classroom_selection/controllers/classroom_selection_sub_page_controller.dart';

class SchoolYearFailingStudentsEnrollmentSubPageController
    extends GetxController {
  SchoolYearFailingStudentsEnrollmentSubPageController();
  late Rx<Future<List<Student>>> students;
  late RxList<Student> selectedStudents = <Student>[].obs;

  @override
  void onInit() {
    students = getStudents().obs;
    Get.find<SchoolYearStudentsEnrollmentDialogTabController>()
        .currentPage
        .stream
        .listen(
      (event) {
        if (event == 1) {
          reloadStudents();
        }
      },
    );
    Get.find<ClassroomSelectionSubPageController>()
        .selectedClassroom
        .stream
        .listen((event) {
      selectedStudents.clear();
    });
    super.onInit();
  }

  Future<List<Student>> getStudents() async {
    int? classId =
        Get.find<ClassSelectionSubPageController>().selectedClass.value?.id;
    if (classId == null) {
      return [];
    }
    return StudentsDBHelper.instance.getAllFailingStudentsByClassId(classId);
  }

  reloadStudents() {
    students.value = getStudents();
  }

  toggleStudent(Student student) {
    if (selectedStudents.contains(student)) {
      removeStudent(student);
      return;
    }
    addStudent(student);
  }

  void removeStudent(Student student) {
    Get.find<ClassroomSelectionSubPageController>().decrementCapacityCounter();
    selectedStudents.remove(student);
  }

  void addStudent(Student student) {
    ClassroomSelectionSubPageController classroomSelectionSubPageController =
        Get.find<ClassroomSelectionSubPageController>();
    if (classroomSelectionSubPageController.isCapacityFilled()) {
      SnackBarService.showErrorSnackBar(
        title: 'تم تجاوز الحد المسموح',
        message: 'لفد تم الوصول الى السعة الأعظمية للشعبة المختارة',
      );
      return;
    }
    classroomSelectionSubPageController.incrementCapacityCounter();
    selectedStudents.add(student);
  }

  String? validatePageRequirements() {
    return null;
  }
}
