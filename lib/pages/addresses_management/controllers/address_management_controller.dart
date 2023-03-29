import 'package:get/get.dart';
import 'package:kalam_noor/dummy_methods.dart';
import 'package:kalam_noor/models/address/city.dart';
import 'package:kalam_noor/pages/addresses_management/controllers/add_or_edit_address_bindings.dart';
import 'package:kalam_noor/pages/addresses_management/views/add_address_page.dart';

class AddressManagementController extends GetxController {
  RxList<City> cities = <City>[].obs;

  Future<List<City>> getCitiesToDisplay() async {
    cities.value = await getAllCities();
    return cities;
  }

  Future<void> addAddress() async {
    await Get.to(
      () => const AddOrEditAddressPage(),
      binding: AddOrEditAddressBindings(),
    );
  }
}
