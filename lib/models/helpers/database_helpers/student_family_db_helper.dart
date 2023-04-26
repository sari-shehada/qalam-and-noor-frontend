import 'package:kalam_noor/models/agendas/families.dart';

import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class StudentFamilyDBHelper implements CRUDInterface<Family> {
  String get _controllerName => 'FamilyController/';
  static StudentFamilyDBHelper get instance => StudentFamilyDBHelper();

  @override
  Future<List<Family>> getAll() async {
    String url = '${_controllerName}GetStudentFamilies';
    List<Family> allFamilies = await HttpService.getParsed<List<Family>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Family.fromMap(e);
          },
        ).toList();
      },
    );
    return allFamilies;
  }

  @override
  Future<Family?> getById(int id) async {
    String url = '${_controllerName}GetStudentFamilyById?id=$id';
    Family? family = await HttpService.getParsed<Family?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Family.fromMap(responseData);
      },
    );
    return family;
  }

  Future<int> getFamiliesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<Family> insert(Family object) async {
    String url = '${_controllerName}InsertStudentFamily';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) throw Exception();
    return object.copyWith(id: result);
  }

  @override
  Future<bool> update(Family object) async {
    String url = '${_controllerName}UpdateStudentFamily';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
