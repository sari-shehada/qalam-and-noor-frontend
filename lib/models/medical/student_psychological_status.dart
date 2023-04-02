// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../enums.dart';

class StudentPsychologicalStatus {
  final int id;
  final int medicalRecordId;
  final int psychologicalStatusId;
  //enum
  final PsychologicalStatusLevel statusLevel;
  StudentPsychologicalStatus({
    required this.id,
    required this.medicalRecordId,
    required this.psychologicalStatusId,
    required this.statusLevel,
  });

  StudentPsychologicalStatus copyWith({
    int? id,
    int? medicalRecordId,
    int? psychologicalStatusId,
    PsychologicalStatusLevel? statusLevel,
  }) {
    return StudentPsychologicalStatus(
      id: id ?? this.id,
      medicalRecordId: medicalRecordId ?? this.medicalRecordId,
      psychologicalStatusId:
          psychologicalStatusId ?? this.psychologicalStatusId,
      statusLevel: statusLevel ?? this.statusLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'medicalRecordId': medicalRecordId,
      'psychologicalStatusId': psychologicalStatusId,
      'statusLevel': statusLevel.index,
    };
  }

  factory StudentPsychologicalStatus.fromMap(Map<String, dynamic> map) {
    return StudentPsychologicalStatus(
      id: map['id'] as int,
      medicalRecordId: map['medicalRecordId'] as int,
      psychologicalStatusId: map['psychologicalStatusId'] as int,
      statusLevel: PsychologicalStatusLevel.values[map['statusLevel'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentPsychologicalStatus.fromJson(String source) =>
      StudentPsychologicalStatus.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentPsychologicalStatus(id: $id, medicalRecordId: $medicalRecordId, psychologicalStatusId: $psychologicalStatusId, statusLevel: $statusLevel)';
  }

  @override
  bool operator ==(covariant StudentPsychologicalStatus other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.medicalRecordId == medicalRecordId &&
        other.psychologicalStatusId == psychologicalStatusId &&
        other.statusLevel == statusLevel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        medicalRecordId.hashCode ^
        psychologicalStatusId.hashCode ^
        statusLevel.hashCode;
  }
}
