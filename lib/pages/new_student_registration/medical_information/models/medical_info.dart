// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kalam_noor/models/medical/taken_vaccine.dart';

import '../../../../models/medical/illness.dart';
import '../../../../models/medical/medical_record.dart';

class MedicalInfo {
  final MedicalRecord record;
  final List<Illness> illnesses;
  final List<TakenVaccine> takenVaccines;
  MedicalInfo({
    required this.record,
    required this.illnesses,
    required this.takenVaccines,
  });
}
