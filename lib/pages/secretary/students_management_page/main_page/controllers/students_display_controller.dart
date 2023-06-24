import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/models/student_info.dart';
import '../../../../../models/helpers/database_helpers/students_db_helper.dart';

class StudentsManagementController extends GetxController {
  RxInt studentsCount = 0.obs;
  Rx<StudentsSortingOption> currentSortingOption =
      StudentsSortingOption.none.obs;
  late Rx<Future<List<FullStudentInfo>>> students;

  StudentsManagementController() {
    students = getStudentsToDisplay().obs;
  }

  Future<List<FullStudentInfo>> getStudentsToDisplay() async {
    List<FullStudentInfo> students =
        await StudentsDBHelper.instance.getFullStudentsInfo();

    switch (currentSortingOption.value) {
      case StudentsSortingOption.none:
        return students;
      case StudentsSortingOption.byNameAsc:
        {
          students.sort(
            (a, b) => a.student.firstName.compareTo(b.student.firstName),
          );
          return students;
        }
      case StudentsSortingOption.byNameDesc:
        {
          students.sort(
            (a, b) => b.student.firstName.compareTo(a.student.firstName),
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
