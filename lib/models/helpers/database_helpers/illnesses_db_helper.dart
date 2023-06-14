import '../../medical/illness.dart';
import '../../medical/student_illness_info.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class IllnessesDBHelper implements CRUDInterface<Illness> {
  String get _controllerName => 'IlnessController/';
  static IllnessesDBHelper get instance => IllnessesDBHelper();

  @override
  Future<List<Illness>> getAll() async {
    String url = '${_controllerName}GetIlnesses';
    List<Illness> allIllnesses =
        await HttpService.getParsed<List<Illness>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Illness.fromMap(e);
          },
        ).toList();
      },
    );
    return allIllnesses;
  }

  Future<List<StudentIllnessInfo>> getAllStudentIllnesses(int studentId) async {
    String url =
        '${_controllerName}GetStudentIllnessesByStudentId?studentId=$studentId';
    List<StudentIllnessInfo> allStudentIllnesses =
        await HttpService.getParsed<List<StudentIllnessInfo>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return StudentIllnessInfo.fromMap(e);
          },
        ).toList();
      },
    );
    return allStudentIllnesses;
  }

  @override
  Future<Illness?> getById(int id) async {
    String url = '${_controllerName}GetIlnessById?id=$id';
    Illness? illness =
        await HttpService.getParsed<Illness?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Illness.fromMap(responseData);
      },
    );
    return illness;
  }

  Future<int> getCitiesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(Illness object) async {
    String url = '${_controllerName}InsertIlness';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Illness object) async {
    String url = '${_controllerName}UpdateIlness';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
