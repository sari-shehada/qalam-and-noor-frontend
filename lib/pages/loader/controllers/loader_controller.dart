import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';

import '../../../controllers/navigation_controller.dart';
import '../../../models/shared_prefs_helper.dart';

class LoaderController extends GetxController {
  Future<void> loadApplication() async {
    if (!await SharedPrefsHelper.instance.getLoginStatus()) {
      NavigationController.toLoginPage();
      return;
    }
    //TODO: Add getting the job title as well as other info about the employee and navigating accordingly

    //TODO: Refactor the identity model
    int employeeId = await SharedPrefsHelper.instance.getLoginData();
    await Get.find<AccountController>().getCredentials(employeeId: employeeId);
    NavigationController.toDashboard();
    return;
  }
}
