import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/classrooms_db_helper.dart';

import '../../../../../../../models/enums.dart';
import '../../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../manage_current_school_year_classrooms/dialogs/manage_current_school_year_classrooms_dialog.dart';

class SchoolYearClassroomsController extends GetxController {
  Rx<GeneralLoadingStatus> loadingStatus = GeneralLoadingStatus.isLoading.obs;
  RxInt classroomsCount = 0.obs;

  @override
  void onInit() {
    loadClassrooms();
    super.onInit();
  }

  void loadClassrooms() async {
    try {
      loadingStatus.value = GeneralLoadingStatus.isLoading;
      classroomsCount.value = await _getClassroomsInCurrentSchoolYear();
      loadingStatus.value = GeneralLoadingStatus.hasData;
    } catch (e) {
      loadingStatus.value = GeneralLoadingStatus.hasError;
    }
  }

  Future<int> _getClassroomsInCurrentSchoolYear() async {
    return ClassroomDBHelper.instance.getCurrentSchoolYearClassroomsCount();
  }

  Future<void> manageClassroomsInSchoolYear() async {
    var result = await Get.dialog(
      const ManageCurrentSchoolYearClassroomsDialog(),
    );
    if (result == true) {
      SnackBarService.showSuccessSnackBar(
        title: 'تمت العمليات',
        message: 'تم تنفيذ الإجرائات بنجاح',
      );
      loadClassrooms();
    }
  }
}
