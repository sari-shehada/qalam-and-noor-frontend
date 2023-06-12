import 'dart:convert';

import 'package:kalam_noor/models/weather_api/weather_forecast.dart';
import 'package:http/http.dart' as http;

class WeatherForecastAPI {
  static String get key => '439bfacf694a42d8b396dbb8314ee4eb';
  static String get latitude => '34.077592';
  static String get longitude => '36.768863';
  static Future<WeatherForecast> getCurrentWeather() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.weatherbit.io/v2.0/current?lat=$latitude&lon=$longitude&lang=ar&key=$key'),
    );
    return WeatherForecast.fromMap(
      ((jsonDecode(response.body) as Map<String, dynamic>)['data'] as List)[0]
          as Map<String, dynamic>,
    );
  }
}
