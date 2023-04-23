import 'package:get/get.dart';
import 'package:kalam_noor/pages/new_student_registration/address_information/models/student_address_info.dart';
import 'package:kalam_noor/pages/new_student_registration/address_information/views/dialogs/student_address_info_dialog.dart';

class StudentAddressInfoController extends GetxController {
  Rx<StudentAddressInfo?> addressInfo = Rx<StudentAddressInfo?>(null);

  Future<void> selectStudentAddress() async {
    var result = await Get.dialog(const StudentAddressInfoDialog());
    if (result is StudentAddressInfo) {
      addressInfo.value = result;
    }
  }
}
