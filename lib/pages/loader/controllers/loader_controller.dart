import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';
import 'package:kalam_noor/models/employee.dart';
import 'package:kalam_noor/models/shared_prefs_helper.dart';

import '../../../dummy_methods.dart';

class LoaderController extends GetxController {
  Future<void> loadApplication() async {
    if (!await SharedPrefsHelper.instance.getLoginStatus()) {
      NavigationController.toLoginPage();
      return;
    }
    //TODO: Add gettings the job title as well as other info about the employee and navigating accordingly

    //TODO: Refactor the idenity model
    Employee employee = await getEmployeeCredentials('11');
    NavigationController.toDashboard(employee);
    return;
  }
}
