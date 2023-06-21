import 'dart:convert';

import '../../educational/classroom.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class ClassroomDBHelper implements CRUDInterface<Classroom> {
  String get _controllerName => 'ClassroomController/';
  static ClassroomDBHelper get instance => ClassroomDBHelper();

  @override
  Future<List<Classroom>> getAll() async {
    String url = '${_controllerName}GetClassRooms';
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

  Future<List<Classroom>> getAllAvailableClassroomsByClassId(
      int classId) async {
    String url =
        '${_controllerName}GetAvailableClassRoomsByClassId?classId=$classId';
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

  Future<List<Classroom>> getAlreadyOpenClassroomsByClassId(int classId) async {
    String url =
        '${_controllerName}GetAlreadyOpenClassRoomsByClassId?classId=$classId';
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

  Future<List<Classroom>> getAllClassroomsByClassId(int classId) async {
    String url = '${_controllerName}GetClassRoomsByClassId?classId=$classId';
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
    String url = '${_controllerName}GetClassRoomById?id=$id';
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

  Future<int> getCurrentSchoolYearClassroomsCount() async {
    String url = '${_controllerName}GetClassRoomsCountInCurrentSchoolYear';
    var response = await HttpService.getUnparsed(
      url,
    );
    int count = jsonDecode(response.body) as int;
    return count;
  }

  @override
  Future<bool> insert(Classroom object) async {
    String url = '${_controllerName}InsertClassRoom';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Classroom object) async {
    String url = '${_controllerName}UpdateClassRoom';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
