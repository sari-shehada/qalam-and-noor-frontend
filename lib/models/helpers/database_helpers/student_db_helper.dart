import 'package:kalam_noor/models/agendas/families.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/agendas/responsible_person.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/helpers/database_helpers/illnesses_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/previous_schools_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/student_family_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/vaccines_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/year_records_db_helper.dart';
import 'package:kalam_noor/models/medical/illness.dart';
import 'package:kalam_noor/models/medical/student_illness.dart';
import 'package:kalam_noor/models/medical/taken_vaccine.dart';
import 'package:kalam_noor/models/previous_schools/student_previous_school.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/models/family_info.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/models/student_personal_info.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/models/student_registration_info.dart';
import '../../../to_be_disposed/data/dummy_data.dart';
import '../../medical/medical_record.dart';

abstract class StudentDBHelper {
  static Future<Student> registerNewStudent(
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
      whatsappNumber: personalInfo.whatsappNumber,
      incidentNumber: personalInfo.incidentNumber,
      dateOfIncident: personalInfo.dateOfIncident,
      landline: personalInfo.landline,
      addressId: registrationInfo.address.id,
      joinDate: personalInfo.joinDate,
      familyId: -1,
    );
    if (familyInfo.family.id == -1) {
      Father father = await StudentFamilyDBHelper.addFather(familyInfo.father);
      Mother mother = await StudentFamilyDBHelper.addMother(familyInfo.mother);
      ResponsiblePerson? responsiblePerson;
      if (familyInfo.responsiblePerson != null) {
        responsiblePerson = await StudentFamilyDBHelper.addResponsiblePerson(
            familyInfo.responsiblePerson!);
      }
      Family family = await StudentFamilyDBHelper.addFamily(
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
    student = await addStudent(student);
    MedicalRecord medicalRecord =
        registrationInfo.medicalInfo.record.copyWith(id: student.id);
    await addStudentMedicalRecord(medicalRecord);
    for (Illness illness in registrationInfo.medicalInfo.illnesses) {
      //FIXME:
      // IllnessesDBHelper.addStudentIllness(StudentIllness(
      //     id: -1, medicalRecordId: medicalRecord.id, illnessId: illness.id));
    }
    for (TakenVaccine takenVaccine
        in registrationInfo.medicalInfo.takenVaccines) {
          //FIXME:
      // VaccinesDBHelper.addStudentTakenVaccine(
      //   TakenVaccine(
      //       id: -1,
      //       medicalRecordId: medicalRecord.id,
      //       vaccineId: takenVaccine.vaccineId,
      //       shotDate: takenVaccine.shotDate),
      // );
    }
    if (registrationInfo.studentPreviousSchool != null) {
      PreviousSchoolsDBHelper.addStudentPreviousSchool(
        StudentPreviousSchool(
            id: -1,
            studentId: student.id,
            previousSchoolId:
                registrationInfo.studentPreviousSchool!.previousSchoolId,
            notes: registrationInfo.studentPreviousSchool!.notes),
      );
    }
    YearRecordsDBHelper.addStudentYearRecord(
        studentId: student.id, classId: registrationInfo.enrolledClass.id);
    return student;
  }
}

Future<Student> addStudent(Student student) async {
  //TODO: Change to API Call
  student = student.copyWith(id: dummyStudents.length);
  dummyStudents.add(student);
  return student;
}

Future<MedicalRecord> addStudentMedicalRecord(
    MedicalRecord medicalRecord) async {
  dummyMedicalRecords.add(medicalRecord);
  return medicalRecord;
}
