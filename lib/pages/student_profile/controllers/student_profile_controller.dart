import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/address/area.dart';
import 'package:kalam_noor/models/address/city.dart';
import 'package:kalam_noor/models/agendas/family.dart';
import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/helpers/database_helpers/area_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/cities_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/families_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/illnesses_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/medical_records_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/vaccines_db_helper.dart';
import 'package:kalam_noor/models/medical/medical_record.dart';
import 'package:kalam_noor/models/medical/student_illness_info.dart';
import 'package:kalam_noor/models/medical/student_vaccines_info.dart';
import 'package:kalam_noor/pages/new_student_registration/address_information/models/student_address_info.dart';
import '../../../models/address/address.dart';
import '../../../models/helpers/database_helpers/addresses_db_helper.dart';
import '../../../models/helpers/database_helpers/student_psychological_statuses_db_helper.dart';
import '../../../models/medical/student_psychological_status.dart';

class StudentProfileController extends GetxController {
  StudentProfileController({
    required this.student,
  });
  Rx<Student> student;

  late Future<ImageProvider> profileImage;

  Future<IconData> getStudentGender() async {
    if (student.value.isMale) {
      return Icons.male;
    }
    return Icons.female;
  }

  Future<StudentAddressInfo> getFUllAddress() async {
    Address? address =
        await AddressesDBHelper.instance.getById(student.value.addressId);
    Area? area = await AreasDBHelper.instance.getById(address!.areaId);
    City? city = await CitiesDBHelper.instance.getById(area!.cityId);
    return StudentAddressInfo(city: city!, area: area, address: address);
  }

  Future<Family?> getFamily() async {
    return FamiliesDBHelper.instance.getById(student.value.familyId);
  }

  Future<MedicalRecord?> getMedicalRecord() async {
    return MedicalRecordsDBHelper.instance.getById(student.value.id);
  }

  Future<List<StudentPsychologicalStatus>> getAllPsychologicalStatuses() async {
    return StudentPsychologicalStatusesDBHelper.instance
        .getAllByMedicalRecordId(student.value.id);
  }

  Future<List<StudentIllnessInfo>> getAllStudentIllnesses() async {
    return IllnessesDBHelper.instance.getAllStudentIllnesses(student.value.id);
  }

  Future<List<StudentVaccineInfo>> getAllStudentTakenVaccines() async {
    return VaccinesDBHelper.instance
        .getAllStudentTakenVaccines(student.value.id);
  }
}
