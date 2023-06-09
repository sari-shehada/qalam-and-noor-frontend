// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PsychologicalStatusStudentCount {
  final int id;
  final String psychologicalStatusName;
  final int studentsCount;
  PsychologicalStatusStudentCount({
    required this.id,
    required this.psychologicalStatusName,
    required this.studentsCount,
  });

  PsychologicalStatusStudentCount copyWith({
    int? id,
    String? psychologicalStatusName,
    int? studentsCount,
  }) {
    return PsychologicalStatusStudentCount(
      id: id ?? this.id,
      psychologicalStatusName:
          psychologicalStatusName ?? this.psychologicalStatusName,
      studentsCount: studentsCount ?? this.studentsCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'psychologicalStatusName': psychologicalStatusName,
      'studentsCount': studentsCount,
    };
  }

  factory PsychologicalStatusStudentCount.fromMap(Map<String, dynamic> map) {
    return PsychologicalStatusStudentCount(
      id: map['id'] as int,
      psychologicalStatusName: map['psychologicalStatusName'] as String,
      studentsCount: map['studentsCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PsychologicalStatusStudentCount.fromJson(String source) =>
      PsychologicalStatusStudentCount.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PsychologicalStatusStudentCount(id: $id, psychologicalStatusName: $psychologicalStatusName, studentsCount: $studentsCount)';

  @override
  bool operator ==(covariant PsychologicalStatusStudentCount other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.psychologicalStatusName == psychologicalStatusName &&
        other.studentsCount == studentsCount;
  }

  @override
  int get hashCode =>
      id.hashCode ^ psychologicalStatusName.hashCode ^ studentsCount.hashCode;
}
