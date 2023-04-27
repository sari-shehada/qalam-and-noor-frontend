import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';

import '../../../../tools/logic_tools/network_service.dart';
import '../../educational/school_class.dart';

class SchoolClassesDBHelper implements CRUDInterface<SchoolClass> {
  String get _controllerName => 'ClassController/';
  static SchoolClassesDBHelper get instance => SchoolClassesDBHelper();

  @override
  Future<List<SchoolClass>> getAll() async {
    String url = '${_controllerName}GetClasses';
    List<SchoolClass> allClasses =
        await HttpService.getParsed<List<SchoolClass>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return SchoolClass.fromMap(e);
          },
        ).toList();
      },
    );
    return allClasses;
  }

  @override
  Future<SchoolClass?> getById(int id) async {
    String url = '${_controllerName}GetClassById?id=$id';
    SchoolClass? schoolClass =
        await HttpService.getParsed<SchoolClass?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return SchoolClass.fromMap(responseData);
      },
    );
    return schoolClass;
  }

  @override
  Future<SchoolClass> insert(SchoolClass object) async {
    String url = '${_controllerName}InsertClass';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return throw Exception();
    return object.copyWith(id: result);
  }

  @override
  Future<bool> update(SchoolClass object) async {
    String url = '${_controllerName}UpdateClass';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
