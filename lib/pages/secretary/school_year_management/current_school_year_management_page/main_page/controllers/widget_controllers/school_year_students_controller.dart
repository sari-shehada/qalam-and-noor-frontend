import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/controllers/widget_controllers/school_year_school_classes_controller.dart';

import '../../../../../../../models/agendas/student.dart';
import '../../../../../../../models/enums.dart';
import '../../../../../../../models/helpers/database_helpers/students_db_helper.dart';
import '../../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../school_year_students_enrollment/shared/views/school_year_students_enrollment_dialog.dart';
import '../../views/widgets/current_school_year_students_count_widget.dart';

class SchoolYearStudentsController extends GetxController {
  Rx<GeneralLoadingStatus> loadingStatus = GeneralLoadingStatus.isLoading.obs;
  Rx<SchoolYearStudentCountStats?> studentsStats =
      Rx<SchoolYearStudentCountStats?>(null);
  RxList<Student> students = <Student>[].obs;

  @override
  onInit() {
    getStudentsCount();
    super.onInit();
  }

  Future<void> getStudentsCount() async {
    try {
      loadingStatus.value = GeneralLoadingStatus.isLoading;

      List<Student> studentsInSchoolYear =
          await StudentsDBHelper.instance.getStudentsInCurrentSchoolYear();
      students.value = studentsInSchoolYear;
      int allCount = studentsInSchoolYear.length;
      studentsInSchoolYear = studentsInSchoolYear
          .where((element) => element.isMale == true)
          .toList();
      int malesCount = studentsInSchoolYear.length;
      int femalesCount = allCount - malesCount;
      studentsStats.value = SchoolYearStudentCountStats(
        totalCount: allCount,
        males: malesCount,
        females: femalesCount,
      );
      loadingStatus.value = GeneralLoadingStatus.hasData;
    } catch (e) {
      loadingStatus.value = GeneralLoadingStatus.hasError;
    }
  }

  Future<void> enrollNewStudentsToSchoolYear() async {
    var result = await Get.dialog(
      const SchoolYearStudentsEnrollmentDialog(),
    );
    if (result is int) {
      SnackBarService.showSuccessSnackBar(
        title: 'تمت العملية بنجاح',
        message: 'تم تسجيل $result طالب بنجاح',
      );
      getStudentsCount();
      Get.find<SchoolYearSchoolClassesController>().loadClasses();
    }
  }
}
