import 'employee_auth_model.dart';

import '../../../../tools/logic_tools/network_service.dart';
import 'employee_auth_exceptions.dart';

class EmployeeAuthDBHelper {
  String get _controllerName => 'EmployeeAuthenticationController/';
  static EmployeeAuthDBHelper get instance => EmployeeAuthDBHelper();
  Future<EmployeeAuthModel> login({
    required String userName,
    required String password,
  }) async {
    String url =
        '${_controllerName}Login?userName=$userName&password=$password';
    EmployeeAuthModel? result =
        await HttpService.getParsed<EmployeeAuthModel?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return EmployeeAuthModel.fromMap(responseData);
      },
    );
    if (result == null) {
      throw NoResultReturnedException();
    }
    if (result.success == false) {
      throw InvalidCredentialsException(message: result.message);
    }
    if (result.employee == null || result.jobTitle == null) {
      throw NullObjectsOnSuccessLoginException();
    }
    return result;
  }
}
