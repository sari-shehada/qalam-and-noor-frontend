// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class Exam {
  int id;
  int classId;
  int percentage;
  //enum
  final ExamType examType;
  Exam({
    required this.id,
    required this.classId,
    required this.percentage,
    required this.examType,
  });

  Exam copyWith({
    int? id,
    int? classId,
    int? percentage,
    ExamType? examType,
  }) {
    return Exam(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      percentage: percentage ?? this.percentage,
      examType: examType ?? this.examType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classId': classId,
      'percentage': percentage,
      'examType': examType.index,
    };
  }

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      id: map['id'] as int,
      classId: map['classId'] as int,
      percentage: map['percentage'] as int,
      examType: ExamType.values[map['examType'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory Exam.fromJson(String source) =>
      Exam.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Exam(id: $id, classId: $classId, percentage: $percentage, examType: $examType)';
  }

  @override
  bool operator ==(covariant Exam other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.classId == classId &&
        other.percentage == percentage &&
        other.examType == examType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        classId.hashCode ^
        percentage.hashCode ^
        examType.hashCode;
  }
}
