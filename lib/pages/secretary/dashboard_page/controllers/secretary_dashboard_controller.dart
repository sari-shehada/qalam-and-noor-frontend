import 'dart:math';

import 'package:get/get.dart';
import '../../../../controllers/navigation_controller.dart';
import '../../../../models/helpers/database_helpers/employees_db_helper.dart';
import '../../../../models/weather_api/weather_api_helper.dart';
import '../../../../models/weather_api/weather_forecast.dart';
import '../views/widgets/daily_quote_widget.dart';

import '../../../../models/helpers/database_helpers/students_db_helper.dart';

class SecretaryDashboardController extends GetxController {
  Rx<int?> studentsCount = Rx<int?>(null);
  Rx<int?> teachersCount = Rx<int?>(null);
  Rx<DateTime?> serverTime = Rx<DateTime?>(null);
  Rx<WeatherForecast?> weatherForecast = Rx<WeatherForecast?>(null);
  Rx<DailyQuote?> dailyQuote = Rx<DailyQuote?>(null);
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
    loadTeachersCount();
    loadDailyQuote();
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

  Future<void> loadTeachersCount() async {
    await EmployeesDBHelper.instance.getAllTeachers().then(
          (value) => teachersCount.value = value.length,
        );
  }

  Future<void> loadDailyQuote() async {
    await Future.delayed(2.seconds);
    Random random = Random();
    dailyQuote.value = dailyQuotes[random.nextInt(dailyQuotes.length)];
  }
}
