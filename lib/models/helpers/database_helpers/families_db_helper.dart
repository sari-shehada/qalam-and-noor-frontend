import 'package:kalam_noor/models/agendas/student.dart';

import '../../agendas/family.dart';

import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class FamiliesDBHelper implements CRUDInterface<Family> {
  String get _controllerName => 'FamilyController/';
  static FamiliesDBHelper get instance => FamiliesDBHelper();

  @override
  Future<List<Family>> getAll() async {
    String url = '${_controllerName}GetFamilies';
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

  Future<List<Family>> getByFatherTieNumber({required String tieNumber}) async {
    String url =
        '${_controllerName}GetFamiliesByFatherTieNumber?tieNumber=$tieNumber';
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
  Future<Family> getById(int id) async {
    String url = '${_controllerName}GetFamilyById?id=$id';
    Family family = await HttpService.getParsed<Family, Map<String, dynamic>>(
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
    String url = '${_controllerName}InsertFamily';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) throw Exception();
    return object.copyWith(id: result);
  }

  @override
  Future<bool> update(Family object) async {
    String url = '${_controllerName}UpdateFamily';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  Future<List<Student>> getStudentSiblingsByFamilyId(
      {required int familyId, int? currentStudentId}) async {
    String url = 'StudentController/GetStudentsByFamilyId?familyId=$familyId';
    List<Student> allFamilies =
        await HttpService.getParsed<List<Student>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData
            .map(
              (e) {
                return Student.fromMap(e);
              },
            )
            .where(
              (element) => currentStudentId == null
                  ? true
                  : currentStudentId != currentStudentId,
            )
            .toList();
      },
    );
    return allFamilies;
  }
}
