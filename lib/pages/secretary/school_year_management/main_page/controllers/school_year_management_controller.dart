import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/current_school_year_insights.dart';
import 'package:kalam_noor/models/educational/school_year_classroom.dart';
import 'package:kalam_noor/models/helpers/database_helpers/school_year_classrooms_db_helper.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/controllers/current_school_year_management_controller.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/main_page/views/current_school_year_management_page.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/main_page/views/dialogs/start_new_school_year_dialog.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import '../../../../../models/educational/school_year.dart';
import '../../../../../models/helpers/database_helpers/school_years_db_helper.dart';

class SchoolYearManagementController extends GetxController {
  final Rx<bool> isLoading = true.obs;
  late Rx<SchoolYear> currentSchoolYear;
  late Rx<CurrentSchoolYearInsights> currentSchoolYearInsights;
  late RxList<SchoolYear> otherSchoolYears = <SchoolYear>[].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<SchoolYear> getCurrentSchoolYear() async {
    return await SchoolYearsDBHelper.instance.getCurrentSchoolYear();
  }

  Future<CurrentSchoolYearInsights> getCurrentSchoolYearInsights() async {
    final List<SchoolYearClassroom> classroomsInCurrentSchoolYear =
        await SchoolYearClassroomsDBHelper.instance
            .getAllBySchoolYearId(currentSchoolYear.value.id);
    //TODO: add getting classes count
    //TODO: add getting students in it
    return CurrentSchoolYearInsights(
      studentsCount: 15,
      classRoomsCount: classroomsInCurrentSchoolYear.length,
      classesCount: 1,
    );
  }

  Future<List<SchoolYear>> getOtherSchoolYears() async {
    List<SchoolYear> schoolYears = await SchoolYearsDBHelper.instance.getAll();
    return schoolYears
        .where((element) => element.id != currentSchoolYear.value.id)
        .toList();
  }

  Future<void> startNewSchoolYear() async {
    var result = await Get.dialog(
      StartNewSchoolYearDialog(
        currentSchoolYear: currentSchoolYear.value,
      ),
    );
    if (result is SchoolYear) {
      SnackBarService.showSuccessSnackBar(
        title: 'تم بدء عام دراسي جديد',
        message: '''
تم بنجاح بدأ العام الدراسي \"${result.name}\"!
          ''',
      );
      refreshData();
    }
  }

  void refreshData() async {
    isLoading.value = true;
    currentSchoolYear.value = await getCurrentSchoolYear();
    currentSchoolYearInsights.value = await getCurrentSchoolYearInsights();
    otherSchoolYears.value = await getOtherSchoolYears();
    isLoading.value = false;
  }

  void getData() async {
    isLoading.value = true;
    SchoolYear temporarySchoolYear = await getCurrentSchoolYear();
    currentSchoolYear = temporarySchoolYear.obs;
    CurrentSchoolYearInsights temporarySchoolYearInsights =
        await getCurrentSchoolYearInsights();
    currentSchoolYearInsights = temporarySchoolYearInsights.obs;
    otherSchoolYears.value = await getOtherSchoolYears();
    isLoading.value = false;
  }

  void manageCurrentSchoolYear() {
    Get.to(
      () => const CurrentSchoolYearManagementPage(),
      binding: BindingsBuilder.put(
        () => CurrentSchoolYearManagementController(
          schoolYear: currentSchoolYear.value,
          schoolYearInsights: currentSchoolYearInsights,
        ),
      ),
    );
  }
}
