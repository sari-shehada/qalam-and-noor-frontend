// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../models/medical/illness.dart';
import '../../../../models/medical/medical_record.dart';
import '../../../../models/medical/psychological_status.dart';
import '../../../../models/medical/vaccine.dart';

class MedicalInfo {
  final MedicalRecord record;
  final List<Illness> illnesses;
  final List<PsychologicalStatus> psychologicalStatuses;
  final List<Vaccine> vaccines;
  MedicalInfo({
    required this.record,
    required this.illnesses,
    required this.psychologicalStatuses,
    required this.vaccines,
  });
}
