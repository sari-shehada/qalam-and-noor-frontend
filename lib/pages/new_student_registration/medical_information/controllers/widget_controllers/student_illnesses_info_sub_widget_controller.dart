import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helper.dart';
import 'package:kalam_noor/models/medical/illness.dart';
import 'package:kalam_noor/pages/illnesses_management_page/views/dialogs/add_or_edit_illness_dialog.dart';

class StudentIllnessesInfoSubWidgetController extends GetxController {
  late Rx<Future<List<Illness>>> illnesses;
  RxList<Illness> selectedIllnesses = <Illness>[].obs;

  StudentIllnessesInfoSubWidgetController() {
    illnesses = getIllnesses().obs;
  }
  Future<List<Illness>> getIllnesses() async {
    return await DatabaseHelper.getIllnesses();
  }

  void selectIllness(Illness illness) {
    if (selectedIllnesses.contains(illness)) {
      selectedIllnesses.remove(illness);
    } else {
      selectedIllnesses.add(illness);
    }
  }

  Future<void> addNewIllness() async {
    var result = await Get.dialog(const AddOrEditIllnessDialog());
    if (result == true) {
      illnesses.value = getIllnesses();
    }
  }
}
