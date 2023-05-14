import 'package:kalam_noor/models/agendas/family.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/agendas/responsible_person.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/educational/year_record.dart';
import 'package:kalam_noor/models/helpers/database_helpers/mothers_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/responsible_persons_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/families_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/student_illnesses_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/student_previous_schools_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/taken_vaccines_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/year_records_db_helper.dart';
import 'package:kalam_noor/models/medical/illness.dart';
import 'package:kalam_noor/models/medical/student_illness.dart';
import 'package:kalam_noor/models/medical/taken_vaccine.dart';
import 'package:kalam_noor/models/previous_schools/student_previous_school.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/models/family_info.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/models/student_personal_info.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/models/student_registration_info.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';
import '../../medical/medical_record.dart';
import 'father_db_helper.dart';
import 'medical_records_db_helper.dart';

class StudentsDBHelper implements CRUDInterface<Student> {
  String get _controllerName => 'StudentController/';
  static StudentsDBHelper get instance => StudentsDBHelper();

  @override
  Future<List<Student>> getAll() async {
    String url = '${_controllerName}GetStudents';
    List<Student> allStudents =
        await HttpService.getParsed<List<Student>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Student.fromMap(e);
          },
        ).toList();
      },
    );
    return allStudents;
  }

  @override
  Future<Student?> getById(int id) async {
    String url = '${_controllerName}GetStudentById?id=$id';
    Student? student =
        await HttpService.getParsed<Student?, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Student.fromMap(responseData);
      },
    );
    return student;
  }

  Future<int> getFathersCount() async {
    return await getAll().then((value) => value.length);
  }

  @override
  Future<Student> insert(Student object) async {
    String url = '${_controllerName}InsertStudent';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) throw Exception('Couldn\'t add student');
    return object.copyWith(id: result);
  }

  @override
  Future<bool> update(Student object) async {
    String url = '${_controllerName}UpdateStudent';
    int? result =
        await HttpService.post(url: url, serializedBody: object.toJson());
    if (result == null) return false;
    return result == 1;
  }

  Future<Student> registerNewStudent(
      {required StudentRegistrationInfo registrationInfo}) async {
    final FamilyInfo familyInfo = registrationInfo.familyInfo;
    final StudentPersonalInfo personalInfo = registrationInfo.personalInfo;
    Student student = Student(
      id: -1,
      publicRecordId: personalInfo.publicRecordId,
      firstName: personalInfo.firstName,
      isMale: personalInfo.isMale,
      dateOfBirth: personalInfo.dateOfBirth,
      placeOfBirth: personalInfo.placeOfBirth,
      phoneNumber: personalInfo.phoneNumber,
      religion: personalInfo.religion,
      whatsappPhoneNumber: personalInfo.whatsappPhoneNumber,
      incidentNumber: personalInfo.incidentNumber,
      incidentDate: personalInfo.incidentDate,
      landLine: personalInfo.landLine,
      addressId: registrationInfo.address.id,
      joinDate: personalInfo.joinDate,
      leaveDate: null,
      familyId: -1,
    );
    if (familyInfo.family.id == -1) {
      Father father = await FatherDBhelper.instance.insert(familyInfo.father);
      Mother mother = await MothersDBHelper.instance.insert(familyInfo.mother);
      ResponsiblePerson? responsiblePerson;
      if (familyInfo.responsiblePerson != null) {
        responsiblePerson = await ResponsiblePersonsDBHelper.instance
            .insert(familyInfo.responsiblePerson!);
      }
      Family family = await FamiliesDBHelper.instance.insert(
        //TODO: Generate Credentials
        Family(
            id: -1,
            userName: '123',
            password: '123',
            fatherId: father.id,
            motherId: mother.id,
            responsiblePersonId: responsiblePerson?.id),
      );
      student = student.copyWith(familyId: family.id);
    } else {
      student =
          student.copyWith(familyId: registrationInfo.familyInfo.family.id);
    }
    student = await insert(student);
    MedicalRecord medicalRecord =
        registrationInfo.medicalInfo.record.copyWith(studentId: student.id);
    await MedicalRecordsDBHelper.instance.insert(medicalRecord);
    for (Illness illness in registrationInfo.medicalInfo.illnesses) {
      StudentIllnessesDBHelper.instance.insert(
        StudentIllness(
            id: -1,
            medicalRecordId: medicalRecord.studentId,
            ilnessId: illness.id),
      );
    }
    for (TakenVaccine takenVaccine
        in registrationInfo.medicalInfo.takenVaccines) {
      TakenVaccinesDBHelper.instance.insert(
        TakenVaccine(
            id: -1,
            medicalRecordId: medicalRecord.studentId,
            vaccineId: takenVaccine.vaccineId,
            shotDate: takenVaccine.shotDate),
      );
    }
    if (registrationInfo.studentPreviousSchool != null) {
      StudentPreviousSchoolsDBHelper.instance.insert(
        StudentPreviousSchool(
            id: -1,
            studentId: student.id,
            previousSchoolId: registrationInfo.studentPreviousSchool!.id,
            note: registrationInfo.studentPreviousSchool!.note),
      );
    }
    YearRecordsDBHelper.instance.insert(
      YearRecord(
        id: -1,
        studentId: student.id,
        classId: registrationInfo.enrolledClass.id,
        schoolYearClassroomId: -1,
        didPass: false,
      ),
    );
    return student;
  }
}
