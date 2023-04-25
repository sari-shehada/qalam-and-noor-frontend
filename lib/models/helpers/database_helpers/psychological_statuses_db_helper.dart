import 'package:kalam_noor/models/medical/psychological_status.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class PsychologicalStatusesDBHelper
    implements CRUDInterface<PsychologicalStatus> {
  static String get _controllerName => 'PsychologicalStatusController/';
  static PsychologicalStatusesDBHelper get instance =>
      PsychologicalStatusesDBHelper();
  @override
  Future<List<PsychologicalStatus>> getAll() async {
    String url = '${_controllerName}GetPsychologicalStatusess';
    List<PsychologicalStatus> allPsychologicalStatuses =
        await HttpService.getParsed<List<PsychologicalStatus>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return PsychologicalStatus.fromMap(e);
          },
        ).toList();
      },
    );
    return allPsychologicalStatuses;
  }

  @override
  Future<PsychologicalStatus?> getById(int id) async {
    String url = '${_controllerName}GetPsychologicalStatusById?id=$id';
    PsychologicalStatus? psychologicalStatus =
        await HttpService.getParsed<PsychologicalStatus?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return PsychologicalStatus.fromMap(responseData);
      },
    );
    return psychologicalStatus;
  }

  Future<int> getPsychologicalStatusCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(PsychologicalStatus object) async {
    String url = '${_controllerName}InsertPsychologicalStatus';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(PsychologicalStatus object) async {
    String url = '${_controllerName}UpdatePsychologicalStatus';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
