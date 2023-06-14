abstract class EmployeesManagementConstants {
  static Map<EmployeeDisplayOption, String> employeeDisplayOptionsAsString = {
    EmployeeDisplayOption.all: 'الكل',
    EmployeeDisplayOption.secretaries: 'امناء السر',
    EmployeeDisplayOption.psychologicalInstructors: 'المرشدين الاجتماعيين',
    EmployeeDisplayOption.teachers: 'المدرسين',
  };

  static Map<EmployeeSortingOption, String> employeeSortingOptionsAsString = {
    EmployeeSortingOption.none: 'دون ترتيب',
    EmployeeSortingOption.nameAsc: 'الاسم تصاعدياً',
    EmployeeSortingOption.nameDesc: 'الاسم تنازلياً',
    EmployeeSortingOption.startDateAsc: 'تاريخ المزاولة تصاعدياً',
    EmployeeSortingOption.startDateDesc: 'تاريخ المزاولة تنازلياً',
  };
}

enum EmployeeDisplayOption {
  all,
  secretaries,
  psychologicalInstructors,
  teachers,
}

enum EmployeeSortingOption {
  none,
  nameAsc,
  nameDesc,
  startDateAsc,
  startDateDesc,
}
