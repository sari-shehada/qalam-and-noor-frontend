import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/helpers/database_helpers/public_records_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/school_classes_db_helper.dart';
import 'package:kalam_noor/models/public_record.dart';

class PublicRecordController extends GetxController {
  late Rx<Future<List<PublicRecord>>> records;
  Rx<SchoolClass?> selectedClass = Rx<SchoolClass?>(null);
  RxList<SchoolClass> schoolClasses = <SchoolClass>[].obs;
  PublicRecordController() {
    records = getRecords().obs;
    getClasses();
  }

  Future<List<PublicRecord>> getRecords() async {
    if (selectedClass.value != null) {
      return await PublicRecordsDBHelper.instance
          .getByClassId(selectedClass.value!.id);
    }
    return await PublicRecordsDBHelper.instance.getAll();
  }

  void changeClass(SchoolClass? schoolClass) {
    if (schoolClass == null) {
      return;
    }
    if (schoolClass.id == -1) {
      selectedClass.value = null;
    } else {
      selectedClass.value = schoolClass;
    }
    records.value = getRecords();
  }

  Future<List<SchoolClass>> getClasses() async {
    schoolClasses.value = await SchoolClassesDBHelper.instance.getAll();
    return schoolClasses;
  }
}
