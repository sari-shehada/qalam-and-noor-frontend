import 'package:get/get.dart';

import '../models/agendas/employee.dart';
import '../models/shared_prefs_helper.dart';
import 'navigation_controller.dart';

class AccountController extends GetxController {
  Employee employee;

  AccountController({
    required this.employee,
  });

  Future<void> logout() async {
    await SharedPrefsHelper.instance.deleteLoginData();
    NavigationController.toLoginPage();
  }

  Future<Employee> getCredentials({
    required int employeeId,
  }) async {
    //TODO:
    employee = Employee(
        id: 12,
        firstName: 'محمد',
        lastName: 'المحمد',
        fatherName: 'أحمد',
        motherName: 'لمى',
        dateOfBirth: DateTime.now(),
        phoneNumber: '09999999',
        startDate: DateTime.now(),
        numberOfChildren: 2,
        jobTitleId: 1,
        addressId: 1);
    return employee;
  }

  Future<bool> login({
    required String userName,
    required String password,
  }) async {
    //TODO:
    employee = Employee(
        id: 12,
        firstName: 'محمد',
        lastName: 'المحمد',
        fatherName: 'أحمد',
        motherName: 'لمى',
        dateOfBirth: DateTime.now(),
        phoneNumber: '09999999',
        startDate: DateTime.now(),
        numberOfChildren: 2,
        jobTitleId: 1,
        addressId: 1);
    return true;
  }
}
