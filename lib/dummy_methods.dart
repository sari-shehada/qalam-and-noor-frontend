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

Future<List<City>> getAllCities() async {
  await Future.delayed(
    Duration(
      milliseconds: 800,
    ),
  );
  return dummyCities;
}

Future<List<Area>> dummyGetAreasInCity(City city) async {
  //TODO:
  return dummyAreas;
}

Future<List<Address>> dummyGetAddressesInArea(Area area) async {
  //TODO:
  return dummyAddresses;
}
