// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JobTitle {
  final int id;
  final String name;
  final String details;
  JobTitle({
    required this.id,
    required this.name,
    required this.details,
  });

  JobTitle copyWith({
    int? id,
    String? name,
    String? details,
  }) {
    return JobTitle(
      id: id ?? this.id,
      name: name ?? this.name,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'details': details,
    };
  }

  factory JobTitle.fromMap(Map<String, dynamic> map) {
    return JobTitle(
      id: map['id'] as int,
      name: map['name'] as String,
      details: map['details'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobTitle.fromJson(String source) =>
      JobTitle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'JobTitle(id: $id, name: $name, details: $details)';

  @override
  bool operator ==(covariant JobTitle other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.details == details;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ details.hashCode;
}
