import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';

import '../../../tools/logic_tools/network_service.dart';

class MotherDBHelper implements CRUDInterface<Mother> {
  String get _controllerName => 'MotherController/';
  static MotherDBHelper get instance => MotherDBHelper();
  @override
  Future<List<Mother>> getAll() async {
    String url = '${_controllerName}GetMothers';
    List<Mother> allMothers = await HttpService.getParsed<List<Mother>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Mother.fromMap(e);
          },
        ).toList();
      },
    );
    return allMothers;
  }

  @override
  Future<Mother> getById(int id) async {
    String url = '${_controllerName}GetMotherById?id=$id';
    Mother mother = await HttpService.getParsed<Mother, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Mother.fromMap(responseData);
      },
    );
    return mother;
  }

  Future<int> getMothersCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<Mother> insert(Mother object) async {
    String url = '${_controllerName}InsertMother';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return throw Exception();
    return object.copyWith(id: result);
  }

  @override
  Future<bool> update(Mother object) async {
    String url = '${_controllerName}UpdateMother';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
