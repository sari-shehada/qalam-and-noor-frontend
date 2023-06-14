import 'dart:convert';

import '../../educational/school_year.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class SchoolYearsDBHelper implements CRUDInterface<SchoolYear> {
  String get _controllerName => 'SchoolYearController/';
  static SchoolYearsDBHelper get instance => SchoolYearsDBHelper();

  @override
  Future<List<SchoolYear>> getAll() async {
    String url = '${_controllerName}GetSchoolYears';
    List<SchoolYear> allSchoolYears =
        await HttpService.getParsed<List<SchoolYear>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return SchoolYear.fromMap(e);
          },
        ).toList();
      },
    );
    return allSchoolYears;
  }

  @override
  Future<SchoolYear?> getById(int id) async {
    String url = '${_controllerName}GetSchoolYearById?id=$id';
    SchoolYear? schoolYear =
        await HttpService.getParsed<SchoolYear?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return SchoolYear.fromMap(responseData);
      },
    );
    return schoolYear;
  }

  Future<int> getSchoolYearsCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<SchoolYear> insert(SchoolYear object) async {
    String url = '${_controllerName}InsertSchoolYear';
    String? result = await HttpService.rawPost(
      url: url,
      serializedBody: object.toJson(),
    );
    if (result == null) throw Exception('Couldn\'t add school year');
    Map<String, dynamic> formattedResult = jsonDecode(result);
    int id = formattedResult['schoolYearId'] as int;
    if (id == 0) {
      throw PreviousSchoolYearNotFinishedException();
    }
    return object.copyWith(
      id: id,
    );
  }

  Future<SchoolYear> getCurrentSchoolYear() async {
    String url = '${_controllerName}GetCurrentSchoolYear';
    SchoolYear? schoolYear =
        await HttpService.getParsed<SchoolYear, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return SchoolYear.fromMap(responseData);
      },
    );
    return schoolYear;
  }

  @override
  Future<bool> update(SchoolYear object) async {
    String url = '${_controllerName}UpdateSchoolYear';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}

class PreviousSchoolYearNotFinishedException implements Exception {
  PreviousSchoolYearNotFinishedException({
    this.message = 'يرجى انهاء العام الدراسي السابق قبل بدء عام جديد',
  });
  final String message;
}
