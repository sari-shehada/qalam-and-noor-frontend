// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TotalStudentMark {
  final int courseId;
  final String courseName;
  final bool requiredToPass;
  final int requiredGradeToPass;
  final double averageGrade;
  final bool didPass;
  TotalStudentMark({
    required this.courseId,
    required this.courseName,
    required this.requiredToPass,
    required this.requiredGradeToPass,
    required this.averageGrade,
    required this.didPass,
  });

  TotalStudentMark copyWith({
    int? courseId,
    String? courseName,
    bool? requiredToPass,
    int? requiredGradeToPass,
    double? averageGrade,
    bool? didPass,
  }) {
    return TotalStudentMark(
      courseId: courseId ?? this.courseId,
      courseName: courseName ?? this.courseName,
      requiredToPass: requiredToPass ?? this.requiredToPass,
      requiredGradeToPass: requiredGradeToPass ?? this.requiredGradeToPass,
      averageGrade: averageGrade ?? this.averageGrade,
      didPass: didPass ?? this.didPass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseId': courseId,
      'courseName': courseName,
      'requiredToPass': requiredToPass,
      'requiredGradeToPass': requiredGradeToPass,
      'averageGrade': averageGrade,
      'didPass': didPass,
    };
  }

  factory TotalStudentMark.fromMap(Map<String, dynamic> map) {
    return TotalStudentMark(
      courseId: map['courseId'] as int,
      courseName: map['courseName'] as String,
      requiredToPass: map['requiredToPass'] as bool,
      requiredGradeToPass: map['requiredGradeToPass'] as int,
      averageGrade: map['averageGrade'] as double,
      didPass: map['didPass'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalStudentMark.fromJson(String source) =>
      TotalStudentMark.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FinalStudentScore(courseId: $courseId, courseName: $courseName, requiredToPass: $requiredToPass, requiredGradeToPass: $requiredGradeToPass, averageGrade: $averageGrade, didPass: $didPass)';
  }

  @override
  bool operator ==(covariant TotalStudentMark other) {
    if (identical(this, other)) return true;

    return other.courseId == courseId &&
        other.courseName == courseName &&
        other.requiredToPass == requiredToPass &&
        other.requiredGradeToPass == requiredGradeToPass &&
        other.averageGrade == averageGrade &&
        other.didPass == didPass;
  }

  @override
  int get hashCode {
    return courseId.hashCode ^
        courseName.hashCode ^
        requiredToPass.hashCode ^
        requiredGradeToPass.hashCode ^
        averageGrade.hashCode ^
        didPass.hashCode;
  }
}
