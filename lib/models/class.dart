// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Class {
  final int id;
  final String name;
  Class({
    required this.id,
    required this.name,
  });

  Class copyWith({
    int? id,
    String? name,
  }) {
    return Class(
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

  factory Class.fromMap(Map<String, dynamic> map) {
    return Class(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Class.fromJson(String source) =>
      Class.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Class(id: $id, name: $name)';

  @override
  bool operator ==(covariant Class other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
