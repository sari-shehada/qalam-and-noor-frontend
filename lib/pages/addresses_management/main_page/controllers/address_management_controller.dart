// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:kalam_noor/models/address/city.dart';
import 'package:kalam_noor/models/helpers/database_helper.dart';
import 'package:kalam_noor/pages/addresses_management/main_page/views/dialogs/add_address_dialog.dart';
import 'package:kalam_noor/pages/addresses_management/main_page/views/dialogs/add_new_city_dialog.dart';

class AddressManagementController extends GetxController {
  // RxList<City> cities = <City>[].obs;
  late Rx<Future<RxList<City>>> cities;
  AddressManagementController() {
    cities = getCitiesToDisplay().obs;
  }

  Future<RxList<City>> getCitiesToDisplay() async {
    RxList<City> cities = <City>[].obs;
    await DatabaseHelper.getAllCities()
        .then((value) => value.forEach((element) {
              cities.add(element);
            }));
    return cities;
  }

  Future<void> addAddress() async {
    var result = await Get.dialog(
      const AddOrEditAddressDialog(),
      barrierDismissible: true,
    );
    if (result == true) {
      print('Refreshing Cities');
      cities.value = getCitiesToDisplay();
    }
  }

  Future<void> addNewCity() async {
    var result = await Get.dialog(
      const AddNewCityDialog(),
      barrierDismissible: true,
    );
    if (result == true) {
      print('Refreshing Cities');
      cities.value = getCitiesToDisplay();
    }
  }
}
