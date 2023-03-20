import 'controllers/navigation_controller.dart';
import 'models/employee.dart';
import 'models/shared_prefs_helper.dart';

Future<Employee> getEmployeeCredentials(String employeeId) async {
  await Future.delayed(Duration(seconds: 2));
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
