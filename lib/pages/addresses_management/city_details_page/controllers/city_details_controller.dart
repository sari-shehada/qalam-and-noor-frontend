// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:kalam_noor/pages/addresses_management/city_details_page/views/widgets/add_new_area_dialog.dart';

import '../../../../models/address/area.dart';
import '../../../../models/address/city.dart';
import '../../../../models/helpers/database_helper.dart';

class CityDetailsController extends GetxController {
  final City city;

  late Rx<Future<List<Area>>> areas;

  CityDetailsController({
    required this.city,
  }) {
    areas = getAreasInCity().obs;
  }

  Future<List<Area>> getAreasInCity() async {
    return await DatabaseHelper.getAreasInCity(cityId: city.id);
  }

  Future<void> addNewArea() async {
    var result = await Get.dialog(
      AddNewAreaDialog(
        cityId: city.id,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      areas.value = getAreasInCity();
    }
  }
}
