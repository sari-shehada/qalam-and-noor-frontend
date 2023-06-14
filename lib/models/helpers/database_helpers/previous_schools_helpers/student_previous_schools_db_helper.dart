import '../../../previous_schools/student_previous_school.dart';
import '../../../../tools/logic_tools/crud_interface.dart';
import '../../../../tools/logic_tools/network_service.dart';

class StudentPreviousSchoolDBHelper
    implements CRUDInterface<StudentPreviousSchool> {
  String get _controllerName => 'StudentPreviousSchoolController/';
  static StudentPreviousSchoolDBHelper get instance =>
      StudentPreviousSchoolDBHelper();

  @override
  Future<List<StudentPreviousSchool>> getAll() async {
    String url = '${_controllerName}GetStudentPreviousSchools';
    List<StudentPreviousSchool> allStudentPreviousSchools =
        await HttpService.getParsed<List<StudentPreviousSchool>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return StudentPreviousSchool.fromMap(e);
          },
        ).toList();
      },
    );
    return allStudentPreviousSchools;
  }

  @override
  Future<StudentPreviousSchool?> getById(int id) async {
    String url = '${_controllerName}GetStudentPreviousSchoolById?id=$id';
    StudentPreviousSchool? studentPreviousSchool = await HttpService.getParsed<
        StudentPreviousSchool?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return StudentPreviousSchool.fromMap(responseData);
      },
    );
    return studentPreviousSchool;
  }

  Future<int> getStudentPreviousSchoolsCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(StudentPreviousSchool object) async {
    String url = '${_controllerName}InsertStudentPreviousSchool';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(StudentPreviousSchool object) async {
    String url = '${_controllerName}UpdateStudentPreviousSchool';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
