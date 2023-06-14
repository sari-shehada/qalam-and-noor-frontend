import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/pages/secretary/school_classes_management_page/courses_management/views/widgets/add_or_edit_course_dialog.dart';
import '../../../../../models/educational/school_class.dart';
import '../../../../../models/helpers/database_helpers/courses_db_helper.dart';

class CoursesManagementController extends GetxController {
  final SchoolClass schoolClass;
  late Rx<Future<List<Course>>> courses;
  Rx<SchoolCoursesSortingOption> currentSortingOption =
      SchoolCoursesSortingOption.none.obs;

  CoursesManagementController({
    required this.schoolClass,
  }) {
    courses = getCoursesInClass().obs;
  }

  void changeSortingOption(SchoolCoursesSortingOption? sortingOption) {
    currentSortingOption.value = sortingOption ?? currentSortingOption.value;
    courses.value = getCoursesInClass();
  }

  Future<List<Course>> getCoursesInClass() async {
    List<Course> newCourses =
        await CoursesDBHelper.instance.getCoursesByClassId(schoolClass.id);
    switch (currentSortingOption.value) {
      case SchoolCoursesSortingOption.none:
        return newCourses;
      case SchoolCoursesSortingOption.byMaxGradeAsc:
        {
          newCourses.sort(
            (a, b) => a.totalGrade.compareTo(b.totalGrade),
          );
          return newCourses;
        }
      case SchoolCoursesSortingOption.byMaxGradeDesc:
        {
          newCourses.sort(
            (a, b) => b.totalGrade.compareTo(a.totalGrade),
          );
          return newCourses;
        }
      case SchoolCoursesSortingOption.byTypeAsc:
        {
          List<Course> courses = [];
          courses = newCourses
              .where(
                (element) => element.isEnriching == false,
              )
              .toList();
          courses.addAll(
            newCourses.where((element) => element.isEnriching == true),
          );
          newCourses = courses;
          return newCourses;
        }
      case SchoolCoursesSortingOption.byTypeDesc:
        {
          List<Course> courses = [];
          courses = newCourses
              .where(
                (element) => element.isEnriching == true,
              )
              .toList();
          courses.addAll(
            newCourses.where(
              (element) => element.isEnriching == false,
            ),
          );
          newCourses = courses;
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

enum SchoolCoursesSortingOption {
  none,
  byMaxGradeAsc,
  byMaxGradeDesc,
  byTypeAsc,
  byTypeDesc,
}

Map<SchoolCoursesSortingOption, String> schoolCoursesSortingOptionAsString = {
  SchoolCoursesSortingOption.none: 'دون ترتيب',
  SchoolCoursesSortingOption.byMaxGradeAsc: 'حسب علامة المقرر تصاعدياً',
  SchoolCoursesSortingOption.byMaxGradeDesc: 'حسب علامة المقرر تنازلياً',
  SchoolCoursesSortingOption.byTypeAsc: 'حسب نوع المقرر تصاعدياً',
  SchoolCoursesSortingOption.byTypeDesc: 'حسب نوع المقرر تنازلياً',
};
