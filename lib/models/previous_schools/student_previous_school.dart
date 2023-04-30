// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentPreviousSchool {
  int id;
  int studentId;
  int previousSchoolId;
  String note;
  StudentPreviousSchool({
    required this.id,
    required this.studentId,
    required this.previousSchoolId,
    required this.note,
  });

  StudentPreviousSchool copyWith({
    int? id,
    int? studentId,
    int? previousSchoolId,
    String? note,
  }) {
    return StudentPreviousSchool(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      previousSchoolId: previousSchoolId ?? this.previousSchoolId,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'studentId': studentId,
      'previousSchoolId': previousSchoolId,
      'note': note,
    };
  }

  factory StudentPreviousSchool.fromMap(Map<String, dynamic> map) {
    return StudentPreviousSchool(
      id: map['id'] as int,
      studentId: map['studentId'] as int,
      previousSchoolId: map['previousSchoolId'] as int,
      note: map['note'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentPreviousSchool.fromJson(String source) =>
      StudentPreviousSchool.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentPreviousSchool(id: $id, studentId: $studentId, previousSchoolId: $previousSchoolId, note: $note)';
  }

  @override
  bool operator ==(covariant StudentPreviousSchool other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.studentId == studentId &&
        other.previousSchoolId == previousSchoolId &&
        other.note == note;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        studentId.hashCode ^
        previousSchoolId.hashCode ^
        note.hashCode;
  }
}
