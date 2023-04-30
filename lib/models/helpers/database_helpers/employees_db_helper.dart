import 'package:kalam_noor/models/agendas/employee.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class EmployeesDBHelper implements CRUDInterface<Employee> {
  String get _controllerName => 'EmployeeController/';
  static EmployeesDBHelper get instance => EmployeesDBHelper();

  @override
  Future<List<Employee>> getAll() async {
    String url = '${_controllerName}GetEmployees';
    List<Employee> allEmployees =
        await HttpService.getParsed<List<Employee>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Employee.fromMap(e);
          },
        ).toList();
      },
    );
    return allEmployees;
  }

  @override
  Future<Employee> getById(int id) async {
    String url = '${_controllerName}GetEmployeeById?id=$id';
    Employee? employee =
        await HttpService.getParsed<Employee?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Employee.fromMap(responseData);
      },
    );
    if (employee == null) {
      throw Exception('No employee found with ID: $id');
    }
    return employee;
  }

  Future<int> getEmployeesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(Employee object) async {
    String url = '${_controllerName}InsertEmployee';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Employee object) async {
    String url = '${_controllerName}UpdateEmployee';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
