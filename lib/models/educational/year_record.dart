// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../enums.dart';

class YearRecord {
  int id;
  int classId;
  int? schoolYearClassroomId;
  int studentId;
  int yearGrade;
  //enum
  StudentStatusEnum status;
  YearRecord({
    required this.id,
    required this.classId,
    this.schoolYearClassroomId,
    required this.studentId,
    required this.yearGrade,
    required this.status,
  });

  YearRecord copyWith({
    int? id,
    int? classId,
    int? schoolYearClassroomId,
    int? studentId,
    int? yearGrade,
    StudentStatusEnum? status,
  }) {
    return YearRecord(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      schoolYearClassroomId:
          schoolYearClassroomId ?? this.schoolYearClassroomId,
      studentId: studentId ?? this.studentId,
      yearGrade: yearGrade ?? this.yearGrade,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classId': classId,
      'schoolYearClassroomId': schoolYearClassroomId,
      'studentId': studentId,
      'yearGrade': yearGrade,
      'status': status.index,
    };
  }

  factory YearRecord.fromMap(Map<String, dynamic> map) {
    return YearRecord(
      id: map['id'] as int,
      classId: map['classId'] as int,
      schoolYearClassroomId: map['schoolYearClassroomId'] != null
          ? map['schoolYearClassroomId'] as int
          : null,
      studentId: map['studentId'] as int,
      yearGrade: map['yearGrade'] as int,
      status: StudentStatusEnum.values[map['status'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory YearRecord.fromJson(String source) =>
      YearRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'YearRecord(id: $id, classId: $classId, schoolYearClassroomId: $schoolYearClassroomId, studentId: $studentId, yearGrade: $yearGrade, status: $status)';
  }

  @override
  bool operator ==(covariant YearRecord other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.classId == classId &&
        other.schoolYearClassroomId == schoolYearClassroomId &&
        other.studentId == studentId &&
        other.yearGrade == yearGrade &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        classId.hashCode ^
        schoolYearClassroomId.hashCode ^
        studentId.hashCode ^
        yearGrade.hashCode ^
        status.hashCode;
  }
}
