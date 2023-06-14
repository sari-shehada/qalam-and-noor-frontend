import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/helpers/database_helpers/students_db_helper.dart';

class StudentsManagementController extends GetxController {
  RxInt studentsCount = 0.obs;
  Rx<StudentsSortingOption> currentSortingOption =
      StudentsSortingOption.none.obs;
  late Rx<Future<RxList<Student>>> students;

  StudentsManagementController() {
    students = getStudentsToDisplay().obs;
  }

  Future<RxList<Student>> getStudentsToDisplay() async {
    RxList<Student> students = <Student>[].obs;
    await StudentsDBHelper.instance.getAll().then((list) {
      for (Student student in list) {
        students.add(student);
      }
    });
    switch (currentSortingOption.value) {
      case StudentsSortingOption.none:
        return students;
      case StudentsSortingOption.byNameAsc:
        {
          students.sort(
            (a, b) => a.firstName.compareTo(b.firstName),
          );
          return students;
        }
      case StudentsSortingOption.byNameDesc:
        {
          students.sort(
            (a, b) => b.firstName.compareTo(a.firstName),
          );
          return students;
        }
    }
  }

  void changeSortingOption(StudentsSortingOption? sortingOption) {
    currentSortingOption.value = sortingOption ?? currentSortingOption.value;
    students.value = getStudentsToDisplay();
  }
}

enum StudentsSortingOption {
  none,
  byNameAsc,
  byNameDesc,
}

Map<StudentsSortingOption, String> vaccinesSortingOptionsAsString = {
  StudentsSortingOption.none: 'دون ترتيب',
  StudentsSortingOption.byNameAsc: 'إسم الطالب تصاعديا',
  StudentsSortingOption.byNameDesc: 'إسم الطالب تنازليا',
};
