import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/models/address/area.dart';
import 'package:kalam_noor/models/address/city.dart';

import '../../dummy_data.dart';

abstract class DatabaseHelper {
  //Addresses
  //Cities
  static Future<List<City>> getAllCities() async {
    //TODO: Change to an api call
    await Future.delayed(
      Duration(
        milliseconds: 400,
      ),
    );
    return dummyCities;
  }

  static Future<City> addCity(City city) async {
    //TODO: Change to an api call
    city = city.copyWith(id: dummyCities.length);
    dummyCities.add(city);
    return city;
  }

  static Future<Area> addNewArea(Area area) async {
    //TODO: Change to an api call
    area = area.copyWith(id: dummyAreas.length);
    dummyAreas.add(area);
    return area;
  }

  static Future<Address> addNewAddress(Address address) async {
    //TODO: Change to an api call
    address = address.copyWith(id: dummyAddresses.length);
    dummyAddresses.add(address);
    return address;
  }

  static Future<int> getCityAreasCount(int cityId) async {
    //TODO: Change to an api call
    int count = 0;
    dummyAreas.forEach((element) {
      if (element.cityId == cityId) {
        count++;
      }
    });
    return count;
  }

  static Future<int> getCityAddressesCount(int cityId) async {
    //TODO: Change to an api call
    int count = 0;
    List<Area> areasInCity = [];
    dummyAreas.forEach((element) {
      if (element.cityId == cityId) {
        areasInCity.add(element);
      }
    });
    areasInCity.forEach((area) {
      count +=
          dummyAddresses.where((address) => address.areaId == area.id).length;
    });
    return count;
  }

  static Future<int> getAreaAddressesCount(int areaId) async {
    //TODO: Change to an api call
    int count = 0;
    dummyAddresses.forEach((address) {
      if (address.areaId == areaId) {
        count++;
      }
    });
    return count;
  }

  static Future<List<Area>> getAreasInCity({required int cityId}) async {
    List<Area> tempAreas = [];
    dummyAreas.forEach((area) {
      if (area.cityId == cityId) {
        tempAreas.add(area);
      }
    });
    return tempAreas;
  }
}
