import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';
import 'package:kalam_noor/models/agendas/employee.dart';
import 'package:kalam_noor/models/agendas/job_title.dart';
import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/pages/teacher/dashboard_page/models/teacher_course_info.dart';
import 'package:kalam_noor/models/helpers/database_helpers/courses_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/school_classes_db_helper.dart';
import 'package:kalam_noor/pages/teacher/dashboard_page/views/dialogs/classroom_and_exam_selection_dialog.dart';
import 'package:kalam_noor/pages/teacher/fill_students_marks_page/views/fill_students_marks_page.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

class TeacherDashboardController extends GetxController {
  TeacherDashboardController();

  late Employee teacher;
  late JobTitle jobTitle;
  late Rx<Future<List<TeacherCourseInfo>>> teacherCourses;

  @override
  void onInit() {
    teacher = Get.find<AccountController>().employee;
    jobTitle = Get.find<AccountController>().jobTitle;
    teacherCourses = getAllTeacherCourses().obs;
    super.onInit();
  }

  Future<List<TeacherCourseInfo>> getAllTeacherCourses() async {
    List<Course> coursesList =
        await CoursesDBHelper.instance.getAllTeacherCourses(teacher.id);
    List<TeacherCourseInfo> teacherCourseInfo = [];
    for (Course course in coursesList) {
      SchoolClass schoolClass =
          await SchoolClassesDBHelper.instance.getById(course.classId);
      teacherCourseInfo.add(
        TeacherCourseInfo(course: course, schoolClass: schoolClass),
      );
    }
    return teacherCourseInfo;
  }

  Future<void> assignGradesInCourse({
    required SchoolClass schoolClass,
    required Course course,
  }) async {
    var dialogResult = await Get.dialog(
      ClassroomAndExamSelectionDialog(
        schoolClass: schoolClass,
        course: course,
      ),
    );
    if (dialogResult is Bindings) {
      var result = await Get.to(
        () => const FillStudentsMarksPage(),
        binding: dialogResult,
      );
      if (result == true) {
        SnackBarService.showSuccessSnackBar(
          title: 'تمت العملية بنجاح',
          message:
              'تمت بنجاح عملية اضافة العلامات الى المقرر ${course.name} للصف ${schoolClass.name}!',
        );
      }
    }
  }

  refreshTeacherCourses() {
    teacherCourses.value = getAllTeacherCourses();
  }
}
