// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class YearRecord {
  int id;
  int classId;
  int schoolYearClassroomId;
  int studentId;
  DateTime recordDate;
  bool didPass;
  YearRecord({
    required this.id,
    required this.classId,
    required this.schoolYearClassroomId,
    required this.studentId,
    required this.recordDate,
    required this.didPass,
  });

  YearRecord copyWith({
    int? id,
    int? classId,
    int? schoolYearClassroomId,
    int? studentId,
    DateTime? recordDate,
    bool? didPass,
  }) {
    return YearRecord(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      schoolYearClassroomId:
          schoolYearClassroomId ?? this.schoolYearClassroomId,
      studentId: studentId ?? this.studentId,
      recordDate: recordDate ?? this.recordDate,
      didPass: didPass ?? this.didPass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classId': classId,
      'schoolYearClassroomId': schoolYearClassroomId,
      'studentId': studentId,
      'recordDate': recordDate.millisecondsSinceEpoch,
      'didPass': didPass,
    };
  }

  factory YearRecord.fromMap(Map<String, dynamic> map) {
    return YearRecord(
      id: map['id'] as int,
      classId: map['classId'] as int,
      schoolYearClassroomId: map['schoolYearClassroomId'] as int,
      studentId: map['studentId'] as int,
      recordDate: DateTime.fromMillisecondsSinceEpoch(map['recordDate'] as int),
      didPass: map['didPass'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory YearRecord.fromJson(String source) =>
      YearRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'YearRecord(id: $id, classId: $classId, schoolYearClassroomId: $schoolYearClassroomId, studentId: $studentId, recordDate: $recordDate, didPass: $didPass)';
  }

  @override
  bool operator ==(covariant YearRecord other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.classId == classId &&
        other.schoolYearClassroomId == schoolYearClassroomId &&
        other.studentId == studentId &&
        other.recordDate == recordDate &&
        other.didPass == didPass;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        classId.hashCode ^
        schoolYearClassroomId.hashCode ^
        studentId.hashCode ^
        recordDate.hashCode ^
        didPass.hashCode;
  }
}
