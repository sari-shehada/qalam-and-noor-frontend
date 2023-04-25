import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/illnesses_db_helper.dart';
import 'package:kalam_noor/models/medical/illness.dart';
import '../views/dialogs/add_or_edit_illness_dialog.dart';

class IllnessesManagementController extends GetxController {
  RxInt illnessesCount = 0.obs;
  Rx<IllnessesSortingOption> currentSortingOption =
      IllnessesSortingOption.none.obs;
  late Rx<Future<RxList<Illness>>> illnesses;

  IllnessesManagementController() {
    illnesses = getIllnessesToDisplay().obs;
  }

  Future<RxList<Illness>> getIllnessesToDisplay() async {
    RxList<Illness> illnesses = <Illness>[].obs;
    await IllnessesDBHelper.instance.getAll().then((list) {
      for (Illness illness in list) {
        illnesses.add(illness);
      }
    });
    switch (currentSortingOption.value) {
      case IllnessesSortingOption.none:
        return illnesses;
      case IllnessesSortingOption.byNameAsc:
        {
          illnesses.sort(
            (a, b) => a.name.compareTo(b.name),
          );
          return illnesses;
        }
      case IllnessesSortingOption.byNameDesc:
        {
          illnesses.sort(
            (a, b) => b.name.compareTo(a.name),
          );
          return illnesses;
        }
    }
  }

  void changeSortingOption(IllnessesSortingOption? sortingOption) {
    currentSortingOption.value = sortingOption ?? currentSortingOption.value;
    illnesses.value = getIllnessesToDisplay();
  }

  Future<void> addNewIllness() async {
    var result = await Get.dialog(
      const AddOrEditIllnessDialog(),
      barrierDismissible: true,
    );
    if (result == true) {
      illnesses.value = getIllnessesToDisplay();
    }
  }

  Future<void> updateIllnessInfo(Illness illness) async {
    var result = await Get.dialog(
      AddOrEditIllnessDialog(
        illness: illness,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      illnesses.value = getIllnessesToDisplay();
    }
  }
}

enum IllnessesSortingOption {
  none,
  byNameAsc,
  byNameDesc,
}

Map<IllnessesSortingOption, String> illnessesSortingOptionsAsString = {
  IllnessesSortingOption.none: 'دون ترتيب',
  IllnessesSortingOption.byNameAsc: 'إسم المرض تصاعديا',
  IllnessesSortingOption.byNameDesc: 'إسم المرض تنازليا',
};
