import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/responsible_person.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/models/family_info.dart';

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
