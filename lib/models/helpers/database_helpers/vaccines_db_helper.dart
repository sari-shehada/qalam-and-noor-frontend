import 'package:kalam_noor/models/medical/taken_vaccine.dart';
import 'package:kalam_noor/to_be_disposed/data/dummy_data.dart';

abstract class VaccinesDBHelper {
  static Future<TakenVaccine> addStudentTakenVaccine(
      TakenVaccine takenVaccine) async {
    takenVaccine = takenVaccine.copyWith(id: dummyTakenVaccines.length);
    dummyTakenVaccines.add(takenVaccine);
    return takenVaccine;
  }
}
