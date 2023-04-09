// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  final int id;
  final String name;
  final String? details;
  final int areaId;
  Address({
    required this.id,
    required this.name,
    this.details,
    required this.areaId,
  });

  Address copyWith({
    int? id,
    String? name,
    String? details,
    int? areaId,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      details: details ?? this.details,
      areaId: areaId ?? this.areaId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'details': details,
      'areaId': areaId,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] as int,
      name: map['name'] as String,
      details: map['details'] != null ? map['details'] as String : null,
      areaId: map['areaId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(id: $id, name: $name, details: $details, areaId: $areaId)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.details == details &&
        other.areaId == areaId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ details.hashCode ^ areaId.hashCode;
  }
}
