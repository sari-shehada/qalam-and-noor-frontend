import '../../../pages/secretary/students_management_page/student_profile/models/student_vaccines_info.dart';
import '../../medical/vaccine.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class VaccinesDBHelper implements CRUDInterface<Vaccine> {
  String get _controllerName => 'VaccineController/';
  static VaccinesDBHelper get instance => VaccinesDBHelper();

  @override
  Future<List<Vaccine>> getAll() async {
    String url = '${_controllerName}GetVaccines';
    List<Vaccine> allVaccines =
        await HttpService.getParsed<List<Vaccine>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Vaccine.fromMap(e);
          },
        ).toList();
      },
    );
    return allVaccines;
  }

  Future<List<StudentVaccineInfo>> getAllStudentTakenVaccines(
      int studentId) async {
    String url =
        '${_controllerName}GetStudentTakenVaccinesByStudentId?studentId=$studentId';
    List<StudentVaccineInfo> allTakenVaccines =
        await HttpService.getParsed<List<StudentVaccineInfo>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return StudentVaccineInfo.fromMap(e);
          },
        ).toList();
      },
    );
    return allTakenVaccines;
  }

  @override
  Future<Vaccine?> getById(int id) async {
    String url = '${_controllerName}GetVaccineById?id=$id';
    Vaccine? vaccine =
        await HttpService.getParsed<Vaccine?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Vaccine.fromMap(responseData);
      },
    );
    return vaccine;
  }

  Future<int> getVaccinesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(Vaccine object) async {
    String url = '${_controllerName}InsertVaccine';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Vaccine object) async {
    String url = '${_controllerName}UpdateVaccine';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
