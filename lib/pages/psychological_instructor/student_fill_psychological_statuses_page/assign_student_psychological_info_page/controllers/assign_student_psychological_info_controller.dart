import 'package:get/get.dart';
import '../../../../../models/agendas/student.dart';
import '../../../../../models/enums.dart';
import '../../../../../models/helpers/database_helpers/psychological_statuses_db_helper.dart';
import '../../../../../models/helpers/database_helpers/student_psychological_statuses_db_helper.dart';
import '../../../../../models/medical/psychological_status.dart';
import '../../../../../models/medical/student_psychological_status.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../tools/ui_tools/buttons.dart';

class AssignStudentPsychologicalInfoController extends GetxController {
  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;
  AssignStudentPsychologicalInfoController({required this.student});
  Rx<PsychologicalStatusesLoadingStatus> loadingStatus =
      PsychologicalStatusesLoadingStatus.isLoading.obs;
  RxList<PsychologicalStatus> psychologicalStatuses =
      <PsychologicalStatus>[].obs;
  RxMap<PsychologicalStatus, StudentPsychologicalStatus> addedStatuses =
      <PsychologicalStatus, StudentPsychologicalStatus>{}.obs;
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

  addOrRemoveStatus(PsychologicalStatus status) {
    if (addedStatuses.keys.contains(status)) {
      addedStatuses.remove(status);
      return;
    }
    addedStatuses[status] = StudentPsychologicalStatus(
      id: -1,
      medicalRecordId: student.id,
      psychologicalStatusId: status.id,
      statusLevel: PsychologicalStatusLevel.medium,
    );
  }

  changeStatusLevel(PsychologicalStatus psychologicalStatus, int level) {
    addedStatuses[psychologicalStatus] =
        addedStatuses[psychologicalStatus]!.copyWith(
      statusLevel: PsychologicalStatusLevel.values[level],
    );
  }

  Future<void> addPsychologicalStatuses() async {
    try {
      if (addedStatuses.isEmpty) {
        SnackBarService.showErrorSnackBar(
            title: 'لا يوجد حالات', message: 'لم تقم بإضافة حالات للطالب');
        return;
      }
      buttonStatus.value = CustomButtonStatus.processing;
      addedStatuses.forEach((key, value) async {
        await StudentPsychologicalStatusesDBHelper.instance.insert(value);
      });
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}

enum PsychologicalStatusesLoadingStatus {
  isLoading,
  hasError,
  hasData,
}
