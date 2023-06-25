// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'total_student_mark.dart';

class FinalStudentScore {
  final List<TotalStudentMark> totalStudentMarks;
  final double totalGrade;
  final bool didPassYear;
  FinalStudentScore({
    required this.totalStudentMarks,
    required this.totalGrade,
    required this.didPassYear,
  });

  FinalStudentScore copyWith({
    List<TotalStudentMark>? totalStudentMarks,
    double? totalGrade,
    bool? didPassYear,
  }) {
    return FinalStudentScore(
      totalStudentMarks: totalStudentMarks ?? this.totalStudentMarks,
      totalGrade: totalGrade ?? this.totalGrade,
      didPassYear: didPassYear ?? this.didPassYear,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalStudentMarks': totalStudentMarks.map((x) => x.toMap()).toList(),
      'totalGrade': totalGrade,
      'didPassYear': didPassYear,
    };
  }

  factory FinalStudentScore.fromMap(Map<String, dynamic> map) {
    return FinalStudentScore(
      totalStudentMarks: List<TotalStudentMark>.from(
        (map['totalStudentMarks'] as List).map<TotalStudentMark>(
          (x) => TotalStudentMark.fromMap(x),
        ),
      ),
      totalGrade: map['totalGrade'] as double,
      didPassYear: map['didPassYear'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FinalStudentScore.fromJson(String source) =>
      FinalStudentScore.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FinalStudentScore(totalStudentMarks: $totalStudentMarks, totalGrade: $totalGrade, didPassYear: $didPassYear)';

  @override
  bool operator ==(covariant FinalStudentScore other) {
    if (identical(this, other)) return true;

    return listEquals(other.totalStudentMarks, totalStudentMarks) &&
        other.totalGrade == totalGrade &&
        other.didPassYear == didPassYear;
  }

  @override
  int get hashCode =>
      totalStudentMarks.hashCode ^ totalGrade.hashCode ^ didPassYear.hashCode;
}
