import 'dart:convert';

import 'package:kalam_noor/models/item_or.dart';

import '../../educational/classroom.dart';
import '../../educational/school_year_classroom.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class SchoolYearClassroomsDBHelper
    implements CRUDInterface<SchoolYearClassroom> {
  String get _controllerName => 'ClassRoomSchoolYearController/';
  static SchoolYearClassroomsDBHelper get instance =>
      SchoolYearClassroomsDBHelper();

  @override
  Future<List<SchoolYearClassroom>> getAll() async {
    String url = '${_controllerName}GetSchoolYearClassrooms';
    List<SchoolYearClassroom> allSchoolYearClassrooms =
        await HttpService.getParsed<List<SchoolYearClassroom>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return SchoolYearClassroom.fromMap(e);
          },
        ).toList();
      },
    );
    return allSchoolYearClassrooms;
  }

  Future<List<SchoolYearClassroom>> getAllBySchoolYearId(int id) async {
    String url =
        '${_controllerName}GetClassRoomSchoolYearsBySchoolYearId?schoolYearId=$id';
    List<SchoolYearClassroom> schoolYearClassroom =
        await HttpService.getParsed<List<SchoolYearClassroom>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return SchoolYearClassroom.fromMap(e);
          },
        ).toList();
      },
    );
    return schoolYearClassroom;
  }

  Future<bool> openClassroomsInSchoolYear(List<Classroom> classrooms) async {
    String url = '${_controllerName}OpenClassRoomsInSchoolYear';
    String result = await HttpService.rawPost(
      url: url,
      serializedBody: jsonEncode(
        classrooms.map((e) => e.id).toList(),
      ),
    );
    bool formattedResult = jsonDecode(result) as bool;
    if (formattedResult == false) {
      throw OpenClassRoomFailException();
    }
    return formattedResult;
  }

  Future<bool> closeClassroomsInSchoolYear(List<Classroom> classrooms) async {
    for (Classroom element in classrooms) {
      String url =
          '${_controllerName}CloseClassRoomInSchoolYearByClassRoomId?classRoomId=${element.id}';
      ItemOr<String> formattedResult =
          await HttpService.getParsed<ItemOr<String>, Map<String, dynamic>>(
        url: url,
        dataMapper: (responseData) {
          return ItemOr<String>.fromMap(responseData);
        },
      );
      // return schoolYearClassroom;
      // String result = await HttpService.rawPost(
      //   url: url,
      //   serializedBody: jsonEncode(
      //     classrooms.map((e) => e.id).toList(),
      //   ),
      // );
      // ItemOr<String> formattedResult = jsonEncode(result) as ItemOr<String>;
      if (formattedResult.success == false) {
        throw CloseClassRoomFailException(
          message:
              'فشلت عملية إغلاق الشعبة ذات الاسم: \"${element.name}\" وذلك بسبب وجود طلاب مسجلين فيها',
        );
      }
    }
    return true;
  }

  @override
  Future<SchoolYearClassroom?> getById(int id) async {
    String url = '${_controllerName}GetSchoolYearClassroomById?id=$id';
    SchoolYearClassroom? schoolYearClassroom =
        await HttpService.getParsed<SchoolYearClassroom?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return SchoolYearClassroom.fromMap(responseData);
      },
    );
    return schoolYearClassroom;
  }

  Future<int> getSchoolYearClassroomsCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(SchoolYearClassroom object) async {
    String url = '${_controllerName}InsertSchoolYearClassroom';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(SchoolYearClassroom object) async {
    String url = '${_controllerName}UpdateSchoolYearClassroom';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}

class OpenClassRoomFailException implements Exception {
  OpenClassRoomFailException({
    this.message = 'بعض الشعب لم يتم فتحها، يرجى مراجعة القائمة الجديدة',
  });
  final String message;
}

class CloseClassRoomFailException implements Exception {
  CloseClassRoomFailException({
    required this.message,
  });
  final String message;
}
