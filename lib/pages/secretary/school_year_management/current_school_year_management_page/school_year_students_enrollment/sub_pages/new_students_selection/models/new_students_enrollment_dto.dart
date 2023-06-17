// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class NewStudentsEnrollmentDTO {
  final int classRoomId;
  final List<int> yearRecordId;
  final int semesterId;
  NewStudentsEnrollmentDTO({
    required this.classRoomId,
    required this.yearRecordId,
    required this.semesterId,
  });

  NewStudentsEnrollmentDTO copyWith({
    int? classRoomId,
    List<int>? yearRecordId,
    int? semesterId,
  }) {
    return NewStudentsEnrollmentDTO(
      classRoomId: classRoomId ?? this.classRoomId,
      yearRecordId: yearRecordId ?? this.yearRecordId,
      semesterId: semesterId ?? this.semesterId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classRoomId': classRoomId,
      'yearRecordId': yearRecordId,
      'semesterId': semesterId,
    };
  }

  factory NewStudentsEnrollmentDTO.fromMap(Map<String, dynamic> map) {
    return NewStudentsEnrollmentDTO(
      classRoomId: map['classRoomId'] as int,
      yearRecordId: List<int>.from(
        (map['yearRecordId'] as List<int>),
      ),
      semesterId: map['semesterId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewStudentsEnrollmentDTO.fromJson(String source) =>
      NewStudentsEnrollmentDTO.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NewStudentsEnrollmentDTO(classRoomId: $classRoomId, yearRecordId: $yearRecordId, semesterId: $semesterId)';

  @override
  bool operator ==(covariant NewStudentsEnrollmentDTO other) {
    if (identical(this, other)) return true;

    return other.classRoomId == classRoomId &&
        listEquals(other.yearRecordId, yearRecordId) &&
        other.semesterId == semesterId;
  }

  @override
  int get hashCode =>
      classRoomId.hashCode ^ yearRecordId.hashCode ^ semesterId.hashCode;
}
