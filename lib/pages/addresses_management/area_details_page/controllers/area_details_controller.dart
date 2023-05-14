// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/models/address/area.dart';
import 'package:kalam_noor/models/helpers/database_helpers/addresses_db_helper.dart';
import 'package:kalam_noor/pages/addresses_management/area_details_page/views/widgets/add_or_edit_address_dialog.dart';

import '../../main_page/controllers/address_management_controller.dart';
import '../../main_page/controllers/addresses_management_stats_controller.dart';

class AreaDetailsController extends GetxController {
  final Area area;
  late Rx<Future<List<Address>>> addresses;
  Rx<CitiesSortingOption> currentSortingOption = CitiesSortingOption.none.obs;

  AreaDetailsController({
    required this.area,
  }) {
    addresses = getAddressesInArea().obs;
  }

  Future<List<Address>> getAddressesInArea() async {
    List<Address> newAddresses =
        await AddressesDBHelper.instance.getAllByAreaId(areaId: area.id);
    switch (currentSortingOption.value) {
      case CitiesSortingOption.none:
        return newAddresses;
      case CitiesSortingOption.byNameAsc:
        {
          newAddresses.sort(
            (a, b) => a.name.compareTo(b.name),
          );
          return newAddresses;
        }
      case CitiesSortingOption.byNameDesc:
        {
          newAddresses.sort(
            (a, b) => b.name.compareTo(a.name),
          );
          return newAddresses;
        }
    }
  }

  void changeSortingOption(CitiesSortingOption? sortingOption) {
    currentSortingOption.value = sortingOption ?? currentSortingOption.value;
    addresses.value = getAddressesInArea();
  }

  Future<void> addNewAddress() async {
    var result = await Get.dialog(
      AddOrEditAddressDialog(
        argument: area.id,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      Get.find<AddressesManagementStatsController>().refreshAddressesCount();
      addresses.value = getAddressesInArea();
    }
  }

  Future<void> updateAddressInfo(Address address) async {
    var result = await Get.dialog(
      AddOrEditAddressDialog(
        argument: address,
      ),
      barrierDismissible: true,
    );
    if (result == true) {
      addresses.value = getAddressesInArea();
    }
  }

  Future<List<Address>> refreshAddresses() =>
      addresses.value = getAddressesInArea();
}
