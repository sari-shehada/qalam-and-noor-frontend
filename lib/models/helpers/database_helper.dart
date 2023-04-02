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

  Future<Area> addNewArea(Area area) async {
    //TODO:
    area = area.copyWith(id: dummyAreas.length);
    dummyAreas.add(area);
    return area;
  }

  Future<Address> addNewAddress(Address address) async {
    //TODO:
    address = address.copyWith(id: dummyAddresses.length);
    dummyAddresses.add(address);
    return address;
  }
}
