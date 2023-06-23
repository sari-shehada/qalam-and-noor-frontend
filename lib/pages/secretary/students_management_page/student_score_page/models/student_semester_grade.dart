// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:kalam_noor/models/agendas/employee.dart';

class StudentSemesterGrade {
  final int courseId;
  final String courseName;
  final Employee teacher;
  final num totalGrade;
  final Map<String, num> grades;
  final num courseGrade;
  final bool? didPassCourse;
  final bool isOnlyDrop;
  StudentSemesterGrade({
    required this.courseId,
    required this.courseName,
    required this.teacher,
    required this.totalGrade,
    required this.grades,
    required this.courseGrade,
    required this.didPassCourse,
    required this.isOnlyDrop,
  });

  StudentSemesterGrade copyWith({
    int? courseId,
    String? courseName,
    Employee? teacher,
    num? totalGrade,
    Map<String, num>? grades,
    num? courseGrade,
    bool? didPassCourse,
    bool? isOnlyDrop,
  }) {
    return StudentSemesterGrade(
      courseId: courseId ?? this.courseId,
      courseName: courseName ?? this.courseName,
      teacher: teacher ?? this.teacher,
      totalGrade: totalGrade ?? this.totalGrade,
      grades: grades ?? this.grades,
      courseGrade: courseGrade ?? this.courseGrade,
      didPassCourse: didPassCourse ?? this.didPassCourse,
      isOnlyDrop: isOnlyDrop ?? this.isOnlyDrop,
    );
  }

  factory StudentSemesterGrade.fromMap(Map<String, dynamic> map) {
    return StudentSemesterGrade(
      courseId: map['courseId'] as int,
      courseName: map['courseName'] as String,
      teacher: Employee.fromMap(map['teacher'] as Map<String, dynamic>),
      totalGrade: map['totalGrade'] as num,
      grades: Map<String, num>.from(
        (map['grades']),
      ),
      courseGrade: map['courseGrade'] as num,
      didPassCourse:
          map['didPassCourse'] != null ? map['didPassCourse'] as bool : null,
      isOnlyDrop: map['isOnlyDrop'] as bool,
    );
  }
  @override
  String toString() {
    return 'StudentSemesterGrade(courseId: $courseId, courseName: $courseName, teacher: $teacher, totalGrade: $totalGrade, grades: $grades, courseGrade: $courseGrade, didPassCourse: $didPassCourse, isOnlyDrop: $isOnlyDrop)';
  }

  @override
  bool operator ==(covariant StudentSemesterGrade other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other.courseId == courseId &&
        other.courseName == courseName &&
        other.teacher == teacher &&
        other.totalGrade == totalGrade &&
        mapEquals(other.grades, grades) &&
        other.courseGrade == courseGrade &&
        other.didPassCourse == didPassCourse &&
        other.isOnlyDrop == isOnlyDrop;
  }

  @override
  int get hashCode {
    return courseId.hashCode ^
        courseName.hashCode ^
        teacher.hashCode ^
        totalGrade.hashCode ^
        grades.hashCode ^
        courseGrade.hashCode ^
        didPassCourse.hashCode ^
        isOnlyDrop.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseId': courseId,
      'courseName': courseName,
      'teacher': teacher.toMap(),
      'totalGrade': totalGrade,
      'grades': grades,
      'courseGrade': courseGrade,
      'didPassCourse': didPassCourse,
      'isOnlyDrop': isOnlyDrop,
    };
  }

  String toJson() => json.encode(toMap());

  factory StudentSemesterGrade.fromJson(String source) =>
      StudentSemesterGrade.fromMap(json.decode(source) as Map<String, dynamic>);
}
