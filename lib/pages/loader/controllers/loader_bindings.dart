import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';
import '../../../models/agendas/employee.dart';
import 'loader_controller.dart';

class LoaderBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoaderController());
    //TODO:
    Get.put(
      AccountController(
        employee: Employee(
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
            addressId: 1),
      ),
    );
  }
}
