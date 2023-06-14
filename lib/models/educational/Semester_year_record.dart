// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SemesterYearRecord {
  int id;
  int semesterId;
  int yearRecordId;
  SemesterYearRecord({
    required this.id,
    required this.semesterId,
    required this.yearRecordId,
  });

  SemesterYearRecord copyWith({
    int? id,
    int? semesterId,
    int? yearRecordId,
  }) {
    return SemesterYearRecord(
      id: id ?? this.id,
      semesterId: semesterId ?? this.semesterId,
      yearRecordId: yearRecordId ?? this.yearRecordId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'semesterId': semesterId,
      'yearRecordId': yearRecordId,
    };
  }

  factory SemesterYearRecord.fromMap(Map<String, dynamic> map) {
    return SemesterYearRecord(
      id: map['id'] as int,
      semesterId: map['semesterId'] as int,
      yearRecordId: map['yearRecordId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SemesterYearRecord.fromJson(String source) =>
      SemesterYearRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SemesterYearRecord(id: $id, semesterId: $semesterId, yearRecordId: $yearRecordId)';

  @override
  bool operator ==(covariant SemesterYearRecord other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.semesterId == semesterId &&
        other.yearRecordId == yearRecordId;
  }

  @override
  int get hashCode => id.hashCode ^ semesterId.hashCode ^ yearRecordId.hashCode;
}
