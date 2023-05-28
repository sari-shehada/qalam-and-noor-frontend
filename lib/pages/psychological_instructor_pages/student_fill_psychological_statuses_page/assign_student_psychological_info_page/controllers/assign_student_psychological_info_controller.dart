import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/helpers/database_helpers/psychological_statuses_db_helper.dart';
import 'package:kalam_noor/models/medical/psychological_status.dart';

class AssignStudentPsychologicalInfoController extends GetxController {
  AssignStudentPsychologicalInfoController({required this.student});
  Rx<PsychologicalStatusesLoadingStatus> loadingStatus =
      PsychologicalStatusesLoadingStatus.isLoading.obs;
  RxList<PsychologicalStatus> psychologicalStatuses =
      <PsychologicalStatus>[].obs;
  final Student student;

  @override
  void onInit() {
    super.onInit();
    loadPsychologicalStatuses();
  }

  Future<void> loadPsychologicalStatuses() async {
    try {
      loadingStatus.value = PsychologicalStatusesLoadingStatus.isLoading;
      psychologicalStatuses.value =
          await PsychologicalStatusesDBHelper.instance.getAll();
      loadingStatus.value = PsychologicalStatusesLoadingStatus.hasData;
    } catch (e) {
      loadingStatus.value = PsychologicalStatusesLoadingStatus.hasError;
    }
  }
}

enum PsychologicalStatusesLoadingStatus {
  isLoading,
  hasError,
  hasData,
}
