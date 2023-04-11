// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:kalam_noor/models/helpers/database_helper.dart';
import 'package:kalam_noor/models/medical/vaccine.dart';

class VaccinesManagementController extends GetxController {
  RxInt vaccinesCount = 0.obs;
  late Future<List<Vaccine>> vaccines;

  VaccinesManagementController() {
    vaccines = getVaccines();
  }

  Future<List<Vaccine>> getVaccines() async {
    List<Vaccine> result = await DatabaseHelper.getVaccines();
    vaccinesCount.value = result.length;
    return result;
  }
}




// import 'package:get/get.dart';

// import 'package:kalam_noor/models/helpers/database_helper.dart';
// import 'package:kalam_noor/models/medical/vaccine.dart';

// class VaccinesManagementController extends GetxController {
//   RxInt vaccinesCount = 0.obs;
//   late Future<List<Vaccine>> vaccines;

//   VaccinesManagementController() {
//     vaccines = getVaccines();
//   }

//   Future<List<Vaccine>> getVaccines() async {
//     List<Vaccine> result = await DatabaseHelper.getVaccines();
//     vaccinesCount.value = result.length;
//     return result;
//   }
// }

