import 'package:get/get.dart';
import '../../../../../models/agendas/employee.dart';
import '../../../../../models/helpers/database_helpers/employees_db_helper.dart';
import '../../../../../models/helpers/database_helpers/job_titles_db_helper.dart';

import '../../../../../controllers/navigation_controller.dart';
import '../../../../../models/agendas/job_title.dart';
import '../models/employee_management_constants.dart';

class EmployeesManagementController extends GetxController {
  late Rx<Future<List<Employee>>> employees;
  RxList<JobTitle> jobTitles = <JobTitle>[].obs;
  Rx<JobTitle?> currentDisplayOption = Rx(null);
  Rx<EmployeeSortingOption> currentSortingOption =
      EmployeeSortingOption.none.obs;

  EmployeesManagementController() {
    employees = getEmployees().obs;
    updateJobTitles();
  }
  void changeSortingOption(EmployeeSortingOption? sortingOption) {
    if (sortingOption == null) {
      return;
    }
    currentSortingOption.value = sortingOption;
    refreshEmployees();
  }

  void changeDisplayOption(JobTitle? displayOption) {
    if (displayOption == null) {
      return;
    }
    if (displayOption.id == -1) {
      currentDisplayOption.value = null;
    } else {
      currentDisplayOption.value = displayOption;
    }
    refreshEmployees();
  }

  Future<List<Employee>> getEmployees() async {
    List<Employee> employees = [];
    if (currentDisplayOption.value == null) {
      employees = await EmployeesDBHelper.instance.getAll();
    } else {
      employees = await EmployeesDBHelper.instance
          .getAllByJobTitleId(currentDisplayOption.value!);
    }
    switch (currentSortingOption.value) {
      case EmployeeSortingOption.none:
        break;
      case EmployeeSortingOption.nameAsc:
        {
          employees.sort(
            (a, b) => a.firstName.compareTo(b.firstName),
          );
          break;
        }
      case EmployeeSortingOption.nameDesc:
        {
          employees.sort(
            (a, b) => b.firstName.compareTo(a.firstName),
          );
          break;
        }
      case EmployeeSortingOption.startDateAsc:
        {
          employees.sort(
            (a, b) => a.startDate.compareTo(b.startDate),
          );
          break;
        }
      case EmployeeSortingOption.startDateDesc:
        {
          employees.sort(
            (a, b) => b.startDate.compareTo(a.startDate),
          );
          break;
        }
    }
    return employees;
  }

  void refreshEmployees() {
    employees.value = getEmployees();
  }

  Future<void> addNewEmployee() async {
    var result = await NavigationController.toAddNewEmployeePage();
    if (result == true) {
      refreshEmployees();
    }
  }

  Future<void> updateJobTitles() async {
    List<JobTitle> tempJobTitles = [
      JobTitle(
        id: -1,
        name: 'جميع المسميات الوظيفية',
        details: '',
      ),
    ];
    List<JobTitle> newJobTitles = await JobTitlesDBHelper.instance.getAll();
    newJobTitles.sort(((a, b) => a.name.compareTo(b.name)));
    tempJobTitles += newJobTitles;
    jobTitles.value = tempJobTitles;
  }
}
