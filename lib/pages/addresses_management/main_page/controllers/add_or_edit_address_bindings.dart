import 'package:get/get.dart';
import '../../../../models/address/address.dart';
import 'add_address_page_controller.dart';

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
