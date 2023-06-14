import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/models/agendas/employee.dart';
import 'package:kalam_noor/models/agendas/job_title.dart';
import '../../../../models/helpers/database_helpers/addresses_db_helper.dart';
import '../views/dialogs/change_account_info_dialog.dart';

class SettingsPageController extends GetxController {
  SettingsPageController({
    required this.employee,
    required this.jobTitle,
  });
  Rx<Employee> employee;
  final JobTitle jobTitle;
  late Future<ImageProvider> profileImage;
  @override
  onInit() {
    profileImage = getAvatarImage();
    super.onInit();
  }

  Future<Address?> getAddress() async {
    return AddressesDBHelper.instance.getById(employee.value.addressId);
  }

  Future<ImageProvider> getAvatarImage() async {
    return AssetImage(
      employee.value.getAvatarImage(),
    );
  }

  String getFullName() {
    return '${employee.value.firstName} ${employee.value.lastName}';
  }

  Future<void> changeLoginInfo() async {
    var result = await Get.dialog(
      const ChangeAccountInfoDialog(),
    );
    if (result is Employee) {
      employee.value = result;
    }
  }
}
