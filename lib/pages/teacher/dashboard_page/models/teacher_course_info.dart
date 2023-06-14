// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/models/educational/school_class.dart';

class TeacherCourseInfo {
  Course course;
  SchoolClass schoolClass;
  TeacherCourseInfo({
    required this.course,
    required this.schoolClass,
  });

  TeacherCourseInfo copyWith({
    Course? course,
    SchoolClass? schoolClass,
  }) {
    return TeacherCourseInfo(
      course: course ?? this.course,
      schoolClass: schoolClass ?? this.schoolClass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'course': course.toMap(),
      'schoolClass': schoolClass.toMap(),
    };
  }

  factory TeacherCourseInfo.fromMap(Map<String, dynamic> map) {
    return TeacherCourseInfo(
      course: Course.fromMap(map['course'] as Map<String, dynamic>),
      schoolClass:
          SchoolClass.fromMap(map['schoolClass'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherCourseInfo.fromJson(String source) =>
      TeacherCourseInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TeacherCourseInfo(course: $course, schoolClass: $schoolClass)';

  @override
  bool operator ==(covariant TeacherCourseInfo other) {
    if (identical(this, other)) return true;

    return other.course == course && other.schoolClass == schoolClass;
  }

  @override
  int get hashCode => course.hashCode ^ schoolClass.hashCode;
}
