import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/models/agendas/family.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/models/helpers/database_helpers/student_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/taken_vaccines_db_helper.dart';
import 'package:kalam_noor/models/medical/illness.dart';
import 'package:kalam_noor/models/medical/medical_record.dart';
import 'package:kalam_noor/models/medical/taken_vaccine.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/models/family_info.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/models/medical_info.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/models/student_personal_info.dart';
import 'package:kalam_noor/pages/new_student_registration/personal_information/models/student_registration_info.dart';
import 'package:test/test.dart';

void main() {
  test('Testing Student Addition', () async {
    StudentRegistrationInfo registrationInfo = StudentRegistrationInfo(
      personalInfo: StudentPersonalInfo(
        publicRecordId: 12,
        firstName: 'Test From Unit Test',
        isMale: true,
        dateOfBirth: DateTime.now(),
        placeOfBirth: 'Place Of Birth Unit',
        phoneNumber: '09999999',
        religion: Religion.christianity,
        whatsappPhoneNumber: '09999999',
        incidentNumber: '123123',
        incidentDate: DateTime.now(),
        landLine: '0000009123123',
        joinDate: DateTime.now(),
      ),
      familyInfo: FamilyInfo(
        family: Family(
          id: -1,
          userName: 'Test Family From Unit Test',
          password: 'test123',
          fatherId: -1,
          motherId: -1,
        ),
        father: Father(
          id: -1,
          firstName: 'Test Father Name From Unit Test',
          lastName: 'Last Name Father Unit Test',
          fatherName: 'Father Name Unit Test',
          motherName: 'Mother Name Unit Test',
          career: 'Doctor Unit Test Career',
          placeOfResidence: 'Sweden Test Unit Test',
          tieNumber: '12312312',
          tiePlace: 'Test Tie Place From Unit Test',
          placeOfBirth: 'Place of birth Unit Test',
          dateOfBirth: DateTime.now(),
          civilRegisterSecretary: 'civilRegisterSecretary  Unit Test',
          religion: Religion.islam,
          educationalStatus: EducationalStatus.basic,
          phoneNumber: '0009999999',
          permenantAddress: 'permenantAddress  Unit Test',
        ),
        mother: Mother(
            id: -1,
            firstName: 'firstName mom  Unit Test',
            lastName: 'lastName mother  Unit Test',
            fatherName: 'fatherName mother  Unit Test',
            motherName: 'motherName  Unit Test',
            doesLiveWithHasband: true,
            career: ' Career Unit Test',
            tieNumber: 'tieNumber  Unit Test',
            tiePlace: 'tiePlace  Unit Test',
            placeOfBirth: 'placeOfBirth  Unit Test',
            dateOfBirth: DateTime.now(),
            religion: Religion.islam,
            educationalStatus: EducationalStatus.master,
            phoneNumber: '01231242378687'),
        //TODO: Test Non null value here
        responsiblePerson: null,
      ),
      medicalInfo: MedicalInfo(
        record:
            MedicalRecord(studentId: -1, studentHight: 56, studentWeight: 123),
        illnesses: <Illness>[
          Illness(id: 1, name: ''),
          Illness(id: 2, name: ''),
          Illness(id: 3, name: ''),
          Illness(id: 4, name: ''),
          Illness(id: 5, name: ''),
          Illness(id: 6, name: ''),
          Illness(id: 7, name: ''),
        ],
        takenVaccines: <TakenVaccine>[
          TakenVaccine(
            id: -1,
            medicalRecordId: -1,
            vaccineId: 14,
            shotDate: DateTime.now(),
          ),
          TakenVaccine(
            id: -1,
            medicalRecordId: -1,
            vaccineId: 15,
            shotDate: DateTime.now(),
          ),
          TakenVaccine(
            id: -1,
            medicalRecordId: -1,
            vaccineId: 16,
            shotDate: DateTime.now(),
          ),
        ],
      ),
      address: Address(
        id: 2,
        name: 'name',
        areaId: -1,
      ),
      enrolledClass: SchoolClass(id: 3, name: 'Test Unit Test name'),
      studentPreviousSchool: null,
    );

    Student result = await StudentDBHelper.instance
        .registerNewStudent(registrationInfo: registrationInfo);
    print(result.toString());
    expect(result, result);
  });
}
