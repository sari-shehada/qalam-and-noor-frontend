import 'package:kalam_noor/dummy_data.dart';
import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/models/address/area.dart';
import 'package:kalam_noor/models/address/city.dart';

import 'controllers/navigation_controller.dart';
import 'models/agendas/employee.dart';
import 'models/shared_prefs_helper.dart';

Future<Employee> getEmployeeCredentials(String employeeId) async {
  await Future.delayed(const Duration(seconds: 2));
  return Employee(
      employeeId: employeeId,
      firstName: 'محمد',
      lastName: 'المحمد',
      jobTitle: JobTitle.secretKeeper);
}

Future<bool> isLoggedIn() async {
  //TODO:
  return false;
}

Future<String> getCurrentEmployeeId() async {
//TODO:
  return '';
}

Future<void> logout() async {
  await SharedPrefsHelper.instance.setLoginStatus(false);
  NavigationController.toLoginPage();
}

Future<List<Area>> dummyGetAreasInCity(int cityId) async {
  //TODO:
  return dummyAreas.where((element) => element.cityId == cityId).toList();
}

Future<List<Address>> dummyGetAddressesInArea(Area area) async {
  //TODO:
  return dummyAddresses;
}

Future<List<City>> dummyGetCities() async {
  await dummyDelayedFuture();
  return dummyCities;
}

Future<void> dummyDelayedFuture() async {
  await Future.delayed(Duration(milliseconds: 1500));
}
