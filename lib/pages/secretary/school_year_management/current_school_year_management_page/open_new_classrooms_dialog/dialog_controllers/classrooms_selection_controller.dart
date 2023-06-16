import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/open_new_classrooms_dialog/dialog_controllers/open_new_classrooms_dialog_controller.dart';

import '../../../../../../models/educational/classroom.dart';
import '../../../../../../models/helpers/database_helpers/classrooms_db_helper.dart';

class ClassroomsSelectionController extends GetxController {
  Rx<OpenNewClassroomsLoadingStatus> classroomsLoadingStatus =
      OpenNewClassroomsLoadingStatus.isLoading.obs;
  RxList<Classroom> availableClassrooms = <Classroom>[].obs;
  RxList<Classroom> unAvailableClassrooms = <Classroom>[].obs;
  RxList<Classroom> toBeOpenedClassrooms = <Classroom>[].obs;
  RxList<Classroom> toBeClosedClassrooms = <Classroom>[].obs;

  @override
  void onInit() {
    Get.find<OpenNewClassroomsDialogController>().selectedClass.stream.listen(
      (event) {
        reloadAll();
      },
    );
    super.onInit();
  }

  reloadAll() {
    availableClassrooms.clear();
    unAvailableClassrooms.clear();
    toBeOpenedClassrooms.clear();
    toBeClosedClassrooms.clear();
    loadClassroomsInClass();
  }

  toggleToOpenClassroom(Classroom classroom) {
    if (toBeOpenedClassrooms.contains(classroom)) {
      toBeOpenedClassrooms.remove(classroom);
      return;
    }
    toBeOpenedClassrooms.add(classroom);
  }

  toggleToCloseClassroom(Classroom classroom) {
    if (toBeClosedClassrooms.contains(classroom)) {
      toBeClosedClassrooms.remove(classroom);
      return;
    }
    toBeClosedClassrooms.add(classroom);
  }

  void loadClassroomsInClass() async {
    try {
      int classId =
          Get.find<OpenNewClassroomsDialogController>().selectedClass.value!.id;
      classroomsLoadingStatus.value = OpenNewClassroomsLoadingStatus.isLoading;
      availableClassrooms.value = await getAvailableToOpenClassrooms(classId);
      unAvailableClassrooms.value = await getAlreadyOpenClassrooms(classId);
      classroomsLoadingStatus.value = OpenNewClassroomsLoadingStatus.hasData;
    } catch (e) {
      classroomsLoadingStatus.value = OpenNewClassroomsLoadingStatus.hasError;
    }
  }

  Future<List<Classroom>> getAlreadyOpenClassrooms(int classId) async {
    return await ClassroomDBHelper.instance.getAlreadyOpenClassroomsByClassId(
      classId,
    );
  }

  Future<List<Classroom>> getAvailableToOpenClassrooms(int classId) async {
    return await ClassroomDBHelper.instance.getAllAvailableClassroomsByClassId(
      classId,
    );
  }
}
