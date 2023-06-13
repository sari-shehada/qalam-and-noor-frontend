// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class WeatherForecast {
  final num temp;
  final num wind_spd;
  final String wind_cdir;
  final num rh;
  final WeatherDescription weather;
  WeatherForecast({
    required this.temp,
    required this.wind_spd,
    required this.wind_cdir,
    required this.rh,
    required this.weather,
  });

  WeatherForecast copyWith({
    num? temp,
    num? wind_spd,
    String? wind_cdir,
    num? rh,
    WeatherDescription? weather,
  }) {
    return WeatherForecast(
      temp: temp ?? this.temp,
      wind_spd: wind_spd ?? this.wind_spd,
      wind_cdir: wind_cdir ?? this.wind_cdir,
      rh: rh ?? this.rh,
      weather: weather ?? this.weather,
    );
  }

  IconData getWindDirectionIcon() {
    switch (wind_cdir) {
      case 'N':
        {
          return Icons.north_rounded;
        }
      case 'NE':
        {
          return Icons.north_east_rounded;
        }
      case 'NW':
        {
          return Icons.north_west_rounded;
        }
      case 'S':
        {
          return Icons.south_rounded;
        }
      case 'SE':
        {
          return Icons.south_east_rounded;
        }
      case 'SW':
        {
          return Icons.south_west_rounded;
        }
      case 'E':
        {
          return Icons.east_rounded;
        }
      case 'W':
        {
          return Icons.west_rounded;
        }
      default:
        {
          return Icons.north_west_rounded;
        }
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'wind_spd': wind_spd,
      'wind_cdir': wind_cdir,
      'rh': rh,
      'weather': weather.toMap(),
    };
  }

  factory WeatherForecast.fromMap(Map<String, dynamic> map) {
    return WeatherForecast(
      temp: map['temp'] as num,
      wind_spd: map['wind_spd'] as num,
      wind_cdir: map['wind_cdir'] as String,
      rh: map['rh'] as num,
      weather:
          WeatherDescription.fromMap(map['weather'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherForecast.fromJson(String source) =>
      WeatherForecast.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherForecast(temp: $temp, wind_spd: $wind_spd, wind_cdir: $wind_cdir, rh: $rh, weather: $weather)';
  }

  @override
  bool operator ==(covariant WeatherForecast other) {
    if (identical(this, other)) return true;

    return other.temp == temp &&
        other.wind_spd == wind_spd &&
        other.wind_cdir == wind_cdir &&
        other.rh == rh &&
        other.weather == weather;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        wind_spd.hashCode ^
        wind_cdir.hashCode ^
        rh.hashCode ^
        weather.hashCode;
  }
}

class WeatherDescription {
  final String description;
  final int code;
  final String icon;
  WeatherDescription({
    required this.description,
    required this.code,
    required this.icon,
  });

  WeatherDescription copyWith({
    String? description,
    int? code,
    String? icon,
  }) {
    return WeatherDescription(
      description: description ?? this.description,
      code: code ?? this.code,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'code': code,
      'icon': icon,
    };
  }

  factory WeatherDescription.fromMap(Map<String, dynamic> map) {
    return WeatherDescription(
      description: map['description'] as String,
      code: map['code'] as int,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherDescription.fromJson(String source) =>
      WeatherDescription.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WeatherDescription(description: $description, code: $code, icon: $icon)';

  @override
  bool operator ==(covariant WeatherDescription other) {
    if (identical(this, other)) return true;

    return other.description == description &&
        other.code == code &&
        other.icon == icon;
  }

  @override
  int get hashCode => description.hashCode ^ code.hashCode ^ icon.hashCode;
}
