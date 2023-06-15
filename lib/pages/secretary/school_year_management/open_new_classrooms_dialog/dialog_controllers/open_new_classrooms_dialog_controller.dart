import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/helpers/database_helpers/classrooms_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/school_classes_db_helper.dart';

class OpenNewClassroomsDialogController extends GetxController {
  Rx<OpenNewClassroomsLoadingStatus> classesLoadingStatus =
      OpenNewClassroomsLoadingStatus.isLoading.obs;
  Rx<OpenNewClassroomsLoadingStatus> classroomsLoadingStatus =
      OpenNewClassroomsLoadingStatus.isLoading.obs;
  Rx<SchoolClass?> selectedClass = Rx<SchoolClass?>(null);
  RxList<SchoolClass> schoolClasses = <SchoolClass>[].obs;
  RxList<Classroom> classrooms = <Classroom>[].obs;

  @override
  void onInit() {
    loadSchoolClasses();
    super.onInit();
  }

  void loadSchoolClasses() async {
    try {
      classesLoadingStatus.value = OpenNewClassroomsLoadingStatus.isLoading;
      schoolClasses.value = await SchoolClassesDBHelper.instance.getAll();
      classesLoadingStatus.value = OpenNewClassroomsLoadingStatus.hasData;
    } catch (e) {
      classesLoadingStatus.value = OpenNewClassroomsLoadingStatus.hasError;
    }
  }

  void selectSchoolClass(SchoolClass schoolClass) {
    if (selectedClass.value == schoolClass) {
      selectedClass.value = null;
    } else {
      selectedClass.value = schoolClass;
    }
  }

  void loadAvailableClassrooms() async {
    try {
      if (selectedClass.value == null) {
        return;
      }
      classroomsLoadingStatus.value = OpenNewClassroomsLoadingStatus.isLoading;
      classrooms.value =
          await ClassroomDBHelper.instance.getAllClassroomsByClassId(
        selectedClass.value!.id,
      );
      classroomsLoadingStatus.value = OpenNewClassroomsLoadingStatus.hasData;
    } catch (e) {
      classroomsLoadingStatus.value = OpenNewClassroomsLoadingStatus.hasError;
    }
  }
}

enum OpenNewClassroomsLoadingStatus {
  isLoading,
  hasData,
  hasError,
}
