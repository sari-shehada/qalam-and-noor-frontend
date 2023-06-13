// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MedicalRecord {
  final int studentId;
  num studentHight;
  num studentWeight;
  MedicalRecord({
    required this.studentId,
    required this.studentHight,
    required this.studentWeight,
  });

  MedicalRecord copyWith({
    int? studentId,
    num? studentHight,
    num? studentWeight,
  }) {
    return MedicalRecord(
      studentId: studentId ?? this.studentId,
      studentHight: studentHight ?? this.studentHight,
      studentWeight: studentWeight ?? this.studentWeight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentId': studentId,
      'studentHight': studentHight,
      'studentWeight': studentWeight,
    };
  }

  factory MedicalRecord.fromMap(Map<String, dynamic> map) {
    return MedicalRecord(
      studentId: map['studentId'] as int,
      studentHight: map['studentHight'] as num,
      studentWeight: map['studentWeight'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalRecord.fromJson(String source) =>
      MedicalRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MedicalRecord(studentId: $studentId, studentHight: $studentHight, studentWeight: $studentWeight)';

  @override
  bool operator ==(covariant MedicalRecord other) {
    if (identical(this, other)) return true;

    return other.studentId == studentId &&
        other.studentHight == studentHight &&
        other.studentWeight == studentWeight;
  }

  @override
  int get hashCode =>
      studentId.hashCode ^ studentHight.hashCode ^ studentWeight.hashCode;
}
