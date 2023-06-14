import '../../../tools/logic_tools/crud_interface.dart';
import '../../agendas/responsible_person.dart';
import '../../../tools/logic_tools/network_service.dart';

class ResponsiblePersonsDBHelper implements CRUDInterface<ResponsiblePerson> {
  String get _controllerName => 'ResponsiblePersonController/';
  static ResponsiblePersonsDBHelper get instance =>
      ResponsiblePersonsDBHelper();
  @override
  Future<List<ResponsiblePerson>> getAll() async {
    String url = '${_controllerName}GetResponsiblePersons';
    List<ResponsiblePerson> allResponsiblePersons =
        await HttpService.getParsed<List<ResponsiblePerson>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return ResponsiblePerson.fromMap(e);
          },
        ).toList();
      },
    );
    return allResponsiblePersons;
  }

  @override
  Future<ResponsiblePerson?> getById(int id) async {
    String url = '${_controllerName}GetResponsiblePersonById?id=$id';
    ResponsiblePerson? responsiblePerson =
        await HttpService.getParsed<ResponsiblePerson?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return ResponsiblePerson.fromMap(responseData);
      },
    );
    return responsiblePerson;
  }

  Future<int> getResponsiblePeopleCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<ResponsiblePerson> insert(ResponsiblePerson object) async {
    String url = '${_controllerName}InsertResponsiblePerson';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return throw Exception();
    return object.copyWith(id: result);
  }

  @override
  Future<bool> update(ResponsiblePerson object) async {
    String url = '${_controllerName}UpdateResponsiblePerson';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
