import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/models/helpers/database_helpers/school_classes_db_helper.dart';

class SchoolYearSchoolClassesController extends GetxController {
  Rx<GeneralLoadingStatus> loadingStatus = GeneralLoadingStatus.isLoading.obs;
  RxList<SchoolClass> classes = <SchoolClass>[].obs;

  @override
  void onInit() {
    loadClasses();
    super.onInit();
  }

  void loadClasses() async {
    try {
      loadingStatus.value = GeneralLoadingStatus.isLoading;
      classes.value = await _getClassesInCurrentSchoolYear();
      loadingStatus.value = GeneralLoadingStatus.hasData;
    } catch (e) {
      loadingStatus.value = GeneralLoadingStatus.hasError;
    }
  }

  Future<List<SchoolClass>> _getClassesInCurrentSchoolYear() async {
    return await SchoolClassesDBHelper.instance.getCurrentSchoolYearClasses();
  }
}
