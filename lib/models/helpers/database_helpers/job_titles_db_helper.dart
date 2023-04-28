import 'package:kalam_noor/models/agendas/job_title.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class JobTitlesDBHelper implements CRUDInterface<JobTitle> {
  String get _controllerName => 'JobTitleController/';
  static JobTitlesDBHelper get instance => JobTitlesDBHelper();

  @override
  Future<List<JobTitle>> getAll() async {
    String url = '${_controllerName}GetJobTitles';
    List<JobTitle> allJobTitles =
        await HttpService.getParsed<List<JobTitle>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return JobTitle.fromMap(e);
          },
        ).toList();
      },
    );
    return allJobTitles;
  }

  @override
  Future<JobTitle?> getById(int id) async {
    String url = '${_controllerName}GetJobTitleById?id=$id';
    JobTitle? jobTitle =
        await HttpService.getParsed<JobTitle?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return JobTitle.fromMap(responseData);
      },
    );
    return jobTitle;
  }

  Future<int> getJobTitlesCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<bool> insert(JobTitle object) async {
    String url = '${_controllerName}InsertJobTitle';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  @override
  Future<bool> update(JobTitle object) async {
    String url = '${_controllerName}UpdateJobTitle';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }
}
