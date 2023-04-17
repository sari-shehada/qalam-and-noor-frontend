import 'package:kalam_noor/models/educational/class.dart';

import '../../pages/addresses_management/main_page/controllers/addresses_management_stats_controller.dart';
import '../address/address.dart';
import '../address/area.dart';
import '../address/city.dart';

import '../../to_be_disposed/data/dummy_data.dart';
import '../medical/illness.dart';
import '../medical/psychological_status.dart';
import '../medical/vaccine.dart';

abstract class DatabaseHelper {
  //Addresses

  //Cities
  static Future<List<City>> getAllCities() async {
    //TODO: Change to an api call
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    return dummyCities;
  }

  static Future<List<CityToDescendentCount>> getCitiesToAreasCount() async {
    List<City> cities = await getAllCities();
    List<CityToDescendentCount> citiesToAreasCount = [];
    for (City city in cities) {
      int areasCount = await getCityAreasCount(city.id);
      citiesToAreasCount.add(
        CityToDescendentCount(city: city, descendentCount: areasCount),
      );
    }
    final List<CityToDescendentCount> statsList = [];
    citiesToAreasCount.sort(
      (a, b) => b.descendentCount.compareTo(a.descendentCount),
    );

    int pieChartItemsToDisplay = 5;
    int othersCount = 0;
    for (int i = 0; i < citiesToAreasCount.length; i++) {
      if (i < pieChartItemsToDisplay) {
        statsList.add(citiesToAreasCount[i]);
      } else {
        othersCount += statsList[i].descendentCount;
      }
    }
    if (statsList.length > pieChartItemsToDisplay) {
      statsList.add(CityToDescendentCount(
          city: City(id: -1, name: 'مدن أخرى'), descendentCount: othersCount));
    }
    return statsList;
  }

  static Future<List<CityToDescendentCount>> getCitiesToAddressesCount() async {
    List<City> cities = await getAllCities();
    List<CityToDescendentCount> citiesToAddressesCount = [];
    for (City city in cities) {
      int addressesCount = await getCityAddressesCount(cityId: city.id);
      citiesToAddressesCount.add(
        CityToDescendentCount(city: city, descendentCount: addressesCount),
      );
    }
    final List<CityToDescendentCount> statsList = [];
    citiesToAddressesCount.sort(
      (a, b) => b.descendentCount.compareTo(a.descendentCount),
    );

    int pieChartItemsToDisplay = 5;
    int othersCount = 0;
    for (int i = 0; i < citiesToAddressesCount.length; i++) {
      if (i < pieChartItemsToDisplay) {
        statsList.add(citiesToAddressesCount[i]);
      } else {
        othersCount += statsList[i].descendentCount;
      }
    }
    if (statsList.length > pieChartItemsToDisplay) {
      statsList.add(CityToDescendentCount(
          city: City(id: -1, name: 'مدن أخرى'), descendentCount: othersCount));
    }
    return statsList;
  }

  static Future<int> getCitiesCount() async {
    //TODO: Change to an api call
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    return dummyCities.length;
  }

  static Future<City> addCity(City city) async {
    //TODO: Change to an api call
    city = city.copyWith(id: dummyCities.length + 1);
    dummyCities.add(city);
    return city;
  }

  static Future<City> updateCityById({
    required City city,
  }) async {
    //TODO: Change to an api call
    dummyCities[dummyCities.indexOf(
        dummyCities.firstWhere((element) => element.id == city.id))] = city;
    return city;
  }

  //Areas
  static Future<Area> addNewArea(Area area) async {
    //TODO: Change to an api call
    area = area.copyWith(id: dummyAreas.length + 1);
    dummyAreas.add(area);
    return area;
  }

  static Future<Area> updateAreaById({
    required Area area,
  }) async {
    //TODO: Change to an api call
    dummyAreas[dummyAreas.indexOf(
        dummyAreas.firstWhere((element) => element.id == area.id))] = area;
    return area;
  }

  static Future<int> getCityAreasCount(int cityId) async {
    //TODO: Change to an api call
    int count = 0;
    for (Area element in dummyAreas) {
      if (element.cityId == cityId) {
        count++;
      }
    }
    return count;
  }

  static Future<int> getAreasCount() async {
    //TODO: Change to an api call
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    return dummyAreas.length;
  }

  static Future<List<Area>> getAreasInCity({required int cityId}) async {
    List<Area> tempAreas = [];
    for (Area area in dummyAreas) {
      if (area.cityId == cityId) {
        tempAreas.add(area);
      }
    }
    return tempAreas;
  }

  //Addresses
  static Future<Address> addNewAddress(Address address) async {
    //TODO: Change to an api call
    address = address.copyWith(id: dummyAddresses.length + 1);
    dummyAddresses.add(address);
    return address;
  }

  static Future<Address> updateAddressById({
    required Address address,
  }) async {
    //TODO: Change to an api call
    dummyAddresses[dummyAddresses.indexOf(
            dummyAddresses.firstWhere((element) => element.id == address.id))] =
        address;
    return address;
  }

  static Future<int> getCityAddressesCount({required int cityId}) async {
    //TODO: Change to an api call
    int count = 0;
    List<Area> areasInCity = [];
    for (Area element in dummyAreas) {
      if (element.cityId == cityId) {
        areasInCity.add(element);
      }
    }
    for (Area area in areasInCity) {
      count +=
          dummyAddresses.where((address) => address.areaId == area.id).length;
    }
    return count;
  }

  static Future<int> getAreaAddressesCount(int areaId) async {
    //TODO: Change to an api call
    int count = 0;
    for (Address address in dummyAddresses) {
      if (address.areaId == areaId) {
        count++;
      }
    }
    return count;
  }

  static Future<int> getAddressesCount() async {
    //TODO: Change to an api call
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    return dummyAddresses.length;
  }

  static Future<List<Address>> getAddressesInArea({required int areaId}) async {
    List<Address> tempAddresses = [];
    for (Address address in dummyAddresses) {
      if (address.areaId == areaId) {
        tempAddresses.add(address);
      }
    }
    return tempAddresses;
  }

  //School Classes
  static Future<List<Class>> getCurrentSchoolClasses() async {
    return dummyClasses;
  }

  //Psychological Matters
  static Future<List<PsychologicalStatus>> getPsychologicalStatuses() async {
    return dummyPsychologicalStatuses;
  }

  //Vaccines
  static Future<List<Vaccine>> getVaccines() async {
    return dummyVaccines;
    // return [];
  }

  //Illnesses
  static Future<List<Illness>> getIllnesses() async {
    return dummyIllnesses;
  }
}
