// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JobTitle {
  final int id;
  final String name;
  JobTitle({
    required this.id,
    required this.name,
  });

  JobTitle copyWith({
    int? id,
    String? name,
  }) {
    return JobTitle(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory JobTitle.fromMap(Map<String, dynamic> map) {
    return JobTitle(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobTitle.fromJson(String source) =>
      JobTitle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'JobTitle(id: $id, name: $name)';

  @override
  bool operator ==(covariant JobTitle other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
