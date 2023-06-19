// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'exam_reports_dto.dart';

class ClassroomReportsDTO {
  final int classroomId;
  final String classroomName;
  final List<ExamReportsDTO> examReports;
  ClassroomReportsDTO({
    required this.classroomId,
    required this.classroomName,
    required this.examReports,
  });

  ClassroomReportsDTO copyWith({
    int? classroomId,
    String? classroomName,
    List<ExamReportsDTO>? examReports,
  }) {
    return ClassroomReportsDTO(
      classroomId: classroomId ?? this.classroomId,
      classroomName: classroomName ?? this.classroomName,
      examReports: examReports ?? this.examReports,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classroomId': classroomId,
      'classroomName': classroomName,
      'examReports': examReports.map((x) => x.toMap()).toList(),
    };
  }

  factory ClassroomReportsDTO.fromMap(Map<String, dynamic> map) {
    return ClassroomReportsDTO(
      classroomId: map['classroomId'] as int,
      classroomName: map['classroomName'] as String,
      examReports: List<ExamReportsDTO>.from(
        (map['examReports'] as List<int>).map<ExamReportsDTO>(
          (x) => ExamReportsDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassroomReportsDTO.fromJson(String source) =>
      ClassroomReportsDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ClassroomReportsDTO(classroomId: $classroomId, classroomName: $classroomName, examReports: $examReports)';

  @override
  bool operator ==(covariant ClassroomReportsDTO other) {
    if (identical(this, other)) return true;

    return other.classroomId == classroomId &&
        other.classroomName == classroomName &&
        listEquals(other.examReports, examReports);
  }

  @override
  int get hashCode =>
      classroomId.hashCode ^ classroomName.hashCode ^ examReports.hashCode;
}
