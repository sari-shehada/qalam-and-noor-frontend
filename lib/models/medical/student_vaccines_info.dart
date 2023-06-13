// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentVaccineInfo {
  final int takenVaccineId;
  final String vaccineName;
  final DateTime shotDate;
  final String? note;
  StudentVaccineInfo({
    required this.takenVaccineId,
    required this.vaccineName,
    required this.shotDate,
    this.note,
  });

  StudentVaccineInfo copyWith({
    int? takenVaccineId,
    String? vaccineName,
    DateTime? shotDate,
    String? note,
  }) {
    return StudentVaccineInfo(
      takenVaccineId: takenVaccineId ?? this.takenVaccineId,
      vaccineName: vaccineName ?? this.vaccineName,
      shotDate: shotDate ?? this.shotDate,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'takenVaccineId': takenVaccineId,
      'vaccineName': vaccineName,
      'shotDate': shotDate.millisecondsSinceEpoch,
      'note': note,
    };
  }

  factory StudentVaccineInfo.fromMap(Map<String, dynamic> map) {
    return StudentVaccineInfo(
      takenVaccineId: map['takenVaccineId'] as int,
      vaccineName: map['vaccineName'] as String,
      shotDate: DateTime.parse(map['shotDate']),
      note: map['note'] != null ? map['note'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentVaccineInfo.fromJson(String source) =>
      StudentVaccineInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentVaccineInfo(takenVaccineId: $takenVaccineId, vaccineName: $vaccineName, shotDate: $shotDate, note: $note)';
  }

  @override
  bool operator ==(covariant StudentVaccineInfo other) {
    if (identical(this, other)) return true;

    return other.takenVaccineId == takenVaccineId &&
        other.vaccineName == vaccineName &&
        other.shotDate == shotDate &&
        other.note == note;
  }

  @override
  int get hashCode {
    return takenVaccineId.hashCode ^
        vaccineName.hashCode ^
        shotDate.hashCode ^
        note.hashCode;
  }
}
