// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class PsychologicalStatusInfo {
  final int psychologicalStatusMedicalRecordId;
  final String psychologicalStatusName;
  //enum
  final PsychologicalStatusLevel statusLevel;
  PsychologicalStatusInfo({
    required this.psychologicalStatusMedicalRecordId,
    required this.psychologicalStatusName,
    required this.statusLevel,
  });

  PsychologicalStatusInfo copyWith({
    int? psychologicalStatusMedicalRecordId,
    String? psychologicalStatusName,
    PsychologicalStatusLevel? statusLevel,
  }) {
    return PsychologicalStatusInfo(
      psychologicalStatusMedicalRecordId: psychologicalStatusMedicalRecordId ??
          this.psychologicalStatusMedicalRecordId,
      psychologicalStatusName:
          psychologicalStatusName ?? this.psychologicalStatusName,
      statusLevel: statusLevel ?? this.statusLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'psychologicalStatusMedicalRecordId': psychologicalStatusMedicalRecordId,
      'psychologicalStatusName': psychologicalStatusName,
      'statusLevel': statusLevel.index,
    };
  }

  factory PsychologicalStatusInfo.fromMap(Map<String, dynamic> map) {
    return PsychologicalStatusInfo(
      psychologicalStatusMedicalRecordId:
          map['psychologicalStatusMedicalRecordId'] as int,
      psychologicalStatusName: map['psychologicalStatusName'] as String,
      statusLevel: PsychologicalStatusLevel.values[map['statusLevel'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory PsychologicalStatusInfo.fromJson(String source) =>
      PsychologicalStatusInfo.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PsychologicalStatusInfo(psychologicalStatusMedicalRecordId: $psychologicalStatusMedicalRecordId, psychologicalStatusName: $psychologicalStatusName, statusLevel: $statusLevel)';

  @override
  bool operator ==(covariant PsychologicalStatusInfo other) {
    if (identical(this, other)) return true;

    return other.psychologicalStatusMedicalRecordId ==
            psychologicalStatusMedicalRecordId &&
        other.psychologicalStatusName == psychologicalStatusName &&
        other.statusLevel == statusLevel;
  }

  @override
  int get hashCode =>
      psychologicalStatusMedicalRecordId.hashCode ^
      psychologicalStatusName.hashCode ^
      statusLevel.hashCode;
}
