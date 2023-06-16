import '../../educational/exam.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class ExamsDBHelper implements CRUDInterface<Exam> {
  String get _controllerName => 'ExamController/';
  static ExamsDBHelper get instance => ExamsDBHelper();

  @override
  Future<List<Exam>> getAll() async {
    String url = '${_controllerName}GetExams';
    List<Exam> allExams = await HttpService.getParsed<List<Exam>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Exam.fromMap(e);
          },
        ).toList();
      },
    );
    return allExams;
  }

  Future<List<Exam>> getExamsByClassId(int id) async {
    String url = '${_controllerName}GetExamsByClassId?classId=$id';
    List<Exam> allExams = await HttpService.getParsed<List<Exam>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Exam.fromMap(e);
          },
        ).toList();
      },
    );
    return allExams;
  }

  @override
  Future<Exam?> getById(int id) async {
    String url = '${_controllerName}GetExamById?id=$id';
    Exam? exam = await HttpService.getParsed<Exam?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Exam.fromMap(responseData);
      },
    );
    return exam;
  }

  Future<int> getExamsCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(Exam object) async {
    String url = '${_controllerName}InsertExam';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Exam object) async {
    String url = '${_controllerName}UpdateExam';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
