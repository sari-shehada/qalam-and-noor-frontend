import '../../medical/student_illness.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class StudentIllnessesDBHelper implements CRUDInterface<StudentIllness> {
  String get _controllerName => 'IlnessMedicalRecordController/';
  static StudentIllnessesDBHelper get instance => StudentIllnessesDBHelper();

  @override
  Future<List<StudentIllness>> getAll() async {
    String url = '${_controllerName}IlnessMedicalRecordGet';
    List<StudentIllness> allStudentIllnesses =
        await HttpService.getParsed<List<StudentIllness>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return StudentIllness.fromMap(e);
          },
        ).toList();
      },
    );
    return allStudentIllnesses;
  }

  @override
  Future<StudentIllness?> getById(int id) async {
    String url = '${_controllerName}GetIlnessMedicalRecord?id=$id';
    StudentIllness? city =
        await HttpService.getParsed<StudentIllness?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return StudentIllness.fromMap(responseData);
      },
    );
    return city;
  }

  Future<int> getCitiesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(StudentIllness object) async {
    String url = '${_controllerName}InsertIlnessMedicalRecords';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(StudentIllness object) async {
    String url = '${_controllerName}UpdateIlnessMedicalRecord';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
