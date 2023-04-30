// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TakenVaccine {
  final int id;
  final int medicalRecordId;
  final int vaccineId;
  final DateTime shotDate;
  String? note;
  TakenVaccine({
    required this.id,
    required this.medicalRecordId,
    required this.vaccineId,
    required this.shotDate,
    this.note,
  });

  TakenVaccine copyWith({
    int? id,
    int? medicalRecordId,
    int? vaccineId,
    DateTime? shotDate,
    String? note,
  }) {
    return TakenVaccine(
      id: id ?? this.id,
      medicalRecordId: medicalRecordId ?? this.medicalRecordId,
      vaccineId: vaccineId ?? this.vaccineId,
      shotDate: shotDate ?? this.shotDate,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'medicalRecordId': medicalRecordId,
      'vaccineId': vaccineId,
      'shotDate': shotDate.toIso8601String(),
      'note': note,
    };
  }

  factory TakenVaccine.fromMap(Map<String, dynamic> map) {
    return TakenVaccine(
      id: map['id'] as int,
      medicalRecordId: map['medicalRecordId'] as int,
      vaccineId: map['vaccineId'] as int,
      shotDate: DateTime.parse(map['shotDate']),
      note: map['note'] != null ? map['note'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TakenVaccine.fromJson(String source) =>
      TakenVaccine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TakenVaccine(id: $id, medicalRecordId: $medicalRecordId, vaccineId: $vaccineId, shotDate: $shotDate, note: $note)';
  }

  @override
  bool operator ==(covariant TakenVaccine other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.medicalRecordId == medicalRecordId &&
        other.vaccineId == vaccineId &&
        other.shotDate == shotDate &&
        other.note == note;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        medicalRecordId.hashCode ^
        vaccineId.hashCode ^
        shotDate.hashCode ^
        note.hashCode;
  }
}
