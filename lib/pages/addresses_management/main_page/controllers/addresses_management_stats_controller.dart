// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kalam_noor/models/helpers/database_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/cities_db_helper.dart';

import '../../../../models/address/city.dart';

class AddressesManagementStatsController extends GetxController {
  late Rx<Future<int>> citiesCount;
  late Rx<Future<int>> areasCount;
  late Rx<Future<int>> addressesCount;
  late Future<List<CityToDescendentCount>> citiesToAreasCount;
  late Future<List<CityToDescendentCount>> citiesToAddressesCount;

  AddressesManagementStatsController() {
    citiesCount = getCitiesCount().obs;
    areasCount = getAreasCount().obs;
    addressesCount = getAddressesCount().obs;
    citiesToAreasCount = getCitiesToAreasCount();
    citiesToAddressesCount = getCitiesToAddressesCount();
  }

  void refreshAllNumericData() {
    citiesCount.value = getCitiesCount();
    areasCount.value = getAreasCount();
    addressesCount.value = getAddressesCount();
  }

  void refreshCitiesCount() {
    citiesCount.value = getCitiesCount();
  }

  void refreshAreasCount() {
    areasCount.value = getAreasCount();
  }

  void refreshAddressesCount() {
    addressesCount.value = getAddressesCount();
  }

  Future<int> getCitiesCount() async {
    return CitiesDBHelper.instance.getCitiesCount();
  }

  Future<int> getAreasCount() async {
    return DatabaseHelper.getAreasCount();
  }

  Future<int> getAddressesCount() async {
    return DatabaseHelper.getAddressesCount();
  }

  Future<List<CityToDescendentCount>> getCitiesToAreasCount() async {
    return await DatabaseHelper.getCitiesToAreasCount();
  }

  Future<List<CityToDescendentCount>> getCitiesToAddressesCount() async {
    return await DatabaseHelper.getCitiesToAddressesCount();
  }
}

class CityToDescendentCount {
  final City city;
  final int descendentCount;
  Color? color;
  CityToDescendentCount({
    required this.city,
    required this.descendentCount,
    this.color,
  });
}
