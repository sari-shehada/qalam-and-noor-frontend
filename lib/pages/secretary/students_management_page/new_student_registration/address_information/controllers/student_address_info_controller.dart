import 'package:get/get.dart';
import '../models/student_address_info.dart';
import '../views/dialogs/student_address_info_dialog.dart';

class StudentAddressInfoController extends GetxController {
  Rx<StudentAddressInfo?> addressInfo = Rx<StudentAddressInfo?>(null);

  Future<void> selectStudentAddress() async {
    var result = await Get.dialog(const StudentAddressInfoDialog());
    if (result is StudentAddressInfo) {
      addressInfo.value = result;
    }
  }
}
