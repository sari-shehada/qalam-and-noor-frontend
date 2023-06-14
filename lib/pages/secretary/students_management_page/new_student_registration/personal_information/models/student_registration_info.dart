// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kalam_noor/models/address/address.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/previous_schools/student_previous_school.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/family_information/models/family_info.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/medical_information/models/medical_info.dart';
import 'package:kalam_noor/pages/secretary/students_management_page/new_student_registration/personal_information/models/student_personal_info.dart';

class StudentRegistrationInfo {
  final StudentPersonalInfo personalInfo;
  final FamilyInfo familyInfo;
  final MedicalInfo medicalInfo;
  final Address address;
  final StudentPreviousSchool? studentPreviousSchool;
  final SchoolClass enrolledClass;
  StudentRegistrationInfo({
    required this.personalInfo,
    required this.familyInfo,
    required this.medicalInfo,
    required this.address,
    this.studentPreviousSchool,
    required this.enrolledClass,
  });
}
