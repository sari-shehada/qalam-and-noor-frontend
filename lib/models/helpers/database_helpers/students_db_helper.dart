import 'dart:convert';

import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/models/student_registration_info.dart';
import 'package:kalam_noor/tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';
import '../../student_registration_model.dart';

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

  Future<int> getStudentsCount() async {
    final List allStudents = await getAll();
    return allStudents.length;
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

  Future<List<Student>> getStudentWithoutPsychologicalStatuses() async {
    String url = '${_controllerName}GetStudentsWhoDontHavePsychologicalStatus';
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
        isActive: true,
      ),
    );
    return await registerStudent(registrationModel);
  }
}
