import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/employee.dart';
import 'package:kalam_noor/models/helpers/database_helpers/employees_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/job_titles_db_helper.dart';

import '../../../../models/agendas/job_title.dart';
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
    print(currentDisplayOption.value);
    List<Employee> employees = [];
    if (currentDisplayOption.value == null) {
      employees = await EmployeesDBHelper.instance.getAll();
    } else {
      employees = await EmployeesDBHelper.instance
          .getAllByJobTitleId(currentDisplayOption.value!);
    }
    switch (currentSortingOption.value) {
      case EmployeeSortingOption.none:
        return employees;
      case EmployeeSortingOption.nameAsc:
        {
          employees.sort(
            (a, b) => a.firstName.compareTo(b.firstName),
          );
          return employees;
        }
      case EmployeeSortingOption.nameDesc:
        {
          employees.sort(
            (a, b) => b.firstName.compareTo(a.firstName),
          );
          return employees;
        }
    }
  }

  void refreshEmployees() {
    employees.value = getEmployees();
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
