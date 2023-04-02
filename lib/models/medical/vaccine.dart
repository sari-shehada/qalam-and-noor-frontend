// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Vaccine {
  final int id;
  String name;
  Vaccine({
    required this.id,
    required this.name,
  });

  Vaccine copyWith({
    int? id,
    String? name,
  }) {
    return Vaccine(
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

  factory Vaccine.fromMap(Map<String, dynamic> map) {
    return Vaccine(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vaccine.fromJson(String source) =>
      Vaccine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Vaccine(id: $id, name: $name)';

  @override
  bool operator ==(covariant Vaccine other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
