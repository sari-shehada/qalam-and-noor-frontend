// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentIllness {
  final int id;
  final int medicalRecordId;
  final int illnessId;
  String? notes;
  StudentIllness({
    required this.id,
    required this.medicalRecordId,
    required this.illnessId,
    this.notes,
  });

  StudentIllness copyWith({
    int? id,
    int? medicalRecordId,
    int? illnessId,
    String? notes,
  }) {
    return StudentIllness(
      id: id ?? this.id,
      medicalRecordId: medicalRecordId ?? this.medicalRecordId,
      illnessId: illnessId ?? this.illnessId,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'medicalRecordId': medicalRecordId,
      'illnessId': illnessId,
      'notes': notes,
    };
  }

  factory StudentIllness.fromMap(Map<String, dynamic> map) {
    return StudentIllness(
      id: map['id'] as int,
      medicalRecordId: map['medicalRecordId'] as int,
      illnessId: map['illnessId'] as int,
      notes: map['notes'] != null ? map['notes'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentIllness.fromJson(String source) =>
      StudentIllness.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentIllness(id: $id, medicalRecordId: $medicalRecordId, illnessId: $illnessId, notes: $notes)';
  }

  @override
  bool operator ==(covariant StudentIllness other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.medicalRecordId == medicalRecordId &&
        other.illnessId == illnessId &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        medicalRecordId.hashCode ^
        illnessId.hashCode ^
        notes.hashCode;
  }
}
