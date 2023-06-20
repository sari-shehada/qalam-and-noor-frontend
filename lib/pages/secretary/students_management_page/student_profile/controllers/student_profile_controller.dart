import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/classroom.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/educational/school_year.dart';
import 'package:kalam_noor/models/helpers/database_helpers/students_db_helper.dart';
import '../../../../../models/agendas/mother.dart';
import '../../../../../models/agendas/student.dart';
import '../../../../../models/helpers/database_helpers/medical_records_db_helper.dart';
import '../../../../../models/medical/medical_record.dart';
import '../../new_student_registration/address_information/models/student_address_info.dart';
import '../../../../../models/agendas/father.dart';
import '../models/student_illness_info.dart';
import '../models/student_profile_model.dart';
import '../models/student_psychological_status_info.dart';
import '../models/student_vaccines_info.dart';

class StudentProfileController extends GetxController {
  StudentProfileController({required this.student}) {
    getAllStudentInfo();
  }

  //Class Members
  final Rx<Student> student;
  //Late Class Members
  late List<Student> studentSiblings;
  late Father father;
  late Mother mother;
  late StudentAddressInfo studentAddressInfo;
  late MedicalRecord medicalRecord;
  late List<PsychologicalStatusInfo> studentPsychologicalStatuses;
  late List<StudentIllnessInfo> studentIllnessesInfo;
  late List<StudentVaccineInfo> studentVaccinesInfo;
  late List<SchoolYear> studentYearRecords;
  late StudentCurrentClassInfo? currentClassInfo;
  late StudentProfileInfo fullInfo;
  //Observables
  RxBool isLoading = true.obs;

  Future<void> getAllStudentInfo() async {
    isLoading.value = true;
    fullInfo =
        await StudentsDBHelper.instance.getStudentProfile(student.value.id);
    studentSiblings = fullInfo.sibling;
    father = fullInfo.father;
    mother = fullInfo.mother;
    studentAddressInfo = StudentAddressInfo(
        city: fullInfo.city, area: fullInfo.area, address: fullInfo.address);
    medicalRecord = await getMedicalRecord();
    studentPsychologicalStatuses = fullInfo.psychologicalStatuses;
    studentIllnessesInfo = fullInfo.illnesses;
    studentVaccinesInfo = fullInfo.vaccines;
    studentYearRecords = fullInfo.studentSchoolYears;
    if (fullInfo.currentClass != null && fullInfo.currentClaasRoom != null) {
      currentClassInfo = StudentCurrentClassInfo(
        schoolClass: fullInfo.currentClass!,
        classroom: fullInfo.currentClaasRoom!,
      );
    } else {
      currentClassInfo = null;
    }
    isLoading.value = false;
  }

  //#region Future Getters

  Future<MedicalRecord> getMedicalRecord() async {
    return MedicalRecordsDBHelper.instance.getById(student.value.id);
  }

  //#endregion
}

class StudentCurrentClassInfo {
  StudentCurrentClassInfo({
    required this.schoolClass,
    required this.classroom,
  });
  final SchoolClass schoolClass;
  final Classroom classroom;
}
