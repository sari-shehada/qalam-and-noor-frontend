import '../../educational/year_record.dart';
import '../../../tools/logic_tools/crud_interface.dart';

import '../../../tools/logic_tools/network_service.dart';

class YearRecordsDBHelper implements CRUDInterface<YearRecord> {
  String get _controllerName => 'YearRecordController/';
  static YearRecordsDBHelper get instance => YearRecordsDBHelper();

  @override
  Future<List<YearRecord>> getAll() async {
    String url = '${_controllerName}GetYearRecords';
    List<YearRecord> allYearRecords =
        await HttpService.getParsed<List<YearRecord>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return YearRecord.fromMap(e);
          },
        ).toList();
      },
    );
    return allYearRecords;
  }

  @override
  Future<YearRecord?> getById(int id) async {
    String url = '${_controllerName}GetYearRecordById?id=$id';
    YearRecord? yearRecord =
        await HttpService.getParsed<YearRecord?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return YearRecord.fromMap(responseData);
      },
    );
    return yearRecord;
  }

  Future<int> getYearRecordsCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(YearRecord object) async {
    String url = '${_controllerName}InsertYearRecord';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(YearRecord object) async {
    String url = '${_controllerName}UpdateYearRecord';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
