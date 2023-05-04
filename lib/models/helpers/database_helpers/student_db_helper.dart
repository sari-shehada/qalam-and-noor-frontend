import 'dart:convert';

import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/student_registration_model.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/models/student_registration_info.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';

class StudentDBHelper implements CRUDInterface<Student> {
  String get _controllerName => 'StudentController/';
  static StudentDBHelper get instance => StudentDBHelper();

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

  Future<int> getStudentsCount() async {
    final List allStudents = await getAll();
    return allStudents.length;
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

  Future<bool> registerStudent(
      StudentRegistrationModel registrationModel) async {
    String url = '${_controllerName}RegisterStudent';
    String result = await HttpService.rawPost(
        url: url, serializedBody: registrationModel.toJson());
    Map<String, dynamic> parsedResponse =
        jsonDecode(result) as Map<String, dynamic>;
    bool insertResult = parsedResponse['success'] as bool;
    return insertResult == true
        ? true
        : throw Exception(
            parsedResponse['message'] as String,
          );
  }

  Future<bool> registerNewStudent(
      {required StudentRegistrationInfo registrationInfo}) async {
    final StudentRegistrationModel registrationModel = StudentRegistrationModel(
      family: registrationInfo.familyInfo.family,
      father: registrationInfo.familyInfo.father,
      mother: registrationInfo.familyInfo.mother,
      responsiblePerson: registrationInfo.familyInfo.responsiblePerson,
      medicalRecord: registrationInfo.medicalInfo.record,
      illnesses: registrationInfo.medicalInfo.illnesses,
      takenVaccines: registrationInfo.medicalInfo.takenVaccines,
      studentPreviousSchool: registrationInfo.studentPreviousSchool,
      enrolledClass: registrationInfo.enrolledClass,
      student: Student(
        id: -1,
        publicRecordId: registrationInfo.personalInfo.publicRecordId,
        firstName: registrationInfo.personalInfo.firstName,
        isMale: registrationInfo.personalInfo.isMale,
        dateOfBirth: registrationInfo.personalInfo.dateOfBirth,
        placeOfBirth: registrationInfo.personalInfo.placeOfBirth,
        phoneNumber: registrationInfo.personalInfo.phoneNumber,
        religion: registrationInfo.personalInfo.religion,
        whatsappPhoneNumber: registrationInfo.personalInfo.whatsappPhoneNumber,
        incidentNumber: registrationInfo.personalInfo.incidentNumber,
        incidentDate: registrationInfo.personalInfo.incidentDate,
        landLine: registrationInfo.personalInfo.landLine,
        addressId: registrationInfo.address.id,
        joinDate: registrationInfo.personalInfo.joinDate,
        leaveDate: null,
        familyId: -1,
      ),
    );
    return await registerStudent(registrationModel);
  }
}

//  final FamilyInfo familyInfo = registrationInfo.familyInfo;
//     final StudentPersonalInfo personalInfo = registrationInfo.personalInfo;
//  Student student = Student(
//       id: -1,
//       publicRecordId: personalInfo.publicRecordId,
//       firstName: personalInfo.firstName,
//       isMale: personalInfo.isMale,
//       dateOfBirth: personalInfo.dateOfBirth,
//       placeOfBirth: personalInfo.placeOfBirth,
//       phoneNumber: personalInfo.phoneNumber,
//       religion: personalInfo.religion,
//       whatsappPhoneNumber: personalInfo.whatsappPhoneNumber,
//       incidentNumber: personalInfo.incidentNumber,
//       incidentDate: personalInfo.incidentDate,
//       landLine: personalInfo.landLine,
//       addressId: registrationInfo.address.id,
//       joinDate: personalInfo.joinDate,
//       leaveDate: null,
//       familyId: -1,
//     );
//     if (familyInfo.family.id == -1) {
//       print('adding a new family');
//       print('adding father info');
//       Father father = await FatherDBhelper.instance.insert(familyInfo.father);
//       print('adding mother info');
//       Mother mother = await MotherDBHelper.instance.insert(familyInfo.mother);
//       ResponsiblePerson? responsiblePerson;
//       if (familyInfo.responsiblePerson != null) {
//         print('adding responsible person info');
//         responsiblePerson = await ResponsiblePersonDBHelper.instance
//             .insert(familyInfo.responsiblePerson!);
//       }
//       print('adding family info');
//       Family family = await FamiliesDBHelper.instance.insert(
//         //TODO: Generate Credentials
//         Family(
//             id: -1,
//             userName: '123',
//             password: '123',
//             fatherId: father.id,
//             motherId: mother.id,
//             responsiblePersonId: responsiblePerson?.id),
//       );
//       student = student.copyWith(familyId: family.id);
//     } else {
//       print(
//           'assigning familyId to student (family already exists in the system)');
//       student =
//           student.copyWith(familyId: registrationInfo.familyInfo.family.id);
//     }
//     print('adding student info');
//     student = await insert(student);
//     MedicalRecord medicalRecord =
//         registrationInfo.medicalInfo.record.copyWith(studentId: student.id);
//     print('adding student medical record info');
//     await MedicalRecordsDBHelper.instance.insert(medicalRecord);
//     print(
//         'Adding student illnesses ${registrationInfo.medicalInfo.illnesses.length}');
//     for (Illness illness in registrationInfo.medicalInfo.illnesses) {
//       print('Adding student illness');
//       StudentIllnessesDBHelper.instance.insert(StudentIllness(
//           id: -1,
//           medicalRecordId: medicalRecord.studentId,
//           ilnessId: illness.id));
//     }
//     print(
//         'Adding student taken vaccines ${registrationInfo.medicalInfo.takenVaccines.length}');
//     for (TakenVaccine takenVaccine
//         in registrationInfo.medicalInfo.takenVaccines) {
//       print('Adding student taken vaccine');
//       TakenVaccinesDBHelper.instance.insert(
//         TakenVaccine(
//             id: -1,
//             medicalRecordId: medicalRecord.studentId,
//             vaccineId: takenVaccine.vaccineId,
//             shotDate: takenVaccine.shotDate),
//       );
//     }
//     if (registrationInfo.studentPreviousSchool != null) {
//       print('Adding student previous school');
//       StudentPreviousSchoolsDBHelper.instance.insert(
//         registrationInfo.studentPreviousSchool!.copyWith(
//           studentId: student.id,
//         ),
//       );
//     }
//     print('Adding student year record');
//     YearRecordsDBHelper.instance.insert(
//       YearRecord(
//         id: -1,
//         studentId: student.id,
//         classId: registrationInfo.enrolledClass.id,
//         schoolYearClassroomId: -1,
//         didPass: false,
//       ),
//     );
//     print('Finished Registering a new student');