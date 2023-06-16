import 'dart:convert';

import '../../../pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/new_students_selection/models/school_year_student_registration_model.dart';
import '../../agendas/student.dart';
import '../../../pages/secretary/students_management_page/new_student_registration/personal_information/models/student_registration_info.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';
import '../../educational/student_year_records.dart';
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

  Future<List<Student>> getAllSuccessfulStudentsByClassId(int classId) async {
    String url =
        '${_controllerName}GetSuccessfulStudentsByClassId?classId=$classId';
    List<Student> successfulStudents =
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
    return successfulStudents;
  }

  Future<List<Student>> getAllFailingStudentsByClassId(int classId) async {
    String url =
        '${_controllerName}GetFailingStudentsByClassId?classId=$classId';
    List<Student> failingStudents =
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
    return failingStudents;
  }

  Future<List<SchoolYearNewStudentRegistrationModel>>
      getAllNewStudentsByClassId(int classId) async {
    String url = '${_controllerName}GetNewStudentsByClassId?classId=$classId';
    List<SchoolYearNewStudentRegistrationModel> newStudents = await HttpService
        .getParsed<List<SchoolYearNewStudentRegistrationModel>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return SchoolYearNewStudentRegistrationModel.fromMap(e);
          },
        ).toList();
      },
    );
    return newStudents;
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

  Future<List<StudentYearRecords>> getStudentYearRecordsByStudentId(
      {required int studentId}) async {
    String url =
        '${_controllerName}GetStudentYearRecordsByStudentId?studentId=$studentId';
    List<StudentYearRecords> studentSchoolYearRecords =
        await HttpService.getParsed<List<StudentYearRecords>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return StudentYearRecords.fromMap(e);
          },
        ).toList();
      },
    );
    return studentSchoolYearRecords;
  }
}
