import '../../address/area.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class AreasDBHelper implements CRUDInterface<Area> {
  String get _controllerName => 'AreaController/';
  static AreasDBHelper get instance => AreasDBHelper();

  @override
  Future<List<Area>> getAll() async {
    String url = '${_controllerName}GetAreas';
    List<Area> allAreas = await HttpService.getParsed<List<Area>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Area.fromMap(e);
          },
        ).toList();
      },
    );
    return allAreas;
  }

  Future<List<Area>> getAllByCityId({required int cityId}) async {
    String url = '${_controllerName}GetAreasByCityId?cityId=$cityId';
    List<Area> allAreas = await HttpService.getParsed<List<Area>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Area.fromMap(e);
          },
        ).toList();
      },
    );
    return allAreas;
  }

  @override
  Future<Area?> getById(int id) async {
    String url = '${_controllerName}GetAreaById?id=$id';
    Area? area = await HttpService.getParsed<Area?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Area.fromMap(responseData);
      },
    );
    return area;
  }

  Future<int> getAreasCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(Area object) async {
    String url = '${_controllerName}InsertArea';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Area object) async {
    String url = '${_controllerName}UpdateArea';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
