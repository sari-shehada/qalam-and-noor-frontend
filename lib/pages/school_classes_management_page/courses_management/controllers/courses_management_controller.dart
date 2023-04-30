import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/pages/school_classes_management_page/courses_management/views/widgets/add_or_edit_course_dialog.dart';
import '../../../../models/educational/school_class.dart';
import '../../../../models/helpers/database_helpers/courses_db_helper.dart';
import '../../main_page/controllers/school_classes_management_controller.dart';

class CoursesManagementController extends GetxController {
  final SchoolClass schoolClass;
  late Rx<Future<List<Course>>> courses;
  Rx<SchoolClassesSortingOption> currentSortingOption =
      SchoolClassesSortingOption.none.obs;

  CoursesManagementController({
    required this.schoolClass,
  }) {
    courses = getCoursesInClass().obs;
  }

  void changeSortingOption(SchoolClassesSortingOption? sortingOption) {
    currentSortingOption.value = sortingOption ?? currentSortingOption.value;
    courses.value = getCoursesInClass();
  }

  Future<List<Course>> getCoursesInClass() async {
    List<Course> newCourses =
        await CoursesDBHelper.instance.getCoursesByClassId(schoolClass.id);
    switch (currentSortingOption.value) {
      case SchoolClassesSortingOption.none:
        return newCourses;
      case SchoolClassesSortingOption.byNameAsc:
        {
          newCourses.sort(
            (a, b) => a.name.compareTo(b.name),
          );
          return newCourses;
        }
      case SchoolClassesSortingOption.byNameDesc:
        {
          newCourses.sort(
            (a, b) => b.name.compareTo(a.name),
          );
          return newCourses;
        }
    }
  }

  Future<void> addNewCourse() async {
    var result = await Get.dialog(
      AddOrEditCourseDialog(
        argument: schoolClass.id,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      courses.value = getCoursesInClass();
    }
  }

  Future<void> updateCourseInfo(Course course) async {
    var result = await Get.dialog(
      AddOrEditCourseDialog(
        argument: course,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      courses.value = getCoursesInClass();
    }
  }
}
