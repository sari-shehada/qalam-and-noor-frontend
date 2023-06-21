// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SchoolClass {
  final int id;
  final String name;
  final int? previousClassId;
  final int yearDropCourseCount;
  SchoolClass({
    required this.id,
    required this.name,
    this.previousClassId,
    required this.yearDropCourseCount,
  });

  SchoolClass copyWith({
    int? id,
    String? name,
    int? previousClassId,
    int? yearDropCourseCount,
  }) {
    return SchoolClass(
      id: id ?? this.id,
      name: name ?? this.name,
      previousClassId: previousClassId ?? this.previousClassId,
      yearDropCourseCount: yearDropCourseCount ?? this.yearDropCourseCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'previousClassId': previousClassId,
      'yearDropCourseCount': yearDropCourseCount,
    };
  }

  factory SchoolClass.fromMap(Map<String, dynamic> map) {
    return SchoolClass(
      id: map['id'] as int,
      name: map['name'] as String,
      previousClassId:
          map['previousClassId'] != null ? map['previousClassId'] as int : null,
      yearDropCourseCount: map['yearDropCourseCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolClass.fromJson(String source) =>
      SchoolClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SchoolClass(id: $id, name: $name, previousClassId: $previousClassId, yearDropCourseCount: $yearDropCourseCount)';
  }

  @override
  bool operator ==(covariant SchoolClass other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.previousClassId == previousClassId &&
        other.yearDropCourseCount == yearDropCourseCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        previousClassId.hashCode ^
        yearDropCourseCount.hashCode;
  }
}
