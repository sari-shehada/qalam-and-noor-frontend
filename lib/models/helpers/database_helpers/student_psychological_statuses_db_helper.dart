import '../../medical/student_psychological_status.dart';
import '../../../tools/logic_tools/crud_interface.dart';

import '../../../tools/logic_tools/network_service.dart';

class StudentPsychologicalStatusesDBHelper
    implements CRUDInterface<StudentPsychologicalStatus> {
  String get _controllerName => 'PsychologicalStatusMedicalRecordController/';
  static StudentPsychologicalStatusesDBHelper get instance =>
      StudentPsychologicalStatusesDBHelper();

  @override
  Future<List<StudentPsychologicalStatus>> getAll() async {
    String url = '${_controllerName}GetPsychologicalStatusMedicalRecords';
    List<StudentPsychologicalStatus> allPsychologicalStatusesMedicalRecords =
        await HttpService.getParsed<List<StudentPsychologicalStatus>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return StudentPsychologicalStatus.fromMap(e);
          },
        ).toList();
      },
    );
    return allPsychologicalStatusesMedicalRecords;
  }

  Future<List<StudentPsychologicalStatus>> getAllByMedicalRecordId(
      int id) async {
    String url =
        '${_controllerName}GetPsychologicalStatusMedicalRecordsByMedicalRecordId?medicalRecordId=$id';
    List<StudentPsychologicalStatus> allStudentPsychologicalStatuses =
        await HttpService.getParsed<List<StudentPsychologicalStatus>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return StudentPsychologicalStatus.fromMap(e);
          },
        ).toList();
      },
    );
    return allStudentPsychologicalStatuses;
  }

  @override
  Future<StudentPsychologicalStatus?> getById(int id) async {
    String url =
        '${_controllerName}GetPsychologicalStatusMedicalRecordById?id=$id';
    StudentPsychologicalStatus? psychologicalStatusMedicalRecord =
        await HttpService.getParsed<StudentPsychologicalStatus?,
            Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return StudentPsychologicalStatus.fromMap(responseData);
      },
    );
    return psychologicalStatusMedicalRecord;
  }

  Future<int> getCountPsychologicalStatusMedicalRecords() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(StudentPsychologicalStatus object) async {
    String url = '${_controllerName}InsertPsychologicalStatusMedicalRecord';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(StudentPsychologicalStatus object) async {
    String url = '${_controllerName}UpdatePsychologicalStatusMedicalRecord';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
