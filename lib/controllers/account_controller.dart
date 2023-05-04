import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/job_title.dart';
import 'package:kalam_noor/models/helpers/database_helpers/employee_management/employee_auth_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/employee_management/employee_auth_exceptions.dart';
import 'package:kalam_noor/models/helpers/database_helpers/employee_management/employee_auth_model.dart';
import 'package:kalam_noor/models/helpers/database_helpers/employees_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/job_titles_db_helper.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

import '../models/agendas/employee.dart';
import '../models/shared_prefs_helper.dart';
import 'navigation_controller.dart';

class AccountController extends GetxController {
  late Employee employee;
  late JobTitle jobTitle;

  AccountController();

  Future<void> logout() async {
    await SharedPrefsHelper.instance.deleteLoginData();
    NavigationController.toLoginPage();
  }

  Future<Employee> getCredentials({
    required int employeeId,
  }) async {
    employee = await EmployeesDBHelper.instance.getById(employeeId);
    jobTitle = await JobTitlesDBHelper.instance.getById(employee.jobTitleId);
    return employee;
  }

  Future<bool> login({
    required String userName,
    required String password,
  }) async {
    try {
      EmployeeAuthModel authModel = await EmployeeAuthDBHelper.instance
          .login(userName: userName, password: password);
      employee = authModel.employee!;
      jobTitle = authModel.jobTitle!;
      return true;
    } on InvalidCredentialsException catch (e) {
      SnackBarService.showErrorSnackBar(
        title: 'فشل تسجيل الدخول',
        message: e.message,
      );
      return false;
    }
  }
}
