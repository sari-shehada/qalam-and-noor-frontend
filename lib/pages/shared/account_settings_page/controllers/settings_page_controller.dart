import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/address_information/models/student_address_info.dart';
import '../../../../models/address/address.dart';
import '../../../../models/address/area.dart';
import '../../../../models/address/city.dart';
import '../../../../models/agendas/employee.dart';
import '../../../../models/agendas/job_title.dart';
import '../../../../models/helpers/database_helpers/addresses_db_helper.dart';
import '../../../../models/helpers/database_helpers/area_db_helper.dart';
import '../../../../models/helpers/database_helpers/cities_db_helper.dart';
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

  Future<StudentAddressInfo> getEmployeeAddressInfo() async {
    Address? address =
        await AddressesDBHelper.instance.getById(employee.value.addressId);
    Area? area = await AreasDBHelper.instance.getById(address!.areaId);
    City? city = await CitiesDBHelper.instance.getById(area!.cityId);
    return StudentAddressInfo(city: city!, area: area, address: address);
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
