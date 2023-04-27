// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PreviousSchool {
  int id;
  String name;
  String? details;
  PreviousSchool({
    required this.id,
    required this.name,
    this.details,
  });

  PreviousSchool copyWith({
    int? id,
    String? name,
    String? details,
  }) {
    return PreviousSchool(
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

  factory PreviousSchool.fromMap(Map<String, dynamic> map) {
    return PreviousSchool(
      id: map['id'] as int,
      name: map['name'] as String,
      details: map['details'] != null ? map['details'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PreviousSchool.fromJson(String source) =>
      PreviousSchool.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PreviousSchool(id: $id, name: $name, details: $details)';

  @override
  bool operator ==(covariant PreviousSchool other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.details == details;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ details.hashCode;
}
