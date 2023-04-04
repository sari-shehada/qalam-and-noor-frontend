import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/dummy_data.dart';
import 'package:kalam_noor/dummy_methods.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';

import '../../../../models/address/area.dart';
import '../../../../models/address/city.dart';

class AddAddressPageController extends GetxController {
  Rx<CallToActionButtonStatus> buttonStatus =
      CallToActionButtonStatus.enabled.obs;
  RxList<City> cities = <City>[].obs;
  RxList<Area> areasInCity = <Area>[].obs;
  RxList<DropdownMenuEntry> areasItems = <DropdownMenuEntry>[].obs;
  RxBool isLoading = false.obs;
  int? selectedCityId;
  int? selectedAreaId;
  RxBool areaDropdownListEnabled = false.obs;
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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
    selectedCityId = id;
    if (id == null) {
      selectedAreaId = null;
      areaDropdownListEnabled.value = true;
    } else {
      await updateAreasInCity(id);
    }
  }

  Future<List<Area>> updateAreasInCity(int cityId) async {
    areasInCity.clear();
    areasItems.clear();
    areaDropdownListEnabled.value = false;
    //TODO: Change to a helper call
    await dummyGetAreasInCity(cityId).then((areas) => areas.forEach((area) {
          areasInCity.add(area);
          areasItems.add(
            DropdownMenuEntry(value: area.id, label: area.name),
          );
        }));
    selectedAreaId = null;
    areaDropdownListEnabled.value = true;
    print(areaController.text);
    areaController.text = '';
    return areasInCity;
  }

  void selectArea(int? id) {
    selectedAreaId = id;
  }

  Future<void> addAddress() async {
    print(selectedAreaId);
    //TODO: Validate fields here
    try {
      buttonStatus.value = CallToActionButtonStatus.processing;
      await dummyDelayedFuture();
      print(cityController.text);
      if (selectedCityId == null && cityController.text.isEmpty) {
        SnackbarService.showErrorSnackBar(
            title: 'لا توجد مدينة',
            message: 'يرجى اختيار مدينة او ادخال مدينة جديدة');
        return;
      }
      if (selectedAreaId == null && areaController.text.isEmpty) {
        SnackbarService.showErrorSnackBar(
            title: 'لا توجد منطقة',
            message: 'يرجى اختيار منطقة او ادخال منطقة جديدة');
        return;
      }
      if (addressController.text.isEmpty) {
        SnackbarService.showErrorSnackBar(
            title: 'لا يوجد عنوان',
            message: 'يرجى اختيار عنوان او ادخال عنوان جديدة');
        return;
      }
      dummyCities.add(City(id: 3, name: 'دمشق'));
      Get.back(result: true);
    } catch (e) {
    } finally {
      buttonStatus.value = CallToActionButtonStatus.enabled;
    }
  }
}
