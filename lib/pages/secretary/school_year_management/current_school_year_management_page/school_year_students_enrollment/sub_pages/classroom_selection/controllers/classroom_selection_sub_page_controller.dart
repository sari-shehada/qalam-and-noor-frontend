import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/models/helpers/database_helpers/classrooms_db_helper.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/controllers/school_year_students_enrollment_dialog_tab_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/class_selection/controllers/class_selection_sub_page_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/failing_students_selection/controllers/school_year_failing_students_enrollment_sub_page_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/new_students_selection/controllers/school_year_new_students_enrollment_sub_page_controller.dart';

import '../../succeeding_students_selection/controllers/school_year_succeeding_students_enrollment_sub_page_controller.dart';

class ClassroomSelectionSubPageController extends GetxController {
  ClassroomSelectionSubPageController();
  late Rx<Future<List<Classroom>>> classrooms;
  late Rx<Classroom?> selectedClassroom = Rx<Classroom?>(null);
  RxInt currentCapacity = 0.obs;

  @override
  void onInit() {
    classrooms = getClassrooms().obs;
    Get.find<SchoolYearStudentsEnrollmentDialogTabController>()
        .currentPage
        .stream
        .listen(
      (event) {
        if (event == 1) {
          reloadClassrooms();
        }
      },
    );
    super.onInit();
  }

  Future<List<Classroom>> getClassrooms() async {
    int? classId =
        Get.find<ClassSelectionSubPageController>().selectedClass.value?.id;
    if (classId == null) {
      return [];
    }
    return ClassroomDBHelper.instance
        .getAlreadyOpenClassroomsByClassId(classId);
  }

  reloadClassrooms() {
    classrooms.value = getClassrooms();
  }

  selectClassroom(Classroom classroom) {
    selectedClassroom.value = classroom;
    resetCapacity();
  }

  resetCapacity() {
    currentCapacity.value = 0;
  }

  incrementCapacityCounter() {
    currentCapacity.value++;
    print(currentCapacity.value);
  }

  decrementCapacityCounter() {
    currentCapacity.value--;
    print(currentCapacity.value);
  }

  int getNumberOfMales() {
    int count = 0;
    count += Get.find<SchoolYearNewStudentsEnrollmentSubPageController>()
        .selectedStudents
        .where((p0) => p0.student.isMale == true)
        .length;
    count += Get.find<SchoolYearFailingStudentsEnrollmentSubPageController>()
        .selectedStudents
        .where((p0) => p0.isMale == true)
        .length;
    count += Get.find<SchoolYearSucceedingStudentsEnrollmentSubPageController>()
        .selectedStudents
        .where((p0) => p0.isMale == true)
        .length;
    return count;
  }

  int getNumberOfFemales() {
    int count = 0;
    count += Get.find<SchoolYearNewStudentsEnrollmentSubPageController>()
        .selectedStudents
        .where((p0) => p0.student.isMale == false)
        .length;
    count += Get.find<SchoolYearFailingStudentsEnrollmentSubPageController>()
        .selectedStudents
        .where((p0) => p0.isMale == false)
        .length;
    count += Get.find<SchoolYearSucceedingStudentsEnrollmentSubPageController>()
        .selectedStudents
        .where((p0) => p0.isMale == false)
        .length;
    return count;
  }

  bool isCapacityFilled() {
    return currentCapacity.value == selectedClassroom.value!.maxCapacity;
  }

  String? validatePageRequirements() {
    if (selectedClassroom.value == null ||
        selectedClassroom.value!.classId !=
            Get.find<ClassSelectionSubPageController>()
                .selectedClass
                .value!
                .id) {
      return 'يرجى اختيار شعبة ضمن المرحلة الدراسية للمتابعة';
    }
    return null;
  }
}
