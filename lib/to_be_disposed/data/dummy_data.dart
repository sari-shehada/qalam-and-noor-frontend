import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/agendas/responsible_person.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/educational/school_year.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/models/medical/student_illness.dart';

import '../../models/address/address.dart';
import '../../models/address/area.dart';

import '../../models/address/city.dart';
import '../../models/agendas/families.dart';
import '../../models/educational/class.dart';
import '../../models/educational/year_record.dart';
import '../../models/medical/illness.dart';
import '../../models/medical/medical_record.dart';
import '../../models/medical/psychological_status.dart';
import '../../models/medical/taken_vaccine.dart';
import '../../models/medical/vaccine.dart';
import '../../models/previous_schools/previous_schools.dart';
import '../../models/previous_schools/student_previous_school.dart';

List<City> dummyCities = [
  City(
    id: 1,
    name: 'النبك',
  ),
  City(
    id: 2,
    name: 'دير عطية',
  ),
  City(
    id: 3,
    name: 'دمشق',
  ),
];

List<Area> dummyAreas = [
  Area(
    id: 1,
    name: 'الحي الغربي',
    cityId: 1,
  ),
  Area(
    id: 2,
    name: 'الحي الشرقي',
    cityId: 1,
  ),
  Area(
    id: 3,
    name: 'السوق',
    cityId: 2,
  ),
  Area(
    id: 4,
    name: 'الجمعيات القديمة',
    cityId: 2,
  ),
  Area(
    id: 5,
    name: 'المزة',
    cityId: 3,
  ),
  Area(
    id: 6,
    name: 'المهاجرين',
    cityId: 3,
  ),
  Area(
    id: 7,
    name: 'الشعلان',
    cityId: 3,
  ),
  Area(
    id: 8,
    name: 'المزرعة',
    cityId: 3,
  ),
];

List<Address> dummyAddresses = [
  Address(
    id: 1,
    name: 'شارع ابو سيفو النفوري',
    details: 'مقابل مصبغة السلطان',
    areaId: 1,
  ),
  Address(
    id: 2,
    name: 'شارع امين',
    details: 'معمل ابو رجب',
    areaId: 1,
  ),
  Address(
    id: 3,
    name: 'شارع باسط',
    areaId: 1,
  ),
  Address(
    id: 4,
    name: 'الدريب',
    details: '',
    areaId: 2,
  ),
  Address(
    id: 5,
    name: 'شارع ٨ آذار',
    details: 'عيادة ميشيل بولص',
    areaId: 2,
  ),
  Address(
    id: 6,
    name: 'اسم العنوان',
    details: 'تفاصيل العنوان',
    areaId: 3,
  ),
  Address(
    id: 7,
    name: 'اسم العنوان',
    details: 'تفاصيل العنوان',
    areaId: 3,
  ),
  Address(
    id: 8,
    name: 'اسم العنوان',
    details: 'تفاصيل العنوان',
    areaId: 4,
  ),
  Address(
    id: 9,
    name: 'اسم العنوان',
    details: 'تفاصيل العنوان',
    areaId: 4,
  ),
];

List<Class> dummyClasses = [
  Class(id: 1, name: 'الصف الأول'),
  Class(id: 2, name: 'الصف الثاني'),
  Class(id: 3, name: 'الصف الثالث'),
  Class(id: 4, name: 'الصف الرابع'),
  Class(id: 5, name: 'الصف الخامس'),
  Class(id: 6, name: 'الصف السادس'),
  Class(id: 7, name: 'الصف السابع'),
  Class(id: 8, name: 'الصف الثامن'),
  Class(id: 9, name: 'الصف التاسع'),
];

List<PsychologicalStatus> dummyPsychologicalStatuses = [
  PsychologicalStatus(id: 1, name: 'عصبي'),
  PsychologicalStatus(id: 2, name: 'مزاجي'),
  PsychologicalStatus(id: 3, name: 'مشاغب'),
  PsychologicalStatus(id: 4, name: 'ذكي'),
  PsychologicalStatus(id: 5, name: 'عدائي'),
  PsychologicalStatus(id: 6, name: 'مسالم'),
];

List<Vaccine> dummyVaccines = [
  Vaccine(id: 1, name: 'شلل الاطفال'),
  Vaccine(id: 2, name: 'كورنا جرعة اولى'),
  Vaccine(id: 3, name: 'كورنا جرعة ثانية'),
  Vaccine(id: 4, name: 'كورنا جرعة داعمة'),
];

List<Illness> dummyIllnesses = [
  Illness(id: 1, name: 'ربو'),
  Illness(id: 2, name: 'فقر دم'),
];

List<Family> dummyFamilies = [
  Family(id: 1, userName: 'aaa', password: 'sss', fatherId: 1, motherId: 1),
];

List<Father> dummyFathers = [
  Father(
      id: 1,
      firstName: 'عدي',
      lastName: 'ع.',
      fatherName: 'أحمد',
      motherName: 'لانا',
      career: 'مهندس',
      placeOfResidence: 'الرياض',
      tieNumber: '200',
      tiePlace: 'النبك',
      placeOfBirth: 'النبك',
      dateOfBirth: DateTime.now(),
      civilRegisterSecretary: '1920',
      religion: Religion.islam,
      educationalStatus: EducationalStatus.master,
      phoneNumber: '09111111111',
      permenantAddress: 'النبك شارع الأديب'),
];

List<Mother> dummyMothers = [
  Mother(
      id: 1,
      firstName: 'هيا',
      lastName: 'ه.',
      fatherName: 'محمد',
      motherName: 'اميرة',
      doesLiveWithHasband: true,
      career: 'ربة منزل',
      tieNumber: '300',
      tiePlace: 'النبك',
      placeOfBirth: 'النبك',
      dateOfBirth: DateTime.now(),
      religion: Religion.islam,
      educationalStatus: EducationalStatus.bachelor,
      phoneNumber: '09xxx'),
];

List<ResponsiblePerson> dummyResponsiblePeople = [];

List<Student> dummyStudents = [];

List<MedicalRecord> dummyMedicalRecords = [];

List<TakenVaccine> dummyTakenVaccines = [];
List<StudentIllness> dummyStudentIllnesses = [];

List<SchoolYear> dummySchoolYears = [];

List<PreviousSchool> dummyPreviousSchools = [];
List<StudentPreviousSchool> dummyStudentPreviousSchools = [];

List<YearRecord> dummyYearRecords = [];
