import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/employee.dart';
import 'package:kalam_noor/models/educational/course.dart';
import 'package:kalam_noor/models/helpers/database_helpers/courses_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/employees_db_helper.dart';
import '../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../../tools/ui_tools/buttons.dart';

class AddOrEditCourseDialogController extends GetxController {
  RxBool isEditMode = false.obs;
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController courseTotalGradeController =
      TextEditingController();
  final Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;
  RxList<Employee> teachers = <Employee>[].obs;
  late final int classId;

  RxBool isEnriching = true.obs;
  late Course course;
  RxBool isProcessing = true.obs;
  Rx<Employee?> selectedTeacher = Rx<Employee?>(null);

  AddOrEditCourseDialogController({
    dynamic argument,
  }) {
    if (argument is Course) {
      course = argument;
      isEditMode.value = true;
      courseNameController.text = course.name;
      isEnriching.value = argument.isEnriching;
      courseTotalGradeController.text = course.totalGrade.toString();
    } else if (argument is int) {
      classId = argument;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getTeachers();
  }

  Future<void> getCurrentTeacher() async {
    selectedTeacher.value =
        await EmployeesDBHelper.instance.getById(course.teacherId);
  }

  Future<void> getTeachers() async {
    isProcessing.value = true;
    teachers.value = await EmployeesDBHelper.instance.getAllTeachers();
    if (isEditMode.value) {
      await getCurrentTeacher();
    }
    isProcessing.value = false;
  }

  void selectTeacher(Employee? teacher) {
    if (teacher == null) {
      return;
    }
    selectedTeacher.value = teacher;
  }

//TODO:fix later
  bool validateFields() {
    if (courseNameController.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
          title: 'اسم مادة فارغ', message: 'الرجاء ملء حقل اسم المادة');
      return false;
    } else if (courseTotalGradeController.text.isEmpty) {
      SnackBarService.showErrorSnackBar(
          title: 'حقل العلامة الكاملة فارغ',
          message: 'الرجاء ملء حقل العلامة الكاملة');
      return false;
    } else if (selectedTeacher.value == null) {
      SnackBarService.showErrorSnackBar(
          title: "لم يتم اختيار مدرس المادة",
          message: "الرجاء اختيار مدرس المقرر");
    }
    return true;
  }

  Future<void> addCourse() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }

      Course course = Course(
          id: -1,
          classId: classId,
          teacherId: selectedTeacher.value!.id,
          name: courseNameController.text,
          totalGrade: double.parse(courseTotalGradeController.text),
          isEnriching: isEnriching.value);
      await CoursesDBHelper.instance.insert(course);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  void toggleType() {
    isEnriching.value = !isEnriching.value;
  }

//TODO:fix later
  Future<void> updateCourseInfo() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      Course newCourse = Course(
        id: course.id,
        classId: course.classId,
        teacherId: selectedTeacher.value!.id,
        name: courseNameController.text,
        totalGrade: double.parse(courseTotalGradeController.text),
        isEnriching: isEnriching.value,
      );
      if (course == newCourse) {
        Get.back(result: false);
        SnackBarService.showNeutralSnackBar(
          title: 'لا تعديلات',
          message: 'ما من تعديلات لحفظها',
        );
        return;
      }
      course = course.copyWith(
        name: courseNameController.text,
        totalGrade: double.parse(courseTotalGradeController.text),
        teacherId: selectedTeacher.value?.id,
        isEnriching: isEnriching.value,
      );
      await CoursesDBHelper.instance.update(course);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
