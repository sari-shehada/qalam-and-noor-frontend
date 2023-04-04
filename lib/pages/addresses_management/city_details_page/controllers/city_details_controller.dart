// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../../../../models/address/area.dart';
import '../../../../models/address/city.dart';
import '../../../../models/helpers/database_helper.dart';

class CityDetailsController extends GetxController {
  final City city;

  late Future<List<Area>> areas;

  CityDetailsController({
    required this.city,
  }) {
    areas = getAreasInCity();
  }

  Future<List<Area>> getAreasInCity() async {
    return await DatabaseHelper.getAreasInCity(cityId: city.id);
  }
}
