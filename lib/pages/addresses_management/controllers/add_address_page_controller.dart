import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressPageController extends GetxController {
  int? cityId;
  int? areaId;
  TextEditingController addressNameController = TextEditingController();
  TextEditingController addressDetailsController = TextEditingController();

  AddAddressPageController();

  void changeCity(int? id) {
    id ?? (cityId = id);
  }

  void changeArea(int? id) {
    id ?? (areaId = id);
  }

  void addAddress() {
    //TODO: Validate fields here
  }
}
