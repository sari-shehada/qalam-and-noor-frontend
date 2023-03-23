// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/address/city.dart';

class Area {
  final int id;
  final String name;
  final int cityId;
  City? city;
  Area({
    required this.id,
    required this.name,
    required this.cityId,
  });

  Future<City> getCity() async {
    //TODO: Swap with query later
    city ??= City(id: 1, name: 'النبك');
    return city!;
  }

  Area copyWith({
    int? id,
    String? name,
    int? cityId,
  }) {
    return Area(
      id: id ?? this.id,
      name: name ?? this.name,
      cityId: cityId ?? this.cityId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'cityId': cityId,
    };
  }

  factory Area.fromMap(Map<String, dynamic> map) {
    return Area(
      id: map['id'] as int,
      name: map['name'] as String,
      cityId: map['cityId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Area.fromJson(String source) =>
      Area.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Area(id: $id, name: $name, cityId: $cityId)';

  @override
  bool operator ==(covariant Area other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.cityId == cityId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ cityId.hashCode;
}
