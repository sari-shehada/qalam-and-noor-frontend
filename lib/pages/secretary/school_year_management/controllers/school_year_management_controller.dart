import 'package:get/get.dart';
import '../../../../models/educational/school_year.dart';
import '../../../../models/helpers/database_helpers/school_years_db_helper.dart';

class SchoolYearManagementController extends GetxController {
  late Rx<Future<SchoolYear>> currentSchoolYear;

  @override
  void onInit() {
    currentSchoolYear = getCurrentSchoolYear().obs;
    super.onInit();
  }

  Future<SchoolYear> getCurrentSchoolYear() async {
    return await SchoolYearsDBHelper.instance.getCurrentSchoolYear();
  }

  void refreshCurrentSchoolYear() {
    currentSchoolYear = getCurrentSchoolYear().obs;
  }
}
