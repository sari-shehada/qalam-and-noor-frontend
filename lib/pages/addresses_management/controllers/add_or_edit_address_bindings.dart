import 'package:get/get.dart';
import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/models/address/city.dart';
import 'package:kalam_noor/pages/addresses_management/controllers/add_address_page_controller.dart';
import 'package:kalam_noor/pages/addresses_management/controllers/address_management_controller.dart';

class AddOrEditAddressBindings extends Bindings {
  final Address? address;
  @override
  void dependencies() {
    Get.put(
      AddAddressPageController(),
    );
  }

  AddOrEditAddressBindings({this.address});
}
