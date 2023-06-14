import 'package:get/get.dart';
import '../../../../../../models/agendas/responsible_person.dart';
import '../models/family_info.dart';

import '../views/dialogs/student_family_info_dialog.dart';

class StudentFamilyInfoController extends GetxController {
  Rx<FamilyInfo?> familyInfo = Rx<FamilyInfo?>(null);

  Rx<ResponsiblePerson?> responsiblePerson = Rx<ResponsiblePerson?>(null);

  Future<void> selectStudentFamily() async {
    var result = await Get.dialog(
      const StudentFamilyInfoDialog(),
    );
    if (result is FamilyInfo) {
      familyInfo.value = result;
      familyInfo.refresh();
    }
  }
}
