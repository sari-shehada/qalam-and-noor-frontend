// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/address/area.dart';

class Address {
  final int id;
  final String name;
  final String details;
  final int areaId;
  Area? area;
  Address({
    required this.id,
    required this.name,
    required this.details,
    required this.areaId,
    this.area,
  });

  Future<Area> getArea() async {
    //TODO: swap with query later
    area ??= Area(id: 111, name: 'الحي الغربي', cityId: 1);
    return area!;
  }

  Address copyWith({
    int? id,
    String? name,
    String? details,
    int? areaId,
    Area? area,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      details: details ?? this.details,
      areaId: areaId ?? this.areaId,
      area: area ?? this.area,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'details': details,
      'areaId': areaId,
      'area': area?.toMap(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] as int,
      name: map['name'] as String,
      details: map['details'] as String,
      areaId: map['areaId'] as int,
      area: map['area'] != null
          ? Area.fromMap(map['area'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(id: $id, name: $name, details: $details, areaId: $areaId, area: $area)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.details == details &&
        other.areaId == areaId &&
        other.area == area;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        details.hashCode ^
        areaId.hashCode ^
        area.hashCode;
  }
}
