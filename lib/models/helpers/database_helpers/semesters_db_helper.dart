import 'package:kalam_noor/models/educational/semester.dart';

import '../../../pages/secretary/school_year_management/current_school_year_management_page/end_current_seemster_dialog/models/end_semester_request_result_model.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class SemestersDBHelper implements CRUDInterface<Semester> {
  String get _controllerName => 'SemesterController/';
  static SemestersDBHelper get instance => SemestersDBHelper();

  @override
  Future<List<Semester>> getAll() async {
    String url = '${_controllerName}GetSemesters';
    List<Semester> allSemesters =
        await HttpService.getParsed<List<Semester>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Semester.fromMap(e);
          },
        ).toList();
      },
    );
    return allSemesters;
  }

  @override
  Future<Semester> getById(int id) async {
    String url = '${_controllerName}GetSemesterById?id=$id';
    Semester semester =
        await HttpService.getParsed<Semester, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Semester.fromMap(responseData);
      },
    );
    return semester;
  }

  Future<List<Semester>> getSemestersInSchoolYear(int schoolYearId) async {
    String url =
        '${_controllerName}GetSemestersBySchoolYearId?schoolYearId=$schoolYearId';
    List<Semester> semesters =
        await HttpService.getParsed<List<Semester>, List>(
      url: url,
      dataMapper: (responseData) {
        return responseData
            .map(
              (e) => Semester.fromMap(e as Map<String, dynamic>),
            )
            .toList();
      },
    );
    return semesters;
  }

  Future<EndSemesterRequestResultModel> finishCurrentSemester() async {
    String url = '${_controllerName}FinishedCurrentSemester';
    EndSemesterRequestResultModel semester = await HttpService.getParsed<
        EndSemesterRequestResultModel, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return EndSemesterRequestResultModel.fromMap(responseData);
      },
    );
    return semester;
  }

  @override
  Future<Semester> insert(Semester object) async {
    String url = '${_controllerName}InsertSemester';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) throw Exception('Couldn\'t add semester');
    return object.copyWith(id: result);
  }

  @override
  Future<bool> update(Semester object) async {
    String url = '${_controllerName}UpdateSemester';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
