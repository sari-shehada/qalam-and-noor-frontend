// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:kalam_noor/pages/addresses_management/city_details_page/views/widgets/add_or_edit_area_dialog.dart';

import '../../../../models/address/area.dart';
import '../../../../models/address/city.dart';
import '../../../../models/helpers/database_helper.dart';
import '../../main_page/controllers/address_management_controller.dart';

class CityDetailsController extends GetxController {
  final City city;

  late Rx<Future<List<Area>>> areas;
  Rx<CitiesSortingOption> currentSortingOption = CitiesSortingOption.none.obs;

  CityDetailsController({
    required this.city,
  }) {
    areas = getAreasInCity().obs;
  }

  void changeSortingOption(CitiesSortingOption? sortingOption) {
    currentSortingOption.value = sortingOption ?? currentSortingOption.value;
    areas.value = getAreasInCity();
  }

  Future<List<Area>> getAreasInCity() async {
    List<Area> newAreas = await DatabaseHelper.getAreasInCity(cityId: city.id);
    switch (currentSortingOption.value) {
      case CitiesSortingOption.none:
        return newAreas;
      case CitiesSortingOption.byNameAsc:
        {
          newAreas.sort(
            (a, b) => a.name.compareTo(b.name),
          );
          return newAreas;
        }
      case CitiesSortingOption.byNameDesc:
        {
          newAreas.sort(
            (a, b) => b.name.compareTo(a.name),
          );
          return newAreas;
        }
    }
  }

  Future<void> addNewArea() async {
    var result = await Get.dialog(
      AddOrEditAreaDialog(
        argument: city.id,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      areas.value = getAreasInCity();
    }
  }

  Future<void> updateAreaInfo(Area area) async {
    var result = await Get.dialog(
      AddOrEditAreaDialog(
        argument: area,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      areas.value = getAreasInCity();
    }
  }
}
