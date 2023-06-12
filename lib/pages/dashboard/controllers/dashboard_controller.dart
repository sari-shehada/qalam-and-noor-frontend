import 'package:get/get.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';
import 'package:kalam_noor/models/weather_api/weather_api_helper.dart';
import 'package:kalam_noor/models/weather_api/weather_forecast.dart';

import '../../../models/helpers/database_helpers/students_db_helper.dart';

class DashboardController extends GetxController {
  Rx<int?> studentsCount = Rx<int?>(null);
  Rx<DateTime?> serverTime = Rx<DateTime?>(null);
  Rx<WeatherForecast?> weatherForecast = Rx<WeatherForecast?>(null);
  Future<void> registerNewStudent() async {
    NavigationController.toAddNewStudentPage();
  }

  @override
  void onInit() {
    loadDashboardData();
    super.onInit();
  }

  Future<void> loadDashboardData() async {
    loadStudentsCount();
    loadServerTime();
    loadWeatherForecast();
  }

  Future<void> loadStudentsCount() async {
    studentsCount.value = await StudentsDBHelper.instance.getStudentsCount();
  }

  Future<void> loadServerTime() async {
    serverTime.value = DateTime.now();
  }

  Future<void> loadWeatherForecast() async {
    weatherForecast.value = await WeatherForecastAPI.getCurrentWeather();
    weatherForecast.refresh();
  }
}
