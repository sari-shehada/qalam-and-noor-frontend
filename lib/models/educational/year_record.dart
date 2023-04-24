// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class YearRecord {
  int id;
  int classId;
  int? schoolYearClassroomId;
  int studentId;
  bool? didPass;
  YearRecord({
    required this.id,
    required this.classId,
    required this.schoolYearClassroomId,
    required this.studentId,
    required this.didPass,
  });

  YearRecord copyWith({
    int? id,
    int? classId,
    int? schoolYearClassroomId,
    int? studentId,
    bool? didPass,
  }) {
    return YearRecord(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      schoolYearClassroomId:
          schoolYearClassroomId ?? this.schoolYearClassroomId,
      studentId: studentId ?? this.studentId,
      didPass: didPass ?? this.didPass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classId': classId,
      'schoolYearClassroomId': schoolYearClassroomId,
      'studentId': studentId,
      'didPass': didPass,
    };
  }

  factory YearRecord.fromMap(Map<String, dynamic> map) {
    return YearRecord(
      id: map['id'] as int,
      classId: map['classId'] as int,
      schoolYearClassroomId: map['schoolYearClassroomId'] != null
          ? map['schoolYearClassroomId'] as int
          : null,
      studentId: map['studentId'] as int,
      didPass: map['didPass'] != null ? map['didPass'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory YearRecord.fromJson(String source) =>
      YearRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'YearRecord(id: $id, classId: $classId, schoolYearClassroomId: $schoolYearClassroomId, studentId: $studentId, didPass: $didPass)';
  }

  @override
  bool operator ==(covariant YearRecord other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.classId == classId &&
        other.schoolYearClassroomId == schoolYearClassroomId &&
        other.studentId == studentId &&
        other.didPass == didPass;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        classId.hashCode ^
        schoolYearClassroomId.hashCode ^
        studentId.hashCode ^
        didPass.hashCode;
  }
}
