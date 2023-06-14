import '../../public_record.dart';
import '../../../tools/logic_tools/network_service.dart';

class PublicRecordsDBHelper {
  String get _controllerName => 'PublicRecordViewController/';
  static PublicRecordsDBHelper get instance => PublicRecordsDBHelper();

  Future<List<PublicRecord>> getAll() async {
    String url = '${_controllerName}GetPublicRecordViews';
    List<PublicRecord> allCities =
        await HttpService.getParsed<List<PublicRecord>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return PublicRecord.fromMap(e);
          },
        ).toList();
      },
    );
    return allCities;
  }

  Future<List<PublicRecord>> getByClassId(int classId) async {
    String url = '${_controllerName}GetPublicRecordViewsByClassId?cls=$classId';
    List<PublicRecord> allCities =
        await HttpService.getParsed<List<PublicRecord>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return PublicRecord.fromMap(e);
          },
        ).toList();
      },
    );
    return allCities;
  }
}
