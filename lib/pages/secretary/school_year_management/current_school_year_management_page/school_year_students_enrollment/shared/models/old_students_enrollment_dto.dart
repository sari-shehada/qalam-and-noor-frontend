// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class OldStudentsEnrollmentDTO {
  final int classId;
  final int classRoomId;
  final List<int> studentIds;
  final int semesterId;
  OldStudentsEnrollmentDTO({
    required this.classId,
    required this.classRoomId,
    required this.studentIds,
    required this.semesterId,
  });

  OldStudentsEnrollmentDTO copyWith({
    int? classId,
    int? classRoomId,
    List<int>? studentIds,
    int? semesterId,
  }) {
    return OldStudentsEnrollmentDTO(
      classId: classId ?? this.classId,
      classRoomId: classRoomId ?? this.classRoomId,
      studentIds: studentIds ?? this.studentIds,
      semesterId: semesterId ?? this.semesterId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classId': classId,
      'classRoomId': classRoomId,
      'studentIds': studentIds,
      'semesterId': semesterId,
    };
  }

  factory OldStudentsEnrollmentDTO.fromMap(Map<String, dynamic> map) {
    return OldStudentsEnrollmentDTO(
      classId: map['classId'] as int,
      classRoomId: map['classRoomId'] as int,
      studentIds: List<int>.from(
        (map['studentIds'] as List<int>),
      ),
      semesterId: map['semesterId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OldStudentsEnrollmentDTO.fromJson(String source) =>
      OldStudentsEnrollmentDTO.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OldStudentsEnrollmentDTO(classId: $classId, classRoomId: $classRoomId, studentIds: $studentIds, semesterId: $semesterId)';
  }

  @override
  bool operator ==(covariant OldStudentsEnrollmentDTO other) {
    if (identical(this, other)) return true;

    return other.classId == classId &&
        other.classRoomId == classRoomId &&
        listEquals(other.studentIds, studentIds) &&
        other.semesterId == semesterId;
  }

  @override
  int get hashCode {
    return classId.hashCode ^
        classRoomId.hashCode ^
        studentIds.hashCode ^
        semesterId.hashCode;
  }
}
