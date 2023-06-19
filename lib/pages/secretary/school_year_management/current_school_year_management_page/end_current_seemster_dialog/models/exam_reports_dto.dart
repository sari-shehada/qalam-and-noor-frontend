// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class ExamReportsDTO {
  final int examId;
  //enum
  final ExamType examType;
  ExamReportsDTO({
    required this.examId,
    required this.examType,
  });

  ExamReportsDTO copyWith({
    int? examId,
    ExamType? examType,
  }) {
    return ExamReportsDTO(
      examId: examId ?? this.examId,
      examType: examType ?? this.examType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'examId': examId,
      'examType': examType.index,
    };
  }

  factory ExamReportsDTO.fromMap(Map<String, dynamic> map) {
    return ExamReportsDTO(
      examId: map['examId'] as int,
      examType: ExamType.values[map['examType'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExamReportsDTO.fromJson(String source) =>
      ExamReportsDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ExamReportsDTO(examId: $examId, examType: $examType)';

  @override
  bool operator ==(covariant ExamReportsDTO other) {
    if (identical(this, other)) return true;

    return other.examId == examId && other.examType == examType;
  }

  @override
  int get hashCode => examId.hashCode ^ examType.hashCode;
}
