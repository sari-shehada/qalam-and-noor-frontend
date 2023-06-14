import '../../agendas/father.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class FatherDBhelper implements CRUDInterface<Father> {
  String get _controllerName => 'FatherController/';
  static FatherDBhelper get instance => FatherDBhelper();

  @override
  Future<List<Father>> getAll() async {
    String url = '${_controllerName}GetCities';
    List<Father> allFathers = await HttpService.getParsed<List<Father>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Father.fromMap(e);
          },
        ).toList();
      },
    );
    return allFathers;
  }

  @override
  Future<Father> getById(int id) async {
    String url = '${_controllerName}GetFatherById?id=$id';
    Father father = await HttpService.getParsed<Father, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Father.fromMap(responseData);
      },
    );
    return father;
  }

  Future<int> getFathersCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<Father> insert(Father object) async {
    String url = '${_controllerName}InsertFather';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return throw Exception();
    return object.copyWith(id: result);
  }

  @override
  Future<bool> update(Father object) async {
    String url = '${_controllerName}UpdateFather';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
