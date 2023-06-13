import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/employee.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../tools/ui_tools/buttons.dart';
import '../../../../models/helpers/database_helpers/employees_db_helper.dart';

class ChangeAccountInfoDialogController extends GetxController {
  Employee employee;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;

  ChangeAccountInfoDialogController({
    required this.employee,
  });

  @override
  void onInit() {
    passwordController.text = employee.password;
    userNameController.text = employee.userName;
    super.onInit();
  }

  bool validateFields() {
    if (userNameController.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
        title: 'حقل اسم المستخدم فارغ',
        message: 'الرجاء ملئ حقل إسم المستخدم',
      );
      return false;
    } else if (passwordController.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
          title: 'حقل كلمة السر فارغ', message: 'الرجاء ملئ حقل كلمة السر');
      return false;
    }
    if (userNameController.text == employee.userName &&
        passwordController.text == employee.password) {
      Get.back();
      SnackBarService.showNeutralSnackBar(
        title: 'لا تعديل',
        message: 'لم يتم اجراء تعديلات لحفظها',
      );
      return false;
    }
    return true;
  }

  Future<bool> checkUserNameExistence() async {
    List<Employee> employees = await EmployeesDBHelper.instance.getAll();
    for (var element in employees) {
      if (element.userName == userNameController.text) {
        if (element.id == employee.id) {
          continue;
        }
        SnackBarService.showErrorSnackBar(
          title: 'إسم مستخدم موجود مسبقا',
          message: 'الرجاء إختيار إسم مستخدم مختلف',
        );
        return false;
      }
    }
    return true;
  }

  Future<void> updateEmployeeInfo() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      if (!await checkUserNameExistence()) {
        return;
      }
      employee = employee.copyWith(
          userName: userNameController.text, password: passwordController.text);
      await EmployeesDBHelper.instance.update(employee);
      Get.back(result: employee);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
