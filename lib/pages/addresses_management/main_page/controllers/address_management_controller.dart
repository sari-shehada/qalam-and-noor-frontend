// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:kalam_noor/models/address/city.dart';
import 'package:kalam_noor/models/helpers/database_helper.dart';
import 'package:kalam_noor/pages/addresses_management/main_page/views/dialogs/add_or_edit_city_dialog.dart';

import 'addresses_management_stats_controller.dart';

class AddressManagementController extends GetxController {
  late Rx<Future<RxList<City>>> cities;
  Rx<CitiesSortingOption> currentSortingOption = CitiesSortingOption.none.obs;
  AddressManagementController() {
    cities = getCitiesToDisplay().obs;
  }

  Future<RxList<City>> getCitiesToDisplay() async {
    RxList<City> cities = <City>[].obs;
    await DatabaseHelper.getAllCities().then((list) {
      for (City city in list) {
        cities.add(city);
      }
    });
    switch (currentSortingOption.value) {
      case CitiesSortingOption.none:
        return cities;
      case CitiesSortingOption.byNameAsc:
        {
          cities.sort(
            (a, b) => a.name.compareTo(b.name),
          );
          return cities;
        }
      case CitiesSortingOption.byNameDesc:
        {
          cities.sort(
            (a, b) => b.name.compareTo(a.name),
          );
          return cities;
        }
    }
  }

  Future<void> addNewCity() async {
    var result = await Get.dialog(
      const AddOrEditCityDialog(),
      barrierDismissible: true,
    );
    if (result == true) {
      Get.find<AddressesManagementStatsController>().refreshCitiesCount();
      cities.value = getCitiesToDisplay();
    }
  }

  void changeSortingOption(CitiesSortingOption? sortingOption) {
    currentSortingOption.value = sortingOption ?? currentSortingOption.value;
    cities.value = getCitiesToDisplay();
  }

  Future<void> updateCityInfo(City city) async {
    var result = await Get.dialog(
      AddOrEditCityDialog(
        city: city,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      cities.value = getCitiesToDisplay();
    }
  }
}

enum CitiesSortingOption {
  none,
  byNameAsc,
  byNameDesc,
}

Map<CitiesSortingOption, String> citiesSortingOptionsAsString = {
  CitiesSortingOption.none: 'دون ترتيب',
  CitiesSortingOption.byNameAsc: 'اسم المدينة تصاعديا',
  CitiesSortingOption.byNameDesc: 'اسم المدينة تنازليا',
};
