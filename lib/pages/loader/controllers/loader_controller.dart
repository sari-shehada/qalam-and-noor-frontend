import 'package:get/get.dart';

import '../../../controllers/navigation_controller.dart';
import '../../../dummy_methods.dart';
import '../../../models/employee.dart';
import '../../../models/shared_prefs_helper.dart';

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
