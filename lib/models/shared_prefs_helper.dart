import 'package:kalam_noor/models/weather_api/weather_forecast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  late SharedPreferences spInstance;
  static late SharedPrefsHelper instance;

  static Future<SharedPrefsHelper> init() async {
    instance = SharedPrefsHelper();
    instance.spInstance = await SharedPreferences.getInstance();
    return instance;
  }

  //Login Status
  Future<bool> getLoginStatus() async {
    return spInstance.getBool(SharedPrefsKeys.loginStatusKey) ?? false;
  }

  Future<void> setLoginStatus(bool val) async {
    await spInstance.setBool(SharedPrefsKeys.loginStatusKey, val);
  }

  Future<void> saveLoginData(int id) async {
    await setLoginStatus(true);
    await spInstance.setInt(SharedPrefsKeys.employeeIdKey, id);
  }

  Future<int> getLoginData() async {
    return spInstance.getInt(SharedPrefsKeys.employeeIdKey) ?? -1;
  }

  Future<bool> deleteLoginData() async {
    await setLoginStatus(false);
    await spInstance.remove(SharedPrefsKeys.employeeIdKey);
    return true;
  }

  Future<bool> clearAll() async {
    return await spInstance.clear();
  }

  Future<void> saveWeatherForecast(WeatherForecast weatherForecast) async {
    await spInstance.setString(
      SharedPrefsKeys.weatherForecastKey,
      weatherForecast.toJson(),
    );
  }

  Future<WeatherForecast> getStoredWeatherForecast() async {
    return WeatherForecast.fromJson(
      spInstance.getString(
            SharedPrefsKeys.weatherForecastKey,
          ) ??
          WeatherForecast(
            temp: 16.0,
            weather: WeatherDescription(
              description: 'غائم جزئيا',
              code: 803,
              icon: 'c03d',
            ),
            wind_spd: 6.18,
            wind_cdir: 'NE',
            rh: 20,
          ).toJson(),
    );
  }
}

class SharedPrefsKeys {
  static String get loginStatusKey => 'isLoggedIn';
  static String get employeeIdKey => 'employeeId';
  static String get weatherForecastKey => 'weatherForecast';
}
