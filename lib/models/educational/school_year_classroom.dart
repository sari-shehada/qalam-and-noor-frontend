// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SchoolYearClassroom {
  int id;
  int schoolYearId;
  int classRoomId;
  SchoolYearClassroom({
    required this.id,
    required this.schoolYearId,
    required this.classRoomId,
  });

  SchoolYearClassroom copyWith({
    int? id,
    int? schoolYearId,
    int? classRoomId,
  }) {
    return SchoolYearClassroom(
      id: id ?? this.id,
      schoolYearId: schoolYearId ?? this.schoolYearId,
      classRoomId: classRoomId ?? this.classRoomId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'schoolYearId': schoolYearId,
      'classRoomId': classRoomId,
    };
  }

  factory SchoolYearClassroom.fromMap(Map<String, dynamic> map) {
    return SchoolYearClassroom(
      id: map['id'] as int,
      schoolYearId: map['schoolYearId'] as int,
      classRoomId: map['classRoomId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolYearClassroom.fromJson(String source) =>
      SchoolYearClassroom.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SchoolYearClassroom(id: $id, schoolYearId: $schoolYearId, classRoomId: $classRoomId)';

  @override
  bool operator ==(covariant SchoolYearClassroom other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.schoolYearId == schoolYearId &&
        other.classRoomId == classRoomId;
  }

  @override
  int get hashCode =>
      id.hashCode ^ schoolYearId.hashCode ^ classRoomId.hashCode;
}
