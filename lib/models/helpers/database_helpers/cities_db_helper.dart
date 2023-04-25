import 'package:kalam_noor/models/address/city.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import 'package:kalam_noor/tools/logic_tools/network_service.dart';

class CitiesDBHelper implements CRUDInterface<City> {
  String get _controllerName => 'CityController/';
  static CitiesDBHelper get instance => CitiesDBHelper();

  @override
  Future<List<City>> getAll() async {
    String url = '${_controllerName}GetCities';
    List<City> allCities = await HttpService.getParsed<List<City>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return City.fromMap(e);
          },
        ).toList();
      },
    );
    return allCities;
  }

  @override
  Future<City?> getById(int id) async {
    String url = '${_controllerName}GetCityById?id=$id';
    City? city = await HttpService.getParsed<City?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return City.fromMap(responseData);
      },
    );
    return city;
  }

  Future<int> getCitiesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(City object) async {
    String url = '${_controllerName}InsertCity';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(City object) async {
    String url = '${_controllerName}UpdateCity';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
