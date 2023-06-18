// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/educational/semester_exam.dart';
import 'package:kalam_noor/models/educational/year_record.dart';

import '../../../../models/agendas/father.dart';

class StudentExamMark {
  final Student student;
  final YearRecord yearRecord;
  final SemesterExam? semesterExam;
  final Father father;
  StudentExamMark({
    required this.student,
    required this.yearRecord,
    this.semesterExam,
    required this.father,
  });

  String get fullName =>
      '${student.firstName} ${father.firstName} ${father.lastName}';
  StudentExamMark copyWith({
    Student? student,
    YearRecord? yearRecord,
    SemesterExam? semesterExam,
    Father? father,
  }) {
    return StudentExamMark(
      student: student ?? this.student,
      yearRecord: yearRecord ?? this.yearRecord,
      semesterExam: semesterExam ?? this.semesterExam,
      father: father ?? this.father,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'student': student.toMap(),
      'yearRecord': yearRecord.toMap(),
      'semesterExam': semesterExam?.toMap(),
      'father': father.toMap(),
    };
  }

  factory StudentExamMark.fromMap(Map<String, dynamic> map) {
    return StudentExamMark(
      student: Student.fromMap(map['student'] as Map<String, dynamic>),
      yearRecord: YearRecord.fromMap(map['yearRecord'] as Map<String, dynamic>),
      semesterExam: map['semesterExam'] != null
          ? SemesterExam.fromMap(map['semesterExam'] as Map<String, dynamic>)
          : null,
      father: Father.fromMap(map['father'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentExamMark.fromJson(String source) =>
      StudentExamMark.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentExamMark(student: $student, yearRecord: $yearRecord, semesterExam: $semesterExam, father: $father)';
  }

  @override
  bool operator ==(covariant StudentExamMark other) {
    if (identical(this, other)) return true;

    return other.student == student &&
        other.yearRecord == yearRecord &&
        other.semesterExam == semesterExam &&
        other.father == father;
  }

  @override
  int get hashCode {
    return student.hashCode ^
        yearRecord.hashCode ^
        semesterExam.hashCode ^
        father.hashCode;
  }
}
