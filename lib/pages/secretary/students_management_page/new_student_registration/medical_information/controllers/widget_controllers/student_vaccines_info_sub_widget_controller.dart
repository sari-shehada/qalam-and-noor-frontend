import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../models/helpers/database_helpers/vaccines_db_helper.dart';
import '../../../../../../../models/medical/taken_vaccine.dart';
import '../../../../../../../models/medical/vaccine.dart';
import '../../../../../medicals_management_page/vaccines_management_subpage/views/dialogs/add_or_edit_vaccine_dialog.dart';

class StudentVaccinesInfoSubWidgetController extends GetxController {
  late Rx<Future<List<Vaccine>>> vaccines;
  RxList<Vaccine> selectedVaccines = <Vaccine>[].obs;
  Map<Vaccine, DateTime> takenVaccines = {};
  StudentVaccinesInfoSubWidgetController() {
    vaccines = getVaccines().obs;
  }

  Future<List<Vaccine>> getVaccines() async {
    return await VaccinesDBHelper.instance.getAll();
  }

  void selectVaccine(Vaccine vaccine) async {
    if (selectedVaccines.contains(vaccine)) {
      takenVaccines.remove(vaccine);
      selectedVaccines.remove(vaccine);
    } else {
      var result = await Get.dialog(
        DatePickerDialog(
          initialDate: DateTime(1990),
          firstDate: DateTime(1990),
          lastDate: DateTime.now(),
        ),
      );
      if (result is DateTime) {
        takenVaccines[vaccine] = result;
        selectedVaccines.add(vaccine);
      }
    }
  }

  Future<void> addNewVaccine() async {
    var result = await Get.dialog(const AddOrEditVaccineDialog());
    if (result == true) {
      vaccines.value = getVaccines();
    }
  }

  List<TakenVaccine> returnTakenVaccines() {
    List<TakenVaccine> toBeReturnedTakenVaccines = [];
    for (Vaccine vaccine in selectedVaccines) {
      toBeReturnedTakenVaccines.add(
        TakenVaccine(
            id: -1,
            medicalRecordId: -1,
            vaccineId: vaccine.id,
            shotDate: takenVaccines[vaccine]!),
      );
    }
    return toBeReturnedTakenVaccines;
  }
}
