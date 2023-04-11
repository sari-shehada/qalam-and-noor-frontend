import 'package:kalam_noor/models/educational/class.dart';

import '../address/address.dart';
import '../address/area.dart';
import '../address/city.dart';

import '../../dummy_data.dart';
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

  static Future<City> addCity(City city) async {
    //TODO: Change to an api call
    city = city.copyWith(id: dummyCities.length + 1);
    dummyCities.add(city);
    return city;
  }

  //Areas
  static Future<Area> addNewArea(Area area) async {
    //TODO: Change to an api call
    area = area.copyWith(id: dummyAreas.length + 1);
    dummyAreas.add(area);
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

  static Future<int> getCityAddressesCount(int cityId) async {
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

  static Future<List<Address>> getAddressesInCity({required int areaId}) async {
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
