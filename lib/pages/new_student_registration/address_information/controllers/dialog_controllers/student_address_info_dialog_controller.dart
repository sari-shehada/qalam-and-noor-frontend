import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/addresses_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/area_db_helper.dart';
import 'package:kalam_noor/pages/addresses_management/main_page/views/dialogs/add_or_edit_city_dialog.dart';
import 'package:kalam_noor/pages/new_student_registration/address_information/models/student_address_info.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

import '../../../../../models/address/address.dart';
import '../../../../../models/address/area.dart';
import '../../../../../models/address/city.dart';

import '../../../../../models/helpers/database_helpers/cities_db_helper.dart';
import '../../../../addresses_management/area_details_page/views/widgets/add_or_edit_address_dialog.dart';
import '../../../../addresses_management/city_details_page/views/widgets/add_or_edit_area_dialog.dart';

class StudentAddressInfoDialogController extends GetxController {
  RxDouble containerHeight =
      StudentAddressInfoDialogControllerConstants.containerInitialHeight.obs;
  Rx<City?> selectedCity = Rx<City?>(null);
  Rx<Area?> selectedArea = Rx<Area?>(null);
  Rx<Address?> selectedAddress = Rx<Address?>(null);
  RxBool cityDropDownButtonEnabled = false.obs;
  RxBool areaDropDownButtonEnabled = false.obs;
  RxBool addressDropDownButtonEnabled = false.obs;
  RxBool isProcessing = true.obs;

  RxList<City> cities = <City>[].obs;
  RxList<Area> areas = <Area>[].obs;
  RxList<Address> addresses = <Address>[].obs;

  StudentAddressInfoDialogController() {
    getCities();
  }

  Future<void> getCities() async {
    isProcessing.value = true;
    changeContainerHeight(ContainerStageHeight.stage1);
    cityDropDownButtonEnabled.value = false;
    areaDropDownButtonEnabled.value = false;
    addressDropDownButtonEnabled.value = false;
    cities.value = await CitiesDBHelper.instance.getAll();
    cityDropDownButtonEnabled.value = true;
    isProcessing.value = false;
  }

  void selectCity(City? city) {
    if (city == null) {
      return;
    }
    selectedCity.value = city;
    getAreasInCity(city);
  }

  void selectArea(Area? area) {
    if (area == null) {
      return;
    }
    selectedArea.value = area;
    getAddressesInArea(area);
  }

  void selectAddress(Address? address) {
    if (address == null) {
      return;
    }
    selectedAddress.value = address;
  }

  void returnData() {
    if (selectedAddress.value == null) {
      SnackBarService.showErrorSnackBar(
          title: 'لم يتم اختيار عنوان',
          message: 'يرجى اختيار عنوان ومن ثم المتابعة');
      return;
    }
    Get.back(
      result: StudentAddressInfo(
        city: selectedCity.value!,
        area: selectedArea.value!,
        address: selectedAddress.value!,
      ),
    );
  }

  Future<void> getAreasInCity(City city) async {
    isProcessing.value = true;
    areaDropDownButtonEnabled.value = false;
    addressDropDownButtonEnabled.value = false;
    selectedArea.value = null;
    selectedAddress.value = null;
    changeContainerHeight(ContainerStageHeight.stage1);
    areas.value = await AreasDBHelper.instance.getAllByCityId(cityId: city.id);
    areaDropDownButtonEnabled.value = true;
    changeContainerHeight(ContainerStageHeight.stage2);
    isProcessing.value = false;
  }

  Future<void> getAddressesInArea(Area area) async {
    isProcessing.value = true;
    addressDropDownButtonEnabled.value = false;
    selectedAddress.value = null;
    changeContainerHeight(ContainerStageHeight.stage2);

    addresses.value =
        await AddressesDBHelper.instance.getAllByAreaId(areaId: area.id);
    addressDropDownButtonEnabled.value = true;
    changeContainerHeight(ContainerStageHeight.stage3);
    isProcessing.value = false;
  }

  void changeContainerHeight(ContainerStageHeight stage) {
    switch (stage) {
      case ContainerStageHeight.stage1:
        containerHeight.value =
            StudentAddressInfoDialogControllerConstants.containerInitialHeight;
        break;
      case ContainerStageHeight.stage2:
        containerHeight.value =
            StudentAddressInfoDialogControllerConstants.containerSecondHeight;
        break;
      case ContainerStageHeight.stage3:
        containerHeight.value =
            StudentAddressInfoDialogControllerConstants.containerThirdHeight;
        break;
    }
  }

  Future<void> addCity() async {
    var result = await Get.dialog(const AddOrEditCityDialog());
    if (result == true) {
      getCities();
    }
  }

  Future<void> addArea() async {
    var result = await Get.dialog(AddOrEditAreaDialog(
      argument: selectedCity.value!.id,
    ));
    if (result == true) {
      getAreasInCity(selectedCity.value!);
    }
  }

  Future<void> addAddress() async {
    var result = await Get.dialog(AddOrEditAddressDialog(
      argument: selectedArea.value!.id,
    ));
    if (result == true) {
      getAddressesInArea(selectedArea.value!);
    }
  }
}

enum ContainerStageHeight {
  stage1,
  stage2,
  stage3,
}

class StudentAddressInfoDialogControllerConstants {
  static Duration get animationDuration => 600.milliseconds;
  static Curve get animationCurve => Curves.fastLinearToSlowEaseIn;
  static double get containerInitialHeight => 310.h;
  static double get containerSecondHeight => 430.h;
  static double get containerThirdHeight => 550.h;
}
