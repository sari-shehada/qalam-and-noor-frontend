import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/psychological_statuses_db_helper.dart';
import 'package:kalam_noor/models/medical/psychological_status.dart';
import 'package:kalam_noor/pages/psychological_statuses_management_page/views/dialogs/add_or_edit_psychological_status_dialog.dart';

class PsychologicalStatusesManagementController extends GetxController {
  RxInt psychologicalStatusesCount = 0.obs;
  Rx<PsychologicalStatusSortingOption> currentSortingOption =
      PsychologicalStatusSortingOption.none.obs;
  late Rx<Future<RxList<PsychologicalStatus>>> psychologicalStatuses;

  Future<RxList<PsychologicalStatus>> getPsychologicalStatusToDisplay() async {
    RxList<PsychologicalStatus> psychologicalStatuses =
        <PsychologicalStatus>[].obs;
    await PsychologicalStatusesDBHelper.instance.getAll().then(
      (list) {
        for (PsychologicalStatus psychologicalStatus in list) {
          psychologicalStatuses.add(psychologicalStatus);
        }
      },
    );
    switch (currentSortingOption.value) {
      case PsychologicalStatusSortingOption.none:
        return psychologicalStatuses;
      case PsychologicalStatusSortingOption.byNameAsc:
        {
          psychologicalStatuses.sort(
            (a, b) => a.name.compareTo(b.name),
          );
          return psychologicalStatuses;
        }
      case PsychologicalStatusSortingOption.byNameDesc:
        {
          psychologicalStatuses.sort(
            (a, b) => b.name.compareTo(a.name),
          );
          return psychologicalStatuses;
        }
    }
  }

  @override
  void onInit() {
    psychologicalStatuses = getPsychologicalStatusToDisplay().obs;
    super.onInit();
  }

  void changeSortingOption(PsychologicalStatusSortingOption? sortingOption) {
    currentSortingOption.value = sortingOption ?? currentSortingOption.value;
    psychologicalStatuses.value = getPsychologicalStatusToDisplay();
  }

  Future<void> addNewPsychologicalStatus() async {
    var result = await Get.dialog(
      const AddOrEditPsychologicalStatusDialog(),
      barrierDismissible: true,
    );
    if (result == true) {
      psychologicalStatuses.value = getPsychologicalStatusToDisplay();
    }
  }

  Future<void> updatePsychologicalStatusInfo(
      PsychologicalStatus psychologicalStatus) async {
    var result = await Get.dialog(
      AddOrEditPsychologicalStatusDialog(
        psychologicalStatus: psychologicalStatus,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      psychologicalStatuses.value = getPsychologicalStatusToDisplay();
    }
  }
}

enum PsychologicalStatusSortingOption {
  none,
  byNameAsc,
  byNameDesc,
}

Map<PsychologicalStatusSortingOption, String>
    psychologicalStatusSortingOptionsAsString = {
  PsychologicalStatusSortingOption.none: 'دون ترتيب',
  PsychologicalStatusSortingOption.byNameAsc: 'إسم الحالة المزاجية تصاعديا',
  PsychologicalStatusSortingOption.byNameDesc: 'إسم الحالة المزاجية تنازليا',
};
