import 'package:get/get.dart';
import '../../../../models/helpers/database_helpers/statistics_db_helper.dart';
import '../../../../models/stats_models/psychological_status_student_count.dart';

import '../models/psychological_instructor_dashboard_cards_info.dart';

class PsychologicalInstructorDashboardController extends GetxController {
  late Rx<Future<PsychologicalInstructorDashboardCardsInfo>>
      psychologicalInstructorDashboardCardsInfo;

  @override
  void onInit() {
    psychologicalInstructorDashboardCardsInfo = getCardsInfo().obs;
    super.onInit();
  }

  Future<PsychologicalInstructorDashboardCardsInfo> getCardsInfo() async {
    await Future.delayed(3.seconds);
    return PsychologicalInstructorDashboardCardsInfo(
      psychologicalStatusesToStudentCount: await StatisticsDBHelper
          .getTopPsychologicalStatusesByAffectedStudents(),
      malePsychologicalStatusesToStudentCount: await StatisticsDBHelper
          .getTopPsychologicalStatusesByAffectedMaleStudents(),
      femalePsychologicalStatusesToStudentCount: await StatisticsDBHelper
          .getTopPsychologicalStatusesByAffectedFemaleStudents(),
      currentDateAndTime: DateTime.now(),
    );
  }

  Future<List<PsychologicalStatusStudentCount>>
      getPsychologicalStatusesToStudentCount() async {
    return [
      PsychologicalStatusStudentCount(
        id: 1,
        psychologicalStatusName: 'asd',
        studentsCount: 12,
      ),
      PsychologicalStatusStudentCount(
        id: 1,
        psychologicalStatusName: 'asd1',
        studentsCount: 23,
      ),
      PsychologicalStatusStudentCount(
        id: 1,
        psychologicalStatusName: 'asd2',
        studentsCount: 3,
      ),
    ];
  }
}
