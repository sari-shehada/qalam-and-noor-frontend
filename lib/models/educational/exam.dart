// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class Exam {
  final int id;
  final int classId;
  final int percentage;
  //enum
  final ExamType type;
  final int sequence;
  Exam({
    required this.id,
    required this.classId,
    required this.percentage,
    required this.type,
    required this.sequence,
  });

  Exam copyWith({
    int? id,
    int? classId,
    int? percentage,
    ExamType? type,
    int? sequence,
  }) {
    return Exam(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      percentage: percentage ?? this.percentage,
      type: type ?? this.type,
      sequence: sequence ?? this.sequence,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classId': classId,
      'percentage': percentage,
      'type': type.index,
      'sequence': sequence,
    };
  }

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      id: map['id'] as int,
      classId: map['classId'] as int,
      percentage: map['percentage'] as int,
      type: ExamType.values[map['type'] as int],
      sequence: map['sequence'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Exam.fromJson(String source) =>
      Exam.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Exam(id: $id, classId: $classId, percentage: $percentage, type: $type, sequence: $sequence)';
  }

  @override
  bool operator ==(covariant Exam other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.classId == classId &&
        other.percentage == percentage &&
        other.type == type &&
        other.sequence == sequence;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        classId.hashCode ^
        percentage.hashCode ^
        type.hashCode ^
        sequence.hashCode;
  }
}
