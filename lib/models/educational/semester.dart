// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Semester {
  int id;
  String name;
  int schoolYearId;
  int? previousSemesterId;
  bool isDone;
  Semester({
    required this.id,
    required this.name,
    required this.schoolYearId,
    this.previousSemesterId,
    required this.isDone,
  });

  Semester copyWith({
    int? id,
    String? name,
    int? schoolYearId,
    int? previousSemesterId,
    bool? isDone,
  }) {
    return Semester(
      id: id ?? this.id,
      name: name ?? this.name,
      schoolYearId: schoolYearId ?? this.schoolYearId,
      previousSemesterId: previousSemesterId ?? this.previousSemesterId,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'schoolYearId': schoolYearId,
      'previousSemesterId': previousSemesterId,
      'isDone': isDone,
    };
  }

  factory Semester.fromMap(Map<String, dynamic> map) {
    return Semester(
      id: map['id'] as int,
      name: map['name'] as String,
      schoolYearId: map['schoolYearId'] as int,
      previousSemesterId: map['previousSemesterId'] != null
          ? map['previousSemesterId'] as int
          : null,
      isDone: map['isDone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Semester.fromJson(String source) =>
      Semester.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Semester(id: $id, name: $name, schoolYearId: $schoolYearId, previousSemesterId: $previousSemesterId, isDone: $isDone)';
  }

  @override
  bool operator ==(covariant Semester other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.schoolYearId == schoolYearId &&
        other.previousSemesterId == previousSemesterId &&
        other.isDone == isDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        schoolYearId.hashCode ^
        previousSemesterId.hashCode ^
        isDone.hashCode;
  }
}
