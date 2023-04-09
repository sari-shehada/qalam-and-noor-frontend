// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/models/address/area.dart';
import 'package:kalam_noor/pages/addresses_management/area_details_page/views/widgets/add_new_address_dialog.dart';

import '../../../../models/helpers/database_helper.dart';

class AreaDetailsController extends GetxController {
  final Area area;
  late Rx<Future<List<Address>>> addresses;

  AreaDetailsController({
    required this.area,
  }) {
    addresses = getAddressesInCity().obs;
  }

  Future<List<Address>> getAddressesInCity() async {
    return await DatabaseHelper.getAddressesInCity(areaId: area.id);
  }

  Future<void> addNewAddress() async {
    var result = await Get.dialog(
      AddNewAddressDialog(
        areaId: area.id,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      addresses.value = getAddressesInCity();
    }
  }
}
