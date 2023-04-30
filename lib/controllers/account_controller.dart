import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helpers/employees_db_helper.dart';

import '../models/agendas/employee.dart';
import '../models/shared_prefs_helper.dart';
import 'navigation_controller.dart';

class AccountController extends GetxController {
  late Employee employee;

  AccountController();

  Future<void> logout() async {
    await SharedPrefsHelper.instance.deleteLoginData();
    NavigationController.toLoginPage();
  }

  Future<Employee> getCredentials({
    required int employeeId,
  }) async {
    employee = await EmployeesDBHelper.instance.getById(employeeId);
    return employee;
  }

  Future<bool> login({
    required String userName,
    required String password,
  }) async {
    //TODO:
    await getCredentials(employeeId: 13);
    return true;
  }
}
