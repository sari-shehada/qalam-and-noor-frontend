import 'package:kalam_noor/models/educational/Semester_year_record.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';

import '../../../tools/logic_tools/network_service.dart';

class SemesterYearRecordDBHelper implements CRUDInterface<SemesterYearRecord> {
  String get _controllerName => 'SemesterYearRecordController/';
  static SemesterYearRecordDBHelper get instance =>
      SemesterYearRecordDBHelper();

  @override
  Future<List<SemesterYearRecord>> getAll() async {
    String url = '${_controllerName}GetSemesterYearRecords';
    List<SemesterYearRecord> allSemesterYearRecord =
        await HttpService.getParsed<List<SemesterYearRecord>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return SemesterYearRecord.fromMap(e);
          },
        ).toList();
      },
    );
    return allSemesterYearRecord;
  }

  @override
  Future<SemesterYearRecord?> getById(int id) async {
    throw UnimplementedError();
    // String url = '${_controllerName}GetAreaById?id=$id';
    // SemesterYearRecord? semesterYearRecord = await HttpService.getParsed<SemesterYearRecord?, Map<String, dynamic>>(
    //   url: url,
    //   dataMapper: (responseData) {
    //     return SemesterYearRecord.fromMap(responseData);
    //   },
    // );
    // return semesterYearRecord;
  }

  @override
  Future<bool> insert(SemesterYearRecord object) async {
    String url = '${_controllerName}InsertSemesterYearRecord';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(SemesterYearRecord object) async {
    String url = '${_controllerName}UpdateSemesterYearRecord';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
