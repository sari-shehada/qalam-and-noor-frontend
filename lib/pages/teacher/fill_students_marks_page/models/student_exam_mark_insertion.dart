// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class StudentExamMarkInsertion {
  int courseId;
  int examId;
  Map<String, int> studentMark;
  StudentExamMarkInsertion({
    required this.courseId,
    required this.examId,
    required this.studentMark,
  });

  StudentExamMarkInsertion copyWith({
    int? courseId,
    int? examId,
    Map<String, int>? studentMark,
  }) {
    return StudentExamMarkInsertion(
      courseId: courseId ?? this.courseId,
      examId: examId ?? this.examId,
      studentMark: studentMark ?? this.studentMark,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseId': courseId,
      'examId': examId,
      'studentMark': studentMark,
    };
  }

  factory StudentExamMarkInsertion.fromMap(Map<String, dynamic> map) {
    return StudentExamMarkInsertion(
      courseId: map['courseId'] as int,
      examId: map['examId'] as int,
      studentMark: Map<String, int>.from(
        (map['studentMark'] as Map<String, int>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentExamMarkInsertion.fromJson(String source) =>
      StudentExamMarkInsertion.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StudentExamMarkInsertion(courseId: $courseId, examId: $examId, studentMark: $studentMark)';

  @override
  bool operator ==(covariant StudentExamMarkInsertion other) {
    if (identical(this, other)) return true;

    return other.courseId == courseId &&
        other.examId == examId &&
        mapEquals(other.studentMark, studentMark);
  }

  @override
  int get hashCode =>
      courseId.hashCode ^ examId.hashCode ^ studentMark.hashCode;
}
