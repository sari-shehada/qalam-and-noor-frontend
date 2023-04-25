import 'package:kalam_noor/models/medical/taken_vaccine.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class TakenVaccinesDBHelper implements CRUDInterface<TakenVaccine> {
  String get _controllerName => 'TokenVaccineController/';
  static TakenVaccinesDBHelper get instance => TakenVaccinesDBHelper();
  @override
  Future<List<TakenVaccine>> getAll() async {
    String url = '${_controllerName}GetTokenVaccines';
    List<TakenVaccine> allTakenVaccines =
        await HttpService.getParsed<List<TakenVaccine>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return TakenVaccine.fromMap(e);
          },
        ).toList();
      },
    );
    return allTakenVaccines;
  }

  @override
  Future<TakenVaccine?> getById(int id) async {
    String url = '${_controllerName}GetTokenVaccineById?id=$id';
    TakenVaccine? city =
        await HttpService.getParsed<TakenVaccine?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return TakenVaccine.fromMap(responseData);
      },
    );
    return city;
  }

  Future<int> getTakenVaccinesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(TakenVaccine object) async {
    String url = '${_controllerName}InsertTokenVaccine';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(TakenVaccine object) async {
    String url = '${_controllerName}UpdateTokenVaccine';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
