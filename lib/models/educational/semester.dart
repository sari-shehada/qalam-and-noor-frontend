// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class Semester {
  int id;
  int yearRecordId;
  //enum
  final SemesterType type;
  Semester({
    required this.id,
    required this.yearRecordId,
    required this.type,
  });

  Semester copyWith({
    int? id,
    int? yearRecordId,
    SemesterType? type,
  }) {
    return Semester(
      id: id ?? this.id,
      yearRecordId: yearRecordId ?? this.yearRecordId,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'yearRecordId': yearRecordId,
      'type': type.index,
    };
  }

  factory Semester.fromMap(Map<String, dynamic> map) {
    return Semester(
      id: map['id'] as int,
      yearRecordId: map['yearRecordId'] as int,
      type: SemesterType.values[map['type'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory Semester.fromJson(String source) =>
      Semester.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Semester(id: $id, yearRecordId: $yearRecordId, type: $type)';

  @override
  bool operator ==(covariant Semester other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.yearRecordId == yearRecordId &&
        other.type == type;
  }

  @override
  int get hashCode => id.hashCode ^ yearRecordId.hashCode ^ type.hashCode;
}
