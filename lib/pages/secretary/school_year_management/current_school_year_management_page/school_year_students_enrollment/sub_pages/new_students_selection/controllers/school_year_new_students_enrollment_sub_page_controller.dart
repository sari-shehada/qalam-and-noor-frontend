import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/students_db_helper.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/controllers/school_year_students_enrollment_dialog_tab_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/new_students_selection/models/new_student_enrollment_model.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/class_selection/controllers/class_selection_sub_page_controller.dart';

class SchoolYearNewStudentsEnrollmentSubPageController extends GetxController {
  SchoolYearNewStudentsEnrollmentSubPageController();
  late Rx<Future<List<NewStudentEnrollmentModel>>> students;
  late RxList<NewStudentEnrollmentModel?> selectedStudents =
      <NewStudentEnrollmentModel>[].obs;

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
    super.onInit();
  }

  Future<List<NewStudentEnrollmentModel>> getStudents() async {
    int? classId =
        Get.find<ClassSelectionSubPageController>().selectedClass.value?.id;
    if (classId == null) {
      return [];
    }
    return StudentsDBHelper.instance.getAllNewStudentsByClassId(classId);
  }

  reloadStudents() {
    students.value = getStudents();
  }

  toggleStudent(NewStudentEnrollmentModel student) {
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
