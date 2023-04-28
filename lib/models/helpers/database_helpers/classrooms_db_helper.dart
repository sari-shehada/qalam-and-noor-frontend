import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class ClassroomDBHelper implements CRUDInterface<Classroom> {
  String get _controllerName => 'ClassroomController/';
  static ClassroomDBHelper get instance => ClassroomDBHelper();

  @override
  Future<List<Classroom>> getAll() async {
    String url = '${_controllerName}GetClassrooms';
    List<Classroom> allClassrooms =
        await HttpService.getParsed<List<Classroom>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Classroom.fromMap(e);
          },
        ).toList();
      },
    );
    return allClassrooms;
  }

  @override
  Future<Classroom?> getById(int id) async {
    String url = '${_controllerName}GetClassroomById?id=$id';
    Classroom? classroom =
        await HttpService.getParsed<Classroom?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Classroom.fromMap(responseData);
      },
    );
    return classroom;
  }

  Future<int> getClassroomsCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(Classroom object) async {
    String url = '${_controllerName}InsertClassroom';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Classroom object) async {
    String url = '${_controllerName}UpdateClassroom';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
