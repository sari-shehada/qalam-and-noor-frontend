import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_class.dart';

import '../../../../../../../../models/helpers/database_helpers/school_classes_db_helper.dart';

class ClassSelectionSubPageController extends GetxController {
  ClassSelectionSubPageController();
  late Rx<Future<List<SchoolClass>>> classes;
  late Rx<SchoolClass?> selectedClass = Rx<SchoolClass?>(null);

  @override
  void onInit() {
    classes = getClasses().obs;
    super.onInit();
  }

  Future<List<SchoolClass>> getClasses() async {
    return SchoolClassesDBHelper.instance.getAll();
  }

  reloadClasses() {
    classes.value = getClasses();
  }

  selectClass(SchoolClass schoolClass) {
    selectedClass.value = schoolClass;
  }

  String? validatePageRequirements() {
    if (selectedClass.value == null) {
      return 'يرجى اختيار مرحلة دراسية للمتابعة';
    }
    return null;
  }
}
