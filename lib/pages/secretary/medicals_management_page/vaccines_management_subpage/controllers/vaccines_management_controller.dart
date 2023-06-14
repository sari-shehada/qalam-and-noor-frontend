import 'package:get/get.dart';
import '../../../../../models/helpers/database_helpers/vaccines_db_helper.dart';
import '../../../../../models/medical/vaccine.dart';
import '../views/dialogs/add_or_edit_vaccine_dialog.dart';

class VaccinesManagementController extends GetxController {
  RxInt vaccinesCount = 0.obs;
  Rx<VaccinesSortingOption> currentSortingOption =
      VaccinesSortingOption.none.obs;
  late Rx<Future<RxList<Vaccine>>> vaccines;

  VaccinesManagementController() {
    vaccines = getVaccinesToDisplay().obs;
  }

  Future<RxList<Vaccine>> getVaccinesToDisplay() async {
    RxList<Vaccine> vaccines = <Vaccine>[].obs;
    await VaccinesDBHelper.instance.getAll().then((list) {
      for (Vaccine vaccine in list) {
        vaccines.add(vaccine);
      }
    });
    switch (currentSortingOption.value) {
      case VaccinesSortingOption.none:
        return vaccines;
      case VaccinesSortingOption.byNameAsc:
        {
          vaccines.sort(
            (a, b) => a.name.compareTo(b.name),
          );
          return vaccines;
        }
      case VaccinesSortingOption.byNameDesc:
        {
          vaccines.sort(
            (a, b) => b.name.compareTo(a.name),
          );
          return vaccines;
        }
    }
  }

  void changeSortingOption(VaccinesSortingOption? sortingOption) {
    currentSortingOption.value = sortingOption ?? currentSortingOption.value;
    vaccines.value = getVaccinesToDisplay();
  }

  Future<void> addNewVaccine() async {
    var result = await Get.dialog(
      const AddOrEditVaccineDialog(),
      barrierDismissible: true,
    );
    if (result == true) {
      vaccines.value = getVaccinesToDisplay();
    }
  }

  Future<void> updateVaccineInfo(Vaccine vaccine) async {
    var result = await Get.dialog(
      AddOrEditVaccineDialog(
        vaccine: vaccine,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      vaccines.value = getVaccinesToDisplay();
    }
  }
}

enum VaccinesSortingOption {
  none,
  byNameAsc,
  byNameDesc,
}

Map<VaccinesSortingOption, String> vaccinesSortingOptionsAsString = {
  VaccinesSortingOption.none: 'دون ترتيب',
  VaccinesSortingOption.byNameAsc: 'إسم اللقاح تصاعديا',
  VaccinesSortingOption.byNameDesc: 'إسم اللقاح تنازليا',
};



// import 'package:get/get.dart';

// import 'package:kalam_noor/models/helpers/database_helper.dart';
// import 'package:kalam_noor/models/medical/vaccine.dart';

// class VaccinesManagementController extends GetxController {
//   RxInt vaccinesCount = 0.obs;
//   late Future<List<Vaccine>> vaccines;

//   VaccinesManagementController() {
//     vaccines = getVaccines();
//   }

//   Future<List<Vaccine>> getVaccines() async {
//     List<Vaccine> result = await DatabaseHelper.getVaccines();
//     vaccinesCount.value = result.length;
//     return result;
//   }
// }

