// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SchoolYear {
  final int id;
  final String name;
  final bool isFinished;
  final int? previousSchoolYearId;
  SchoolYear({
    required this.id,
    required this.name,
    required this.isFinished,
    required this.previousSchoolYearId,
  });

  SchoolYear copyWith({
    int? id,
    String? name,
    bool? isFinished,
    int? previousSchoolYearId,
  }) {
    return SchoolYear(
      id: id ?? this.id,
      name: name ?? this.name,
      isFinished: isFinished ?? this.isFinished,
      previousSchoolYearId: previousSchoolYearId ?? this.previousSchoolYearId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isFinished': isFinished,
      'previousSchoolYearId': previousSchoolYearId,
    };
  }

  factory SchoolYear.fromMap(Map<String, dynamic> map) {
    return SchoolYear(
      id: map['id'] as int,
      name: map['name'] as String,
      isFinished: map['isFinished'] as bool,
      previousSchoolYearId: map['previousSchoolYearId'] != null
          ? map['previousSchoolYearId'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolYear.fromJson(String source) =>
      SchoolYear.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SchoolYear(id: $id, name: $name, isFinished: $isFinished, previousSchoolYearId: $previousSchoolYearId)';
  }

  @override
  bool operator ==(covariant SchoolYear other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.isFinished == isFinished &&
        other.previousSchoolYearId == previousSchoolYearId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        isFinished.hashCode ^
        previousSchoolYearId.hashCode;
  }
}
