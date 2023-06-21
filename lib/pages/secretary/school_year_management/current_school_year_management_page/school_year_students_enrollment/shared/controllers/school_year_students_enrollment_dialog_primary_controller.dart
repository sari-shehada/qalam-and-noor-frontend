import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/helpers/database_helpers/students_db_helper.dart';
import 'package:kalam_noor/models/item_or.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/controllers/widget_controllers/school_year_semesters_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/controllers/school_year_students_enrollment_dialog_tab_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/new_students_selection/models/new_students_enrollment_dto.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

import '../../sub_pages/class_selection/controllers/class_selection_sub_page_controller.dart';
import '../../sub_pages/classroom_selection/controllers/classroom_selection_sub_page_controller.dart';
import '../../sub_pages/succeeding_students_selection/controllers/school_year_succeeding_students_enrollment_sub_page_controller.dart';
import '../../sub_pages/new_students_selection/controllers/school_year_new_students_enrollment_sub_page_controller.dart';
import '../../sub_pages/failing_students_selection/controllers/school_year_failing_students_enrollment_sub_page_controller.dart';
import '../models/old_students_enrollment_dto.dart';

class SchoolYearStudentsEnrollmentDialogPrimaryController
    extends GetxController {
  late SchoolYearStudentsEnrollmentDialogTabController tabController;
  late ClassSelectionSubPageController classSelectionController;
  late ClassroomSelectionSubPageController classroomSelectionController;
  late SchoolYearNewStudentsEnrollmentSubPageController
      schoolYearNewStudentsRegistrationSubPageController;
  late SchoolYearSucceedingStudentsEnrollmentSubPageController
      schoolYearSucceedingStudentsRegistrationSubPageController;
  late SchoolYearFailingStudentsEnrollmentSubPageController
      schoolYearFailingStudentsRegistrationSubPageController;

  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;

  @override
  void onInit() {
    tabController = Get.put(
      SchoolYearStudentsEnrollmentDialogTabController(),
    );
    classSelectionController = Get.put(
      ClassSelectionSubPageController(),
    );
    classroomSelectionController = Get.put(
      ClassroomSelectionSubPageController(),
    );
    schoolYearNewStudentsRegistrationSubPageController = Get.put(
      SchoolYearNewStudentsEnrollmentSubPageController(),
    );
    schoolYearSucceedingStudentsRegistrationSubPageController = Get.put(
      SchoolYearSucceedingStudentsEnrollmentSubPageController(),
    );
    schoolYearFailingStudentsRegistrationSubPageController = Get.put(
      SchoolYearFailingStudentsEnrollmentSubPageController(),
    );
    super.onInit();
  }

  int getAllStudentsCount() {
    int count = schoolYearFailingStudentsRegistrationSubPageController
            .selectedStudents.length +
        schoolYearNewStudentsRegistrationSubPageController
            .selectedStudents.length +
        schoolYearSucceedingStudentsRegistrationSubPageController
            .selectedStudents.length;
    return count;
  }

  Future<void> registerSelectedStudents() async {
    if (getAllStudentsCount() == 0) {
      Get.back();
      SnackBarService.showNeutralSnackBar(
        title: 'لم يتم اختيار طلاب',
        message: "لم يتم اختيار طلاب لتسجيلهم",
      );
      return;
    }
    try {
      final int semesterId =
          Get.find<SchoolYearSemestersController>().currentSemester.value!.id;
      final schoolClassId = classSelectionController.selectedClass.value!.id;
      final classroomId =
          classroomSelectionController.selectedClassroom.value!.id;
      await enrollNewStudents(
        classroomId: classroomId,
        semesterId: semesterId,
      );

      await enrollOldStudents(
        classroomId: classroomId,
        semesterId: semesterId,
        schoolClassId: schoolClassId,
      );
      int totalStudentsCount = getAllStudentsCount();
      Get.back(result: totalStudentsCount);
    } on NewStudentsEnrollmentException catch (e) {
      SnackBarService.showErrorSnackBar(
        title: 'حدث خطأ اثناء تسجيل الطلاب الجدد',
        message: e.message,
      );
    } on OldStudentsEnrollmentException catch (e) {
      SnackBarService.showErrorSnackBar(
        title: 'حدث خطأ اثناء تسجيل الطلاب القدامى',
        message: e.message,
      );
    }
  }

  Future<void> enrollNewStudents({
    required int classroomId,
    required int semesterId,
  }) async {
    ItemOr<String> enrollmentResult =
        await StudentsDBHelper.instance.enrollNewStudentsToSchoolYear(
      NewStudentsEnrollmentDTO(
        classRoomId: classroomId,
        yearRecordId: schoolYearNewStudentsRegistrationSubPageController
            .selectedStudents
            .map((element) => element.yearRecord.id)
            .toList(),
        semesterId: semesterId,
      ),
    );
    if (enrollmentResult.success == false) {
      throw NewStudentsEnrollmentException(message: enrollmentResult.message);
    }
  }

  Future<void> enrollOldStudents({
    required int classroomId,
    required int semesterId,
    required schoolClassId,
  }) async {
    List<Student> studentsToEnroll =
        schoolYearFailingStudentsRegistrationSubPageController.selectedStudents
          ..addAll(
            schoolYearSucceedingStudentsRegistrationSubPageController
                .selectedStudents,
          );
    ItemOr<String> enrollmentResult =
        await StudentsDBHelper.instance.enrollOldStudentsToSchoolYear(
      OldStudentsEnrollmentDTO(
        classRoomId: classroomId,
        studentIds: studentsToEnroll.map((element) => element.id).toList(),
        semesterId: semesterId,
        classId: schoolClassId,
      ),
    );
    if (enrollmentResult.success == false) {
      throw NewStudentsEnrollmentException(message: enrollmentResult.message);
    }
  }
}

class NewStudentsEnrollmentException implements Exception {
  NewStudentsEnrollmentException({required this.message});
  final String message;
}

class OldStudentsEnrollmentException implements Exception {
  OldStudentsEnrollmentException({required this.message});
  final String message;
}
