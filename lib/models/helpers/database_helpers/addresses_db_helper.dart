import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import 'package:kalam_noor/tools/logic_tools/network_service.dart';

class AddressesDBHelper implements CRUDInterface<Address> {
  String get _controllerName => 'AddressController/';
  static AddressesDBHelper get instance => AddressesDBHelper();

  @override
  Future<List<Address>> getAll() async {
    String url = '${_controllerName}GetAddresses';
    List<Address> allAreas = await HttpService.getParsed<List<Address>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Address.fromMap(e);
          },
        ).toList();
      },
    );
    return allAreas;
  }

  Future<List<Address>> getAllByAreaId({required int areaId}) async {
    String url = '${_controllerName}GetAddressesByAreaId?areaId=$areaId';
    List<Address> allAddresses =
        await HttpService.getParsed<List<Address>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Address.fromMap(e);
          },
        ).toList();
      },
    );
    return allAddresses;
  }

  @override
  Future<Address?> getById(int id) async {
    String url = '${_controllerName}GetAddressById?id=$id';
    Address? address =
        await HttpService.getParsed<Address?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Address.fromMap(responseData);
      },
    );
    return address;
  }

  Future<int> getAddressesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(Address object) async {
    String url = '${_controllerName}InsertAddress';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(Address object) async {
    String url = '${_controllerName}UpdateAddress';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
