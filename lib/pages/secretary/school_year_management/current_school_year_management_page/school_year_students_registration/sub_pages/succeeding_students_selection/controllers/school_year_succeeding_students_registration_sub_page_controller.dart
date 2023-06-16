import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/students_db_helper.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_registration/main_page/controllers/register_new_students_in_school_year_tab_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_registration/sub_pages/class_selection/controllers/class_selection_sub_page_controller.dart';
import '../../../../../../../../models/agendas/student.dart';

class SchoolYearSucceedingStudentsRegistrationSubPageController
    extends GetxController {
  SchoolYearSucceedingStudentsRegistrationSubPageController();
  late Rx<Future<List<Student>>> students;
  late RxList<Student?> selectedStudents = <Student>[].obs;

  @override
  void onInit() {
    students = getStudents().obs;
    Get.find<RegisterNewStudentsInSchoolYearTabController>()
        .currentPage
        .stream
        .listen(
      (event) {
        if (event == 1) {
          reloadStudents();
        }
      },
    );
    super.onInit();
  }

  Future<List<Student>> getStudents() async {
    int? classId =
        Get.find<ClassSelectionSubPageController>().selectedClass.value?.id;
    if (classId == null) {
      return [];
    }

    return StudentsDBHelper.instance.getAllSuccessfulStudentsByClassId(classId);
    // return StudentsDBHelper.instance.getAll();
  }

  reloadStudents() {
    students.value = getStudents();
  }

  toggleStudent(Student student) {
    if (selectedStudents.contains(student)) {
      selectedStudents.remove(student);
      return;
    }
    selectedStudents.add(student);
  }

  String? validatePageRequirements() {
    return null;
  }
}
