import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/dummy_data.dart';
import 'package:kalam_noor/dummy_methods.dart';

import '../../../models/address/area.dart';
import '../../../models/address/city.dart';

class AddAddressPageController extends GetxController {
  RxList<City> cities = <City>[].obs;
  RxList<Area> areasInCity = <Area>[].obs;
  RxBool isLoading = false.obs;
  int? selectedCityId;
  int? selectedAreaId;
  RxBool areaDropdownListEnabled = false.obs;

  AddAddressPageController() {
    loadCities();
  }

  Future<List<City>> loadCities() async {
    isLoading.value = true;
    cities.clear();
    await dummyGetCities().then((list) => list.forEach((city) {
          cities.add(city);
        }));
    isLoading.value = false;
    return cities;
  }

  void selectCity(int? id) async {
    print('selected: $id');
    selectedCityId = id;
    if (id == null) {
      selectedAreaId = null;
      areaDropdownListEnabled.value = true;
    } else {
      await getAreasInCity(id);
    }
  }

  Future<List<Area>> getAreasInCity(int cityId) async {
    areasInCity.clear();
    areaDropdownListEnabled.value = false;
    //TODO: Change to a helper call
    await dummyGetAreasInCity(cityId).then((areas) => areas.forEach((area) {
          areasInCity.add(area);
        }));
    areaDropdownListEnabled.value = true;
    print(areasInCity);
    return areasInCity;
  }

  void selectArea(int? id) {
    selectedAreaId = id;
  }

  void addAddress() {
    //TODO: Validate fields here
  }
}
