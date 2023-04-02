// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Classroom {
  int id;
  int classId;
  String name;
  int maxCapacity;
  Classroom({
    required this.id,
    required this.classId,
    required this.name,
    required this.maxCapacity,
  });

  Classroom copyWith({
    int? id,
    int? classId,
    String? name,
    int? maxCapacity,
  }) {
    return Classroom(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      name: name ?? this.name,
      maxCapacity: maxCapacity ?? this.maxCapacity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classId': classId,
      'name': name,
      'maxCapacity': maxCapacity,
    };
  }

  factory Classroom.fromMap(Map<String, dynamic> map) {
    return Classroom(
      id: map['id'] as int,
      classId: map['classId'] as int,
      name: map['name'] as String,
      maxCapacity: map['maxCapacity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Classroom.fromJson(String source) =>
      Classroom.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Classroom(id: $id, classId: $classId, name: $name, maxCapacity: $maxCapacity)';
  }

  @override
  bool operator ==(covariant Classroom other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.classId == classId &&
        other.name == name &&
        other.maxCapacity == maxCapacity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        classId.hashCode ^
        name.hashCode ^
        maxCapacity.hashCode;
  }
}
