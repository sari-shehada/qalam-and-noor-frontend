import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/semester.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/models/helpers/database_helpers/semesters_db_helper.dart';

class SchoolYearSemestersController extends GetxController {
  Rx<GeneralLoadingStatus> loadingStatus = GeneralLoadingStatus.isLoading.obs;

  RxList<Semester> semesters = <Semester>[].obs;
  Rx<Semester?> currentSemester = Rx<Semester?>(null);

  @override
  void onInit() {
    loadSemesters();
    super.onInit();
  }

  loadInitialSemesters() async {}

  loadSemesters() async {
    try {
      loadingStatus.value = GeneralLoadingStatus.isLoading;
      List<Semester> tempSemesters = await _getSemesters();
      tempSemesters.sort((a, b) => a.id.compareTo(b.id));
      currentSemester.value = tempSemesters.last;
      tempSemesters.removeLast();
      semesters.value = tempSemesters;
      loadingStatus.value = GeneralLoadingStatus.hasData;
    } catch (e) {
      loadingStatus.value = GeneralLoadingStatus.hasError;
    }
  }

  Future<List<Semester>> _getSemesters() async {
    return await SemestersDBHelper.instance.getSemestersInSchoolYear(6);
  }
}
