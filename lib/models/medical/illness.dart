// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Illness {
  final int id;
  String name;
  Illness({
    required this.id,
    required this.name,
  });

  Illness copyWith({
    int? id,
    String? name,
  }) {
    return Illness(
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

  factory Illness.fromMap(Map<String, dynamic> map) {
    return Illness(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Illness.fromJson(String source) =>
      Illness.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Illness(id: $id, name: $name)';

  @override
  bool operator ==(covariant Illness other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
