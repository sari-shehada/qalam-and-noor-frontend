// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MedicalRecord {
  final int id;
  double studentHeight;
  double studentWeight;
  MedicalRecord({
    required this.id,
    required this.studentHeight,
    required this.studentWeight,
  });

  MedicalRecord copyWith({
    int? id,
    double? studentHeight,
    double? studentWeight,
  }) {
    return MedicalRecord(
      id: id ?? this.id,
      studentHeight: studentHeight ?? this.studentHeight,
      studentWeight: studentWeight ?? this.studentWeight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'studentHeight': studentHeight,
      'studentWeight': studentWeight,
    };
  }

  factory MedicalRecord.fromMap(Map<String, dynamic> map) {
    return MedicalRecord(
      id: map['id'] as int,
      studentHeight: map['studentHeight'] as double,
      studentWeight: map['studentWeight'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalRecord.fromJson(String source) =>
      MedicalRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MedicalRecord(id: $id, studentHeight: $studentHeight, studentWeight: $studentWeight)';

  @override
  bool operator ==(covariant MedicalRecord other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.studentHeight == studentHeight &&
        other.studentWeight == studentWeight;
  }

  @override
  int get hashCode =>
      id.hashCode ^ studentHeight.hashCode ^ studentWeight.hashCode;
}
