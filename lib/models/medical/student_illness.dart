// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentIllness {
  final int id;
  final int medicalRecordId;
  final int ilnessId;
  String? note;
  StudentIllness({
    required this.id,
    required this.medicalRecordId,
    required this.ilnessId,
    this.note,
  });

  StudentIllness copyWith({
    int? id,
    int? medicalRecordId,
    int? ilnessId,
    String? note,
  }) {
    return StudentIllness(
      id: id ?? this.id,
      medicalRecordId: medicalRecordId ?? this.medicalRecordId,
      ilnessId: ilnessId ?? this.ilnessId,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'medicalRecordId': medicalRecordId,
      'ilnessId': ilnessId,
      'note': note,
    };
  }

  factory StudentIllness.fromMap(Map<String, dynamic> map) {
    return StudentIllness(
      id: map['id'] as int,
      medicalRecordId: map['medicalRecordId'] as int,
      ilnessId: map['ilnessId'] as int,
      note: map['note'] != null ? map['note'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentIllness.fromJson(String source) =>
      StudentIllness.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentIllness(id: $id, medicalRecordId: $medicalRecordId, ilnessId: $ilnessId, note: $note)';
  }

  @override
  bool operator ==(covariant StudentIllness other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.medicalRecordId == medicalRecordId &&
        other.ilnessId == ilnessId &&
        other.note == note;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        medicalRecordId.hashCode ^
        ilnessId.hashCode ^
        note.hashCode;
  }
}
