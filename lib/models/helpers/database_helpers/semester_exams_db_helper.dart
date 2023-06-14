import '../../educational/semester_exam.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class SemesterExamsDBHelper implements CRUDInterface<SemesterExam> {
  String get _controllerName => 'SemesterExamController/';
  static SemesterExamsDBHelper get instance => SemesterExamsDBHelper();

  @override
  Future<List<SemesterExam>> getAll() async {
    String url = '${_controllerName}GetSemesterExams';
    List<SemesterExam> allSemesterExams =
        await HttpService.getParsed<List<SemesterExam>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return SemesterExam.fromMap(e);
          },
        ).toList();
      },
    );
    return allSemesterExams;
  }

  @override
  Future<SemesterExam?> getById(int id) async {
    String url = '${_controllerName}GetSemesterExamById?id=$id';
    SemesterExam? semesterExam =
        await HttpService.getParsed<SemesterExam?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return SemesterExam.fromMap(responseData);
      },
    );
    return semesterExam;
  }

  Future<int> getSemesterExamsCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(SemesterExam object) async {
    String url = '${_controllerName}InsertSemesterExam';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(SemesterExam object) async {
    String url = '${_controllerName}UpdateSemesterExam';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
