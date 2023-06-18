// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SemesterExam {
  int id;
  int examId;
  double obtainedGrade;
  int courseId;
  int semesterYearRecordId;
  SemesterExam({
    required this.id,
    required this.examId,
    required this.obtainedGrade,
    required this.courseId,
    required this.semesterYearRecordId,
  });

  SemesterExam copyWith({
    int? id,
    int? examId,
    double? obtainedGrade,
    int? courseId,
    int? semesterYearRecordId,
  }) {
    return SemesterExam(
      id: id ?? this.id,
      examId: examId ?? this.examId,
      obtainedGrade: obtainedGrade ?? this.obtainedGrade,
      courseId: courseId ?? this.courseId,
      semesterYearRecordId: semesterYearRecordId ?? this.semesterYearRecordId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'examId': examId,
      'obtainedGrade': obtainedGrade,
      'courseId': courseId,
      'semesterYearRecordId': semesterYearRecordId,
    };
  }

  factory SemesterExam.fromMap(Map<String, dynamic> map) {
    return SemesterExam(
      id: map['id'] as int,
      examId: map['examId'] as int,
      obtainedGrade: map['obtainedGrade'] as double,
      courseId: map['courseId'] as int,
      semesterYearRecordId: map['semesterYearRecordId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SemesterExam.fromJson(String source) =>
      SemesterExam.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SemesterExam(id: $id, examId: $examId, obtainedGrade: $obtainedGrade, courseId: $courseId, semesterYearRecordId: $semesterYearRecordId)';
  }

  @override
  bool operator ==(covariant SemesterExam other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.examId == examId &&
        other.obtainedGrade == obtainedGrade &&
        other.courseId == courseId &&
        other.semesterYearRecordId == semesterYearRecordId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        examId.hashCode ^
        obtainedGrade.hashCode ^
        courseId.hashCode ^
        semesterYearRecordId.hashCode;
  }
}
