import '../../stats_models/psychological_status_student_count.dart';
import '../../../tools/logic_tools/network_service.dart';

class StatisticsDBHelper {
  static String get _controllerName => 'statisticsController/';

  static Future<List<PsychologicalStatusStudentCount>>
      getTopPsychologicalStatusesByAffectedStudents() async {
    String url = '${_controllerName}GetPsychologicalStatusStudentCount';
    List<PsychologicalStatusStudentCount> statuses = await HttpService
        .getParsed<List<PsychologicalStatusStudentCount>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return PsychologicalStatusStudentCount.fromMap(e);
          },
        ).toList();
      },
    );
    statuses.sort(
      (a, b) => b.studentsCount.compareTo(a.studentsCount),
    );
    return statuses;
  }

  static Future<List<PsychologicalStatusStudentCount>>
      getTopPsychologicalStatusesByAffectedMaleStudents() async {
    String url = '${_controllerName}GetPsychologicalStatusMaleStudentCount';
    List<PsychologicalStatusStudentCount> statuses = await HttpService
        .getParsed<List<PsychologicalStatusStudentCount>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return PsychologicalStatusStudentCount.fromMap(e);
          },
        ).toList();
      },
    );
    statuses.sort(
      (a, b) => b.studentsCount.compareTo(a.studentsCount),
    );
    return statuses;
  }

  static Future<List<PsychologicalStatusStudentCount>>
      getTopPsychologicalStatusesByAffectedFemaleStudents() async {
    String url = '${_controllerName}GetPsychologicalStatusFemaleStudentCount';
    List<PsychologicalStatusStudentCount> statuses = await HttpService
        .getParsed<List<PsychologicalStatusStudentCount>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return PsychologicalStatusStudentCount.fromMap(e);
          },
        ).toList();
      },
    );
    statuses.sort(
      (a, b) => b.studentsCount.compareTo(a.studentsCount),
    );
    return statuses;
  }
}
