// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherForecast {
  final double temp;
  final WeatherDescription weather;
  WeatherForecast({
    required this.temp,
    required this.weather,
  });

  WeatherForecast copyWith({
    double? temp,
    WeatherDescription? weather,
  }) {
    return WeatherForecast(
      temp: temp ?? this.temp,
      weather: weather ?? this.weather,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'weather': weather.toMap(),
    };
  }

  factory WeatherForecast.fromMap(Map<String, dynamic> map) {
    return WeatherForecast(
      temp: map['temp'] as double,
      weather:
          WeatherDescription.fromMap(map['weather'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherForecast.fromJson(String source) =>
      WeatherForecast.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WeatherForecast(temp: $temp, weather: $weather)';

  @override
  bool operator ==(covariant WeatherForecast other) {
    if (identical(this, other)) return true;

    return other.temp == temp && other.weather == weather;
  }

  @override
  int get hashCode => temp.hashCode ^ weather.hashCode;
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
