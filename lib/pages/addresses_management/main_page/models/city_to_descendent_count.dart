// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../models/address/city.dart';

class CityToDescendentCount {
  final City city;
  final int descendentCount;
  CityToDescendentCount({
    required this.city,
    required this.descendentCount,
  });

  CityToDescendentCount copyWith({
    City? city,
    int? descendentCount,
  }) {
    return CityToDescendentCount(
      city: city ?? this.city,
      descendentCount: descendentCount ?? this.descendentCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city.toMap(),
      'descendentCount': descendentCount,
    };
  }

  factory CityToDescendentCount.fromMap(Map<String, dynamic> map) {
    return CityToDescendentCount(
      city: City.fromMap(map['city'] as Map<String, dynamic>),
      descendentCount: map['descendentCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityToDescendentCount.fromJson(String source) =>
      CityToDescendentCount.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CityToDescendentCount(city: $city, descendentCount: $descendentCount)';

  @override
  bool operator ==(covariant CityToDescendentCount other) {
    if (identical(this, other)) return true;

    return other.city == city && other.descendentCount == descendentCount;
  }

  @override
  int get hashCode => city.hashCode ^ descendentCount.hashCode;
}
