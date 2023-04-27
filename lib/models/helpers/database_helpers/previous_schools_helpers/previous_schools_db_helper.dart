import 'package:kalam_noor/models/previous_schools/previous_schools.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';

import '../../../../tools/logic_tools/network_service.dart';

class PreviousSchoolsDBHelper implements CRUDInterface<PreviousSchool> {
  String get _controllerName => 'PreviousSchoolController/';
  static PreviousSchoolsDBHelper get instance => PreviousSchoolsDBHelper();

  @override
  Future<List<PreviousSchool>> getAll() async {
    String url = '${_controllerName}GetPreviousSchools';
    List<PreviousSchool> allPreviousSchools =
        await HttpService.getParsed<List<PreviousSchool>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return PreviousSchool.fromMap(e);
          },
        ).toList();
      },
    );
    return allPreviousSchools;
  }

  @override
  Future<PreviousSchool?> getById(int id) async {
    String url = '${_controllerName}GetPreviousSchoolById?id=$id';
    PreviousSchool? previousSchool =
        await HttpService.getParsed<PreviousSchool?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return PreviousSchool.fromMap(responseData);
      },
    );
    return previousSchool;
  }

  @override
  Future<PreviousSchool> insert(PreviousSchool object) async {
    String url = '${_controllerName}InsertPreviousSchool';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return throw Exception();
    return object.copyWith(id: result);
  }

  @override
  Future<bool> update(PreviousSchool object) async {
    String url = '${_controllerName}UpdatePreviousSchool';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
