// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/student.dart';

class FullStudentInfo {
  final Student student;
  final Father father;
  FullStudentInfo({
    required this.student,
    required this.father,
  });

  FullStudentInfo copyWith({
    Student? student,
    Father? father,
  }) {
    return FullStudentInfo(
      student: student ?? this.student,
      father: father ?? this.father,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'student': student.toMap(),
      'father': father.toMap(),
    };
  }

  factory FullStudentInfo.fromMap(Map<String, dynamic> map) {
    return FullStudentInfo(
      student: Student.fromMap(map['student'] as Map<String, dynamic>),
      father: Father.fromMap(map['father'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FullStudentInfo.fromJson(String source) =>
      FullStudentInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FullStudentInfo(student: $student, father: $father)';

  @override
  bool operator ==(covariant FullStudentInfo other) {
    if (identical(this, other)) return true;

    return other.student == student && other.father == father;
  }

  @override
  int get hashCode => student.hashCode ^ father.hashCode;
}
