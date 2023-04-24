import 'package:kalam_noor/models/agendas/families.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/agendas/responsible_person.dart';
import 'package:kalam_noor/to_be_disposed/data/dummy_data.dart';

abstract class StudentFamilyDBHelper {
  static Future<Father> addFather(Father father) async {
    //TODO: Change to API Call
    father = father.copyWith(id: dummyFathers.length);
    dummyFathers.add(father);
    return father;
  }

  static Future<Mother> addMother(Mother mother) async {
    //TODO: Change to API Call
    mother = mother.copyWith(id: dummyMothers.length);
    dummyMothers.add(mother);
    return mother;
  }

  static Future<ResponsiblePerson> addResponsiblePerson(
      //TODO: Change to API Call
      ResponsiblePerson responsiblePerson) async {
    responsiblePerson =
        responsiblePerson.copyWith(id: dummyResponsiblePeople.length);
    dummyResponsiblePeople.add(responsiblePerson);
    return responsiblePerson;
  }

  static Future<Family> addFamily(Family family) async {
    //TODO: Change to API Call
    family = family.copyWith(id: dummyFamilies.length);
    dummyFamilies.add(family);
    return family;
  }
}
