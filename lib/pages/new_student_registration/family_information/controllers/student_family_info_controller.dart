import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/families.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/agendas/responsible_person.dart';

import '../views/dialogs/student_family_info_dialog.dart';

class StudentFamilyInfoController extends GetxController {
  Rx<Family?> family = Rx<Family?>(null);
  Rx<Father?> father = Rx<Father?>(null);
  Rx<Mother?> mother = Rx<Mother?>(null);
  Rx<ResponsiblePerson?> responsiblePerson = Rx<ResponsiblePerson?>(null);

  Future<void> selectStudentFamily() async {
    await Get.dialog(
      StudentFamilyInfoDialog(),
    );
  }
}
