import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/class.dart';
import 'package:kalam_noor/models/helpers/database_helper.dart';

class SchoolClassesManagementController extends GetxController {
  late Future<List<Class>> classes;

  SchoolClassesManagementController() {
    classes = getClassesList();
  }

  Future<List<Class>> getClassesList() async {
    return await DatabaseHelper.getCurrentSchoolClasses();
  }
}
