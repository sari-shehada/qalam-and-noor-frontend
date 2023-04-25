import 'package:kalam_noor/tools/logic_tools/network_service.dart';

import '../../../../pages/addresses_management/main_page/models/city_to_descendent_count.dart';
import '../../../address/city.dart';

class AddressManagementDBHelper {
  //TODO: change controller name
  String get _controllerName => 'CityController/';
  static AddressManagementDBHelper get instance => AddressManagementDBHelper();

  Future<List<CityToDescendentCount>> getCitiesToAreasCount() async {
    String url = '${_controllerName}GetCitiesToAreasCount';
    List<CityToDescendentCount> citiesToAreasCount =
        await HttpService.getParsed<List<CityToDescendentCount>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return CityToDescendentCount.fromMap(e);
          },
        ).toList();
      },
    );
    print(citiesToAreasCount[0].city);
    final List<CityToDescendentCount> statsList = [];
    citiesToAreasCount.sort(
      (a, b) => b.descendentCount.compareTo(a.descendentCount),
    );

    int pieChartItemsToDisplay = 5;
    int othersCount = 0;
    for (int i = 0; i < citiesToAreasCount.length; i++) {
      if (i < pieChartItemsToDisplay) {
        statsList.add(citiesToAreasCount[i]);
      } else {
        othersCount += statsList[i].descendentCount;
      }
    }
    if (statsList.length > pieChartItemsToDisplay) {
      statsList.add(
        CityToDescendentCount(
            city: City(id: -1, name: 'مدن أخرى'), descendentCount: othersCount),
      );
    }
    return statsList;
  }

  Future<List<CityToDescendentCount>> getCitiesToAddressesCount() async {
    String url = '${_controllerName}GetCitiesToAddressesCount';
    List<CityToDescendentCount> citiesToAreasCount =
        await HttpService.getParsed<List<CityToDescendentCount>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return CityToDescendentCount.fromMap(e);
          },
        ).toList();
      },
    );

    final List<CityToDescendentCount> statsList = [];
    citiesToAreasCount.sort(
      (a, b) => b.descendentCount.compareTo(a.descendentCount),
    );

    int pieChartItemsToDisplay = 5;
    int othersCount = 0;
    for (int i = 0; i < citiesToAreasCount.length; i++) {
      if (i < pieChartItemsToDisplay) {
        statsList.add(citiesToAreasCount[i]);
      } else {
        othersCount += statsList[i].descendentCount;
      }
    }
    if (statsList.length > pieChartItemsToDisplay) {
      statsList.add(
        CityToDescendentCount(
            city: City(id: -1, name: 'مدن أخرى'), descendentCount: othersCount),
      );
    }
    return statsList;
  }
}
