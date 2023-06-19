// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'classrooms_reports_dto.dart';

class CourseReportsDTO {
  final int courseId;
  final String courseName;
  final List<ClassroomReportsDTO> classroomReports;
  CourseReportsDTO({
    required this.courseId,
    required this.courseName,
    required this.classroomReports,
  });

  CourseReportsDTO copyWith({
    int? courseId,
    String? courseName,
    List<ClassroomReportsDTO>? classroomReports,
  }) {
    return CourseReportsDTO(
      courseId: courseId ?? this.courseId,
      courseName: courseName ?? this.courseName,
      classroomReports: classroomReports ?? this.classroomReports,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseId': courseId,
      'courseName': courseName,
      'classroomReports': classroomReports.map((x) => x.toMap()).toList(),
    };
  }

  factory CourseReportsDTO.fromMap(Map<String, dynamic> map) {
    return CourseReportsDTO(
      courseId: map['courseId'] as int,
      courseName: map['courseName'] as String,
      classroomReports: List<ClassroomReportsDTO>.from(
        (map['classroomReports'] as List<int>).map<ClassroomReportsDTO>(
          (x) => ClassroomReportsDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseReportsDTO.fromJson(String source) =>
      CourseReportsDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CourseReportsDTO(courseId: $courseId, courseName: $courseName, classroomReports: $classroomReports)';

  @override
  bool operator ==(covariant CourseReportsDTO other) {
    if (identical(this, other)) return true;

    return other.courseId == courseId &&
        other.courseName == courseName &&
        listEquals(other.classroomReports, classroomReports);
  }

  @override
  int get hashCode =>
      courseId.hashCode ^ courseName.hashCode ^ classroomReports.hashCode;
}
