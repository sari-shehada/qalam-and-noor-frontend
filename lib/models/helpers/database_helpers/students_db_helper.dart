import 'dart:convert';
import 'package:kalam_noor/pages/teacher/fill_students_marks_page/models/student_exam_mark.dart';
import 'package:kalam_noor/pages/teacher/fill_students_marks_page/models/student_exam_mark_insertion.dart';

import '../../../pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/models/old_students_enrollment_dto.dart';
import '../../../pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/new_students_selection/models/new_student_enrollment_model.dart';
import '../../../pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/sub_pages/new_students_selection/models/new_students_enrollment_dto.dart';
import '../../../pages/secretary/students_management_page/student_profile/models/student_profile_model.dart';
import '../../../pages/secretary/students_management_page/student_score_page/models/student_scores.dart';
import '../../agendas/student.dart';
import '../../../pages/secretary/students_management_page/new_student_registration/personal_information/models/student_registration_info.dart';
import '../../../tools/logic_tools/crud_interface.dart';
import '../../../tools/logic_tools/network_service.dart';
import '../../educational/student_year_records.dart';
import '../../item_or.dart';
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

  Future<List<Student>> getStudentsInCurrentSchoolYear() async {
    String url = '${_controllerName}GetStudentsInCurrentSchoolYear';
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

  Future<int> getStudentCountInCurrentSchoolYear() async {
    return getStudentsInCurrentSchoolYear().then((value) => value.length);
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

  Future<List<StudentExamMark>> getStudentsExamMarks({
    required int examId,
    required int courseId,
    required int clasRoomId,
  }) async {
    String url =
        '${_controllerName}GetStudentExamMarks?examId=$examId&courseId=$courseId&clasRoomId=$clasRoomId';
    List<StudentExamMark> studentsMarks =
        await HttpService.getParsed<List<StudentExamMark>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return StudentExamMark.fromMap(e);
          },
        ).toList();
      },
    );
    return studentsMarks;
  }

  Future<List<NewStudentEnrollmentModel>> getAllNewStudentsByClassId(
      int classId) async {
    String url = '${_controllerName}GetNewStudentsByClassId?classId=$classId';
    List<NewStudentEnrollmentModel> newStudents =
        await HttpService.getParsed<List<NewStudentEnrollmentModel>, List>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return NewStudentEnrollmentModel.fromMap(e);
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

  Future<List<Student>> getActiveStudentsInSchoolYearByClassroomId(
      int id) async {
    String url =
        '${_controllerName}getActiveStudentsInSchoolYearByClassroomId?clasRoomId=$id';
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

  Future<ItemOr<String>> enrollNewStudentsToSchoolYear(
      NewStudentsEnrollmentDTO dto) async {
    String url = '${_controllerName}RegistrationNewStudentInSchoolYear';
    String result =
        await HttpService.rawPost(url: url, serializedBody: dto.toJson());
    ItemOr<String> parsedResponse = ItemOr.fromMap(jsonDecode(
      result,
    ) as Map<String, dynamic>);
    return parsedResponse;
  }

  Future<ItemOr<String>> addNewMarksToStudentExams({
    required StudentExamMarkInsertion studentExamMarkInsertion,
  }) async {
    String url = '${_controllerName}InsertStudentsMark';
    String result = await HttpService.rawPost(
        url: url, serializedBody: studentExamMarkInsertion.toJson());
    ItemOr<String> parsedResponse = ItemOr.fromMap(jsonDecode(
      result,
    ) as Map<String, dynamic>);
    return parsedResponse;
  }

  Future<ItemOr<String>> enrollOldStudentsToSchoolYear(
      OldStudentsEnrollmentDTO dto) async {
    String url = '${_controllerName}RegistrationOldStudentInSchoolYear';
    String result =
        await HttpService.rawPost(url: url, serializedBody: dto.toJson());
    ItemOr<String> parsedResponse = ItemOr.fromMap(jsonDecode(
      result,
    ) as Map<String, dynamic>);
    return parsedResponse;
  }

  Future<StudentProfileInfo> getStudentProfile(int id) async {
    String url = '${_controllerName}GetStudentProfileByStudentId?studentId=$id';
    StudentProfileInfo? student =
        await HttpService.getParsed<StudentProfileInfo, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return StudentProfileInfo.fromMap(responseData);
      },
    );
    return student;
  }

  Future<List<StudentScores>> getStudentScores({
    required int studentId,
    required int schoolYearId,
    required int semesterId,
  }) async {
    String url =
        '${_controllerName}GetStudentScoresBySchoolYearIdAndSemesterIdAndStudentId?semesterId=$semesterId&schoolYearId=$schoolYearId&studentId=$studentId';

    List<StudentScores> semesters =
        await HttpService.getParsed<List<StudentScores>, List>(
      url: url,
      dataMapper: (responseData) {
        return responseData
            .map(
              (e) => StudentScores.fromMap(e as Map<String, dynamic>),
            )
            .toList();
      },
    );

    return semesters;
  }
}
