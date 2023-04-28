import 'package:kalam_noor/models/educational/school_year_classroom.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class SchoolYearClassroomsDBHelper
    implements CRUDInterface<SchoolYearClassroom> {
  String get _controllerName => 'SchoolYearClassroomController/';
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
