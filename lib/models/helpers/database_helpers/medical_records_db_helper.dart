import 'package:kalam_noor/models/medical/medical_record.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class MedicalRecordsDBHelper implements CRUDInterface<MedicalRecord> {
  String get _controllerName => 'MedicalRecordController/';
  static MedicalRecordsDBHelper get instance => MedicalRecordsDBHelper();

  @override
  Future<List<MedicalRecord>> getAll() async {
    String url = '${_controllerName}GetMedicalRecords';
    List<MedicalRecord> allMedicalRecords =
        await HttpService.getParsed<List<MedicalRecord>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return MedicalRecord.fromMap(e);
          },
        ).toList();
      },
    );
    return allMedicalRecords;
  }

  @override
  Future<MedicalRecord> getById(int id) async {
    String url = '${_controllerName}GetMedicalRecordById?id=$id';
    MedicalRecord medicalRecord =
        await HttpService.getParsed<MedicalRecord, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return MedicalRecord.fromMap(responseData);
      },
    );
    return medicalRecord;
  }

  Future<int> getMedicalRecordsCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<MedicalRecord> insert(MedicalRecord object) async {
    String url = '${_controllerName}InsertMedicalRecord';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) throw Exception();
    return object.copyWith(studentId: result);
  }

  @override
  Future<bool> update(MedicalRecord object) async {
    String url = '${_controllerName}UpdateMedicalRecord';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
