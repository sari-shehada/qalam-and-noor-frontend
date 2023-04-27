import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/helpers/database_helpers/school_classes_db_helper.dart';

class SchoolClassesManagementController extends GetxController {
  late Future<List<SchoolClass>> classes;

  SchoolClassesManagementController() {
    classes = getClassesList();
  }

  Future<List<SchoolClass>> getClassesList() async {
    return await SchoolClassesDBHelper.instance.getAll();
  }
}
