import 'dart:math';
import 'package:get/get.dart';
import '../../../../models/helpers/database_helpers/statistics_db_helper.dart';
import '../../../../models/weather_api/weather_api_helper.dart';
import '../../../../models/weather_api/weather_forecast.dart';
import '../../../secretary/dashboard_page/views/widgets/daily_quote_widget.dart';
import '../../../secretary/dashboard_page/views/widgets/useful_links_list_widget.dart';
import '../models/psychological_instructor_dashboard_cards_info.dart';

class PsychologicalInstructorDashboardController extends GetxController {
  Rx<PsychologicalInstructorDashboardCardsInfo?>
      psychologicalInstructorDashboardCardsInfo =
      Rx<PsychologicalInstructorDashboardCardsInfo?>(null);
  Rx<DailyQuote?> dailyQuote = Rx<DailyQuote?>(null);
  Rx<DateTime?> serverTime = Rx<DateTime?>(null);
  Rx<WeatherForecast?> weatherForecast = Rx<WeatherForecast?>(null);
  RxList<UsefulLink> usefulLinks = <UsefulLink>[].obs;
  @override
  void onInit() {
    loadDashboardData();
    super.onInit();
  }

  void loadDashboardData() {
    getCardsInfo();
    loadServerTime();
    loadWeatherForecast();
    loadDailyQuote();
    loadUsefulLinks();
  }

  Future<void> getCardsInfo() async {
    psychologicalInstructorDashboardCardsInfo.value =
        PsychologicalInstructorDashboardCardsInfo(
      psychologicalStatusesToStudentCount: await StatisticsDBHelper
          .getTopPsychologicalStatusesByAffectedStudents(),
      malePsychologicalStatusesToStudentCount: await StatisticsDBHelper
          .getTopPsychologicalStatusesByAffectedMaleStudents(),
      femalePsychologicalStatusesToStudentCount: await StatisticsDBHelper
          .getTopPsychologicalStatusesByAffectedFemaleStudents(),
      currentDateAndTime: DateTime.now(),
    );
  }

  Future<void> loadDailyQuote() async {
    await Future.delayed(2.seconds);
    Random random = Random();
    dailyQuote.value = dailyQuotes[random.nextInt(dailyQuotes.length)];
  }

  Future<void> loadServerTime() async {
    serverTime.value = DateTime.now();
  }

  Future<void> loadWeatherForecast() async {
    weatherForecast.value = await WeatherForecastAPI.getCurrentWeather();
    weatherForecast.refresh();
  }

  Future<void> loadUsefulLinks() async {
    await Future.delayed(2.seconds);
    usefulLinks.value = usefulLinksList;
  }
}
