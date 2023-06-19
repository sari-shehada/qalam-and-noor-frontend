// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/end_current_seemster_dialog/models/course_reports_dto.dart';

class ClassReportsDTO {
  final int classId;
  final String className;
  final List<CourseReportsDTO> courseReports;
  ClassReportsDTO({
    required this.classId,
    required this.className,
    required this.courseReports,
  });

  ClassReportsDTO copyWith({
    int? classId,
    String? className,
    List<CourseReportsDTO>? courseReports,
  }) {
    return ClassReportsDTO(
      classId: classId ?? this.classId,
      className: className ?? this.className,
      courseReports: courseReports ?? this.courseReports,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classId': classId,
      'className': className,
      'courseReports': courseReports.map((x) => x.toMap()).toList(),
    };
  }

  factory ClassReportsDTO.fromMap(Map<String, dynamic> map) {
    return ClassReportsDTO(
      classId: map['classId'] as int,
      className: map['className'] as String,
      courseReports: List<CourseReportsDTO>.from(
        (map['courseReports'] as List<int>).map<CourseReportsDTO>(
          (x) => CourseReportsDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassReportsDTO.fromJson(String source) =>
      ClassReportsDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ClassReportsDTO(classId: $classId, className: $className, courseReports: $courseReports)';

  @override
  bool operator ==(covariant ClassReportsDTO other) {
    if (identical(this, other)) return true;

    return other.classId == classId &&
        other.className == className &&
        listEquals(other.courseReports, courseReports);
  }

  @override
  int get hashCode =>
      classId.hashCode ^ className.hashCode ^ courseReports.hashCode;
}
