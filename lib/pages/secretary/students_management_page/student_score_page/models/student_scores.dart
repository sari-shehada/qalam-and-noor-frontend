import 'package:flutter/foundation.dart';

import 'package:kalam_noor/models/enums.dart';

class StudentScores {
  final String courseName;
  final num totalGrade;
  final Map<ExamType, num> grades;
  StudentScores({
    required this.courseName,
    required this.totalGrade,
    required this.grades,
  });

  StudentScores copyWith({
    String? courseName,
    num? totalGrade,
    Map<ExamType, double>? grades,
  }) {
    return StudentScores(
      courseName: courseName ?? this.courseName,
      totalGrade: totalGrade ?? this.totalGrade,
      grades: grades ?? this.grades,
    );
  }

  factory StudentScores.fromMap(Map<String, dynamic> map) {
    return StudentScores(
        courseName: map['courseName'] as String,
        totalGrade: map['totalGrade'] as num,
        grades: (map['grades'] as Map).map((key, value) {
          return MapEntry(ExamType.values[int.parse(key)], value);
        }));
  }
  @override
  String toString() =>
      'StudentScores(courseName: $courseName, totalGrade: $totalGrade, grades: $grades)';

  @override
  bool operator ==(covariant StudentScores other) {
    if (identical(this, other)) return true;

    return other.courseName == courseName &&
        other.totalGrade == totalGrade &&
        mapEquals(other.grades, grades);
  }

  @override
  int get hashCode =>
      courseName.hashCode ^ totalGrade.hashCode ^ grades.hashCode;
}
