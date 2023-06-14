// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../models/stats_models/psychological_status_student_count.dart';

class PsychologicalInstructorDashboardCardsInfo {
  final List<PsychologicalStatusStudentCount>
      psychologicalStatusesToStudentCount;
  final List<PsychologicalStatusStudentCount>
      malePsychologicalStatusesToStudentCount;
  final List<PsychologicalStatusStudentCount>
      femalePsychologicalStatusesToStudentCount;
  final DateTime currentDateAndTime;
  PsychologicalInstructorDashboardCardsInfo({
    required this.psychologicalStatusesToStudentCount,
    required this.malePsychologicalStatusesToStudentCount,
    required this.femalePsychologicalStatusesToStudentCount,
    required this.currentDateAndTime,
  });
}
