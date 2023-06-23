// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kalam_noor/pages/secretary/students_management_page/student_score_page/models/student_semester_grade.dart';

class StudentSemesterScore {
  final List<StudentSemesterGrade> studentSemesterGrades;
  final bool didPassSemester;
  final num totalSemesterGrade;
  StudentSemesterScore({
    required this.studentSemesterGrades,
    required this.didPassSemester,
    required this.totalSemesterGrade,
  });

  StudentSemesterScore copyWith({
    List<StudentSemesterGrade>? studentSemesterGrades,
    bool? didPassSemester,
    num? totalSemesterGrade,
  }) {
    return StudentSemesterScore(
      studentSemesterGrades:
          studentSemesterGrades ?? this.studentSemesterGrades,
      didPassSemester: didPassSemester ?? this.didPassSemester,
      totalSemesterGrade: totalSemesterGrade ?? this.totalSemesterGrade,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentSemesterGrades':
          studentSemesterGrades.map((x) => x.toMap()).toList(),
      'didPassSemester': didPassSemester,
      'totalSemesterGrade': totalSemesterGrade,
    };
  }

  factory StudentSemesterScore.fromMap(Map<String, dynamic> map) {
    return StudentSemesterScore(
      studentSemesterGrades: List<StudentSemesterGrade>.from(
        (map['studentSemesterGrades'] as List).map<StudentSemesterGrade>(
          (x) => StudentSemesterGrade.fromMap(x),
        ),
      ),
      didPassSemester: map['didPassSemester'] as bool,
      totalSemesterGrade: map['totalSemesterGrade'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentSemesterScore.fromJson(String source) =>
      StudentSemesterScore.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StudentSemesterScore(studentSemesterGrades: $studentSemesterGrades, didPassSemester: $didPassSemester, totalSemesterGrade: $totalSemesterGrade)';

  @override
  bool operator ==(covariant StudentSemesterScore other) {
    if (identical(this, other)) return true;

    return listEquals(other.studentSemesterGrades, studentSemesterGrades) &&
        other.didPassSemester == didPassSemester &&
        other.totalSemesterGrade == totalSemesterGrade;
  }

  @override
  int get hashCode =>
      studentSemesterGrades.hashCode ^
      didPassSemester.hashCode ^
      totalSemesterGrade.hashCode;
}
