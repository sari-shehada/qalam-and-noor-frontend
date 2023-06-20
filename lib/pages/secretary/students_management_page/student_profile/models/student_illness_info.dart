// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentIllnessInfo {
  final int illnessesMedicalRecordId;
  final String illnessName;
  final String? note;
  StudentIllnessInfo({
    required this.illnessesMedicalRecordId,
    required this.illnessName,
    this.note,
  });

  StudentIllnessInfo copyWith({
    int? illnessesMedicalRecordId,
    String? illnessName,
    String? note,
  }) {
    return StudentIllnessInfo(
      illnessesMedicalRecordId:
          illnessesMedicalRecordId ?? this.illnessesMedicalRecordId,
      illnessName: illnessName ?? this.illnessName,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'illnessesMedicalRecordId': illnessesMedicalRecordId,
      'illnessName': illnessName,
      'note': note,
    };
  }

  factory StudentIllnessInfo.fromMap(Map<String, dynamic> map) {
    return StudentIllnessInfo(
      illnessesMedicalRecordId: map['illnessesMedicalRecordId'] as int,
      illnessName: map['illnessName'] as String,
      note: map['note'] != null ? map['note'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentIllnessInfo.fromJson(String source) =>
      StudentIllnessInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StudentIllnessInfo(illnessesMedicalRecordId: $illnessesMedicalRecordId, illnessName: $illnessName, note: $note)';

  @override
  bool operator ==(covariant StudentIllnessInfo other) {
    if (identical(this, other)) return true;

    return other.illnessesMedicalRecordId == illnessesMedicalRecordId &&
        other.illnessName == illnessName &&
        other.note == note;
  }

  @override
  int get hashCode =>
      illnessesMedicalRecordId.hashCode ^ illnessName.hashCode ^ note.hashCode;
}
