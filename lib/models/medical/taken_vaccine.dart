// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TakenVaccine {
  final int id;
  final int medicalRecordId;
  final int vaccineId;
  final DateTime shotDate;
  String? notes;
  TakenVaccine({
    required this.id,
    required this.medicalRecordId,
    required this.vaccineId,
    required this.shotDate,
    this.notes,
  });

  TakenVaccine copyWith({
    int? id,
    int? medicalRecordId,
    int? vaccineId,
    DateTime? shotDate,
    String? notes,
  }) {
    return TakenVaccine(
      id: id ?? this.id,
      medicalRecordId: medicalRecordId ?? this.medicalRecordId,
      vaccineId: vaccineId ?? this.vaccineId,
      shotDate: shotDate ?? this.shotDate,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'medicalRecordId': medicalRecordId,
      'vaccineId': vaccineId,
      'shotDate': shotDate.millisecondsSinceEpoch,
      'notes': notes,
    };
  }

  factory TakenVaccine.fromMap(Map<String, dynamic> map) {
    return TakenVaccine(
      id: map['id'] as int,
      medicalRecordId: map['medicalRecordId'] as int,
      vaccineId: map['vaccineId'] as int,
      shotDate: DateTime.fromMillisecondsSinceEpoch(map['shotDate'] as int),
      notes: map['notes'] != null ? map['notes'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TakenVaccine.fromJson(String source) =>
      TakenVaccine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TakenVaccine(id: $id, medicalRecordId: $medicalRecordId, vaccineId: $vaccineId, shotDate: $shotDate, notes: $notes)';
  }

  @override
  bool operator ==(covariant TakenVaccine other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.medicalRecordId == medicalRecordId &&
        other.vaccineId == vaccineId &&
        other.shotDate == shotDate &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        medicalRecordId.hashCode ^
        vaccineId.hashCode ^
        shotDate.hashCode ^
        notes.hashCode;
  }
}
