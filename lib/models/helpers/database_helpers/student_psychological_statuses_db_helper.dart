import 'package:kalam_noor/models/medical/student_psychological_status.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';

import '../../../tools/logic_tools/network_service.dart';

class StudentPsychologicalStatusesDBHelper
    implements CRUDInterface<StudentPsychologicalStatus> {
  String get _controllerName => 'PsychologicalStatusesMedicalRecordController/';
  static StudentPsychologicalStatusesDBHelper get instance =>
      StudentPsychologicalStatusesDBHelper();

  @override
  Future<List<StudentPsychologicalStatus>> getAll() async {
    String url = '${_controllerName}GetPsychologicalStatusesMedicalRecords';
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
        '${_controllerName}GetPsychologicalStatusesMedicalRecordById?id=$id';
    StudentPsychologicalStatus? city = await HttpService.getParsed<
        StudentPsychologicalStatus?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return StudentPsychologicalStatus.fromMap(responseData);
      },
    );
    return city;
  }

  Future<int> getCitiesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(StudentPsychologicalStatus object) async {
    String url = '${_controllerName}InsertPsychologicalStatusesMedicalRecord';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(StudentPsychologicalStatus object) async {
    String url = '${_controllerName}UpdatePsychologicalStatusesMedicalRecord';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
