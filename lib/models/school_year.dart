// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SchoolYear {
  int id;
  String details;
  SchoolYear({
    required this.id,
    required this.details,
  });

  SchoolYear copyWith({
    int? id,
    String? details,
  }) {
    return SchoolYear(
      id: id ?? this.id,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'details': details,
    };
  }

  factory SchoolYear.fromMap(Map<String, dynamic> map) {
    return SchoolYear(
      id: map['id'] as int,
      details: map['details'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolYear.fromJson(String source) =>
      SchoolYear.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SchoolYear(id: $id, details: $details)';

  @override
  bool operator ==(covariant SchoolYear other) {
    if (identical(this, other)) return true;

    return other.id == id && other.details == details;
  }

  @override
  int get hashCode => id.hashCode ^ details.hashCode;
}
